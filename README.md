# Personal Coffee App

> This here is a personal Flutter app for creating and keeping coffee brewing recipes and the variables that may affect the outcome of the drink. Said variables are: grind size, roast, brew time, and the brew method (currently supports moka pot, french press, and cold brew). It currently supports the Timemore C3ESP grinder.

**Live demo:** https://blue-cynic.github.io/Personal-Coffee-App/
**Demo video:** `docs/demo.mp4` (link it here once it exists)
**Course:** Applications Development and Emerging Technologies (6ADET), Holy Angel University
**Author:** Raizen Espinosa

---

## Screenshots

| Home | Ratio Calculator | Stopwatch |
| --- | --- | --- |
| ![Home](https://github.com/Blue-Cynic/Personal-Coffee-App/blob/main/docs/assets/4-1.png) | ![Ratio Calculator](https://github.com/Blue-Cynic/Personal-Coffee-App/blob/main/docs/assets/4-2.png) | ![Stopwatch](https://github.com/Blue-Cynic/Personal-Coffee-App/blob/main/docs/assets/4-4.png) |

| Grind Setting | Notes |
| --- | --- |
| ![Grind Setting](https://github.com/Blue-Cynic/Personal-Coffee-App/blob/main/docs/assets/4-3.png) | ![Notes](https://github.com/Blue-Cynic/Personal-Coffee-App/blob/main/docs/assets/4-5.png) |

## What it does

- The app can calculate the water needed for a coffee dose whilst providing a strength label (strong, balanced, and mild).
- Can time a brew with the stopwatch
- Suggests the number of clicks for a grinder (currently the Timemore C3ESP only) based on the roast type and the brew type.
- Saves recipes (which contain brew type, coffee-to-water ratio, grind setting, temperature, taste notes, roast type, and the amount of coffee and water) to a notes screen.

## Built with

| | |
| --- | --- |
| Framework | Flutter (Dart) |
| State | `setState` |
| Storage | `hive_ce`, saved locally on the device (browser storage on web) |
| Other packages | `hive_ce_flutter` (Hive setup for Flutter), `device_preview` (phone frame for the web build) |

## Running it yourself

```bash
git clone https://github.com/Blue-Cynic/Personal-Coffee-App.git
cd Personal-Coffee-App
flutter pub get
flutter run -d web-server --web-port 8080
```

Then open http://localhost:8080. Requires Flutter 3.47.2 or higher.

### Environment variables

There is none. The app does not use API keys, .env files, nor backend URL.

## Privacy and secrets

The app stores coffee recipes only on the user's device, through `hive_ce`. Nothing is sent anywhere.
There is no backend, account, nor analytics. There are no API keys and secrets used, so the deploy workflow has no secrets to use.
All the sample data, screenshots, and the video are invented. No personal data nor information are used.

## Project documentation

| Document | |
| --- | --- |
| [Proposal](docs/01-proposal.md) | the problem, the users, the scope |
| [Mockup and wireframes](docs/02-mockup.md) | what it looks like, and the screen flow |
| [Design system](docs/03-design-system.md) | colors, type, spacing, components |
| [Weekly reports](docs/04-weekly-reports.md) | what happened each week |
| [Demo video](docs/05-demo-video.md) | the recording and what it shows |
| [Start here](START-HERE.md) | how this repo works (delete once you have read it) |
| [Security and privacy](docs/06-security-and-privacy.md) | the checklist, filled in |

## Status and what is next

**What works**: Calculator, stopwatch, grind setting suggester, notes, bottom nav bar, data persistence through `hive_ce`, and calculator screen to grind settings screen, then to stopwatch screen, then to notes screen hand-off.
**Next**: Add the recent notes, dark mode, and expand the grinder and brew type options
**Known Issues**: The new notes tab increases whenever you type a certain amount in its box

## Credits

- Packages: see `pubspec.yaml`
- Assets: No custom images nor fonts. Icons and fonts are from Flutter.

## AI use

This section is the last 10 points of the finals badge, and it wants three
things:

![Built with AI assistance](https://img.shields.io/badge/built%20with-AI%20assistance-0b5fff)

Claude by Anthropic and ChatGPT by OpenAI were used in assisting with the creation of this app. Be it through explaining concepts of Flutter, assisting with writing code, and assisting with the documentation.
- a link to [AI-USAGE.md](AI-USAGE.md), where the full account lives

## Licence

MIT, see [LICENSE](LICENSE). Change it if you want different terms.
