# Third-party notices

**MIDI Piano (MidiPiano)** is © 2026 Per Hejndorf and is licensed under the [MIT License](LICENSE), except where stated below. This file lists the third-party components and assets it uses, each under its own licence. Licence texts and copyright notices are kept by the upstream projects at the *Source* links; where a licence requires its notice to travel with the files, a copy is shipped next to them.

_Last reviewed: 2026-11-27. Versions are the ones resolved in this repository at that date; Dependabot keeps the NuGet packages current, so check the project files for the exact version of a given release._

## Libraries included in the application

| Library | Version | Licence | Source | Modified |
|---|---|---|---|---|
| .NET runtime and Blazor WebAssembly (shipped in `_framework/`) | 10.0 | MIT | [dotnet/runtime](https://github.com/dotnet/runtime), [dotnet/aspnetcore](https://github.com/dotnet/aspnetcore) | No |
| Microsoft.AspNetCore.Components.WebAssembly | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.AspNetCore.Components.WebAssembly/10.0.15) | No |
| soundfont-player (`wwwroot/js/lib/soundfont-player.min.js`, © 2015 Daniel Gómez Blasco; licence in `soundfont-player.LICENSE.txt` next to it) | 0.12.0 | MIT | [danigb/soundfont-player](https://github.com/danigb/soundfont-player), [npm](https://www.npmjs.com/package/soundfont-player/v/0.12.0) | No (the published `dist/soundfont-player.min.js`) |

<details>
<summary>Indirect (transitive) dependencies — 26 packages</summary>

These packages are pulled in by the libraries above and are shipped with the application. All are used unmodified.

| Library | Version | Licence | Source | Modified |
|---|---|---|---|---|
| Microsoft.AspNetCore.App.Internal.Assets | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.AspNetCore.App.Internal.Assets/10.0.15) | No |
| Microsoft.AspNetCore.Authorization | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.AspNetCore.Authorization/10.0.15) | No |
| Microsoft.AspNetCore.Components | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.AspNetCore.Components/10.0.15) | No |
| Microsoft.AspNetCore.Components.Forms | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.AspNetCore.Components.Forms/10.0.15) | No |
| Microsoft.AspNetCore.Components.Web | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.AspNetCore.Components.Web/10.0.15) | No |
| Microsoft.AspNetCore.Metadata | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.AspNetCore.Metadata/10.0.15) | No |
| Microsoft.Extensions.Configuration | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.Configuration/10.0.15) | No |
| Microsoft.Extensions.Configuration.Abstractions | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.Configuration.Abstractions/10.0.15) | No |
| Microsoft.Extensions.Configuration.Binder | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.Configuration.Binder/10.0.15) | No |
| Microsoft.Extensions.Configuration.FileExtensions | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.Configuration.FileExtensions/10.0.15) | No |
| Microsoft.Extensions.Configuration.Json | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.Configuration.Json/10.0.15) | No |
| Microsoft.Extensions.DependencyInjection | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.DependencyInjection/10.0.15) | No |
| Microsoft.Extensions.DependencyInjection.Abstractions | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.DependencyInjection.Abstractions/10.0.15) | No |
| Microsoft.Extensions.Diagnostics | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.Diagnostics/10.0.15) | No |
| Microsoft.Extensions.Diagnostics.Abstractions | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.Diagnostics.Abstractions/10.0.15) | No |
| Microsoft.Extensions.FileProviders.Abstractions | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.FileProviders.Abstractions/10.0.15) | No |
| Microsoft.Extensions.FileProviders.Physical | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.FileProviders.Physical/10.0.15) | No |
| Microsoft.Extensions.FileSystemGlobbing | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.FileSystemGlobbing/10.0.15) | No |
| Microsoft.Extensions.Logging | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.Logging/10.0.15) | No |
| Microsoft.Extensions.Logging.Abstractions | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.Logging.Abstractions/10.0.15) | No |
| Microsoft.Extensions.Options | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.Options/10.0.15) | No |
| Microsoft.Extensions.Options.ConfigurationExtensions | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.Options.ConfigurationExtensions/10.0.15) | No |
| Microsoft.Extensions.Primitives | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.Primitives/10.0.15) | No |
| Microsoft.Extensions.Validation | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.Extensions.Validation/10.0.15) | No |
| Microsoft.JSInterop | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.JSInterop/10.0.15) | No |
| Microsoft.JSInterop.WebAssembly | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.JSInterop.WebAssembly/10.0.15) | No |

