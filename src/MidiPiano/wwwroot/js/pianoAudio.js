// Browser audio adapter. The C# UI calls these exported functions through JS interop.
let audioContext;
let currentInstrument;
let loadingInstrument = null;
const activeNotes = new Map();
let keyboardInstalled = false;

const INSTRUMENTS = [
  "acoustic_grand_piano", "electric_piano_1", "honkytonk_piano",
  "drawbar_organ", "acoustic_guitar_nylon", "electric_guitar_clean",
  "violin", "cello", "string_ensemble_1", "flute", "trumpet", "synth_strings_1"
];

// soundfont-player (MIT, see js/lib/soundfont-player.LICENSE.txt) is served with the app and loaded by
// index.html. It fetches the instrument samples from gleitz.github.io/midi-js-soundfonts.
function ensureLibrary() {
  if (!window.Soundfont) throw new Error("The soundfont-player library did not load.");
}

export async function initialize(instrumentName) {
  ensureLibrary();
  audioContext ??= new (window.AudioContext || window.webkitAudioContext)();
  await audioContext.resume();
  await changeInstrument(instrumentName);
}

export async function changeInstrument(instrumentName) {
  if (!audioContext) throw new Error("Click Enable audio first.");
  if (!INSTRUMENTS.includes(instrumentName)) throw new Error("Unknown instrument.");
  if (loadingInstrument === instrumentName) return;
  loadingInstrument = instrumentName;
  try {
    const loaded = await window.Soundfont.instrument(audioContext, instrumentName, {
      soundfont: "FluidR3_GM",
      format: "mp3",
      gain: 0.8,
      // Samples are fetched from the MIDI.js soundfont repository.
    });
    releaseAll();
    currentInstrument = loaded;
  } finally {
    loadingInstrument = null;
  }
}

export async function noteOn(note, velocity = 100) {
  if (!audioContext || !currentInstrument) return;
  await audioContext.resume();
  noteOff(note);
  const source = currentInstrument.play(note, audioContext.currentTime, {
    gain: Math.max(0.01, Math.min(1, velocity / 127))
  });
  activeNotes.set(note, source);
}

export function noteOff(note) {
  const source = activeNotes.get(note);
  if (!source) return;
  activeNotes.delete(note);
  try { source.stop(audioContext.currentTime); } catch { }
}

export function releaseAll() {
  for (const note of [...activeNotes.keys()]) noteOff(note);
}

export function installKeyboard() {
  if (keyboardInstalled) return;
  keyboardInstalled = true;

  const keyToNote = {
    a: 60, w: 61, s: 62, e: 63, d: 64,
    f: 65, t: 66, g: 67, y: 68, h: 69, u: 70, j: 71, k: 72
  };
  const pressed = new Set();

  window.addEventListener("keydown", event => {
    if (event.repeat || event.ctrlKey || event.altKey || event.metaKey) return;
    if (event.target instanceof HTMLElement &&
        (event.target.isContentEditable || ["INPUT", "SELECT", "TEXTAREA"].includes(event.target.tagName))) return;
    const note = keyToNote[event.key.toLowerCase()];
    if (note === undefined || pressed.has(event.key.toLowerCase())) return;
    pressed.add(event.key.toLowerCase());
    noteOn(note, 100);
  });

  window.addEventListener("keyup", event => {
    const key = event.key.toLowerCase();
    const note = keyToNote[key];
    if (note === undefined) return;
    pressed.delete(key);
    noteOff(note);
  });

  window.addEventListener("blur", () => {
    pressed.clear();
    releaseAll();
  });
}