</details>

## Build, test and tooling (not distributed)

Used to build, test or render promotional material only; not part of the shipped application. The last three are referenced automatically by the .NET SDK.

| Library | Version | Licence | Source | Modified |
|---|---|---|---|---|
| Microsoft.AspNetCore.Components.WebAssembly.DevServer | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.AspNetCore.Components.WebAssembly.DevServer/10.0.15) | No |
| Microsoft.AspNetCore.Components.Analyzers | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.AspNetCore.Components.Analyzers/10.0.15) | No |
| Microsoft.NET.ILLink.Tasks | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.NET.ILLink.Tasks/10.0.15) | No |
| Microsoft.NET.Sdk.WebAssembly.Pack | 10.0.15 | MIT | [NuGet](https://www.nuget.org/packages/Microsoft.NET.Sdk.WebAssembly.Pack/10.0.15) | No |

## Fonts

Served with the app from `wwwroot/fonts/`; no font is loaded from Google Fonts or any other CDN.

| Font | Files | Licence | Source | Modified |
|---|---|---|---|---|
| Manrope (variable, weights 200–800, Latin subset) © 2019 The Manrope Project Authors | `manrope-latin-wght.woff2`, licence in `Manrope-OFL.txt` | SIL Open Font License 1.1 | [sharanda/manrope](https://github.com/sharanda/manrope), packaged by [Fontsource](https://www.npmjs.com/package/@fontsource-variable/manrope/v/5.3.0) 5.3.0 | No (Fontsource's Latin subset, renamed) |
| DM Mono (400 and 500, Latin subset) © 2020 The DM Mono Project Authors | `dm-mono-latin-400-normal.woff2`, `dm-mono-latin-500-normal.woff2`, licence in `DMMono-OFL.txt` | SIL Open Font License 1.1 | [googlefonts/dm-mono](https://github.com/googlefonts/dm-mono), packaged by [Fontsource](https://www.npmjs.com/package/@fontsource/dm-mono/v/5.3.0) 5.3.0 | No |

## Online services

| Service | Used for | Terms |
|---|---|---|
| [gleitz/midi-js-soundfonts](https://github.com/gleitz/midi-js-soundfonts) on GitHub Pages (`gleitz.github.io`) | soundfont-player fetches the instrument samples (`FluidR3_GM/<instrument>-mp3.js`) from here when audio is enabled or the instrument is changed. The visitor's browser connects to GitHub Pages directly; the app sends no data of its own. | Repository: MIT. Samples: rendered from the FluidR3_GM SoundFont, released under [Creative Commons Attribution 3.0](https://creativecommons.org/licenses/by/3.0/us/) (as stated in that repository); the app credits them in its footer. The samples are not shipped with this project. GitHub Pages is operated by GitHub, Inc. under the [GitHub Privacy Statement](https://docs.github.com/site-policy/privacy-policies/github-general-privacy-statement). |

## Icons, images, audio and video

| Asset(s) | Origin | Licence |
|---|---|---|
| `art/icon.svg`, `src/MidiPiano/wwwroot/icons/` (8 files: .png, rendered from `art/icon.svg` by `tools/make-icons.ps1`) | Drawn by the author as plain SVG shapes (piano keys and sound waves, written with an AI coding agent), not made with an image-generation tool. No fonts, emoji or third-party artwork are used | MIT (as part of this project) |
| `images/banner.png` | Screenshot of the app, taken by `tools/make-banner.ps1` | MIT (as part of this project) |
| Piano keyboard in the app | Drawn with HTML and CSS by the app's own code (`Pages/Home.razor`, `wwwroot/css/app.css`) | MIT (as part of this project) |
| Instrument sounds | Not shipped: fetched at run time from the online service above | CC BY 3.0 (see above) |
| Symbols in the interface (♯ ✓ 🗙 and others) | Not shipped: drawn at run time by the fonts installed on the user's device | — |

No data files are shipped, and the app makes no network requests beyond loading itself and the instrument samples above.

## Trademarks

Microsoft, Windows, .NET, Blazor and other Microsoft product names are trademarks of the Microsoft group of companies. MIDI is a trademark of the Association of Musical Electronics Industry (AMEI) and The MIDI Association. Google Fonts is a trademark of Google LLC. All other product names, logos and brands mentioned in this repository are the property of their respective owners. They are used only to identify the services and tools this project works with, and their use does not imply endorsement.
