<!--
  This is your project's front page. Replace every placeholder below.
  It is the first thing your instructor and any future employer will read, and
  the live link in it is how your project gets opened for grading.

  New here? Read START-HERE.md first. Delete this comment when you are done.
-->

# Personal Coffee App

> The here is a personal Flutter app for creating and keeping coffee brewing recipes and the variables that may affect the outcome of the drink. Said variables are: grind size, roast, brew time, and the brew method (currently supports moka pot, french press, and cold brew). It currently supports the Timemore C3ESP grinder.

**Live demo:** https://blue-cynic.github.io/Personal-Coffee-App/ <!-- GitHub Pages is set up already; replace if you host elsewhere -->
**Demo video:** `docs/demo.mp4` (link it here once it exists)
**Course:** Applications Development and Emerging Technologies (6ADET), Holy Angel University
**Author:** Raizen Espinosa

This repository lives in the author's own GitHub account and is public on
purpose. There is no `student.json` here and there should not be one: see
`docs/06-security-and-privacy.md` for what a public repo means for secrets and
personal data.

---

## Screenshots

| Home | Ratio Calculator | Stopwatch |
| --- | --- | --- |
| ![Home](https://github.com/Blue-Cynic/Personal-Coffee-App/blob/main/docs/assets/3-1.png) | ![Ratio Calculator](https://github.com/Blue-Cynic/Personal-Coffee-App/blob/main/docs/assets/3-2.png) | ![Stopwatch](https://github.com/Blue-Cynic/Personal-Coffee-App/blob/main/docs/assets/3-3.png) |

| Grind Setting | Notes |
| --- | --- |
| ![Grind Setting](https://github.com/Blue-Cynic/Personal-Coffee-App/blob/main/docs/assets/3-4.png) | ![Notes](https://github.com/Blue-Cynic/Personal-Coffee-App/blob/main/docs/assets/3-5.png) |

## What it does

- The app can calculate the water needed for a coffee dose whilst providing a strength label (strong, balanced, and mild).
- Can time a brew with the stopwatch
- Suggests the number of clicks for a grinder (currently the Timemore C3ESP only) based on the roast type and the brew type.
- Saves recipes (which contain brew type, coffee-to-water ratio, grind setting, temperature, taste notes, roast type, and the amount of coffee and water) to a notes app.

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

Then open http://localhost:8080. Requires Flutter (run `flutter --version` and
put yours here).

### Environment variables

There is none. The app does not use API keys, .env files, nor backend URL.

## Privacy and secrets

The app stores coffee recipes only on the user's device, through `hive_ce`. Nothing is sent anywhere.
There is no backend, account, nor analytics. There are no API keys and secrets used, so the deploy workflow has neither to use.
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

Be honest. What works, what is half done, what you would build next. An honest
"known issues" section reads better than a claim the reader disproves in thirty
seconds.
**What works**: Calculator, stopwatch, grind setting suggester, notes, bottom nav bar, data persistence through `hive_ce`, and calculator screen to notes screen hand-off.

## Credits

- Packages: see `pubspec.yaml`
- Assets: No custom images nor fonts. Icons and fonts are from Flutter.

## AI use

This section is the last 10 points of the finals badge, and it wants three
things:

![Built with AI assistance](https://img.shields.io/badge/built%20with-AI%20assistance-0b5fff)

claude by Anthropic and ChatGPT by OpenAI were used in assisting with the creation of this app. Be it through explaining concepts of Flutter, assisting with writing code, and assisting with the documentation.
- a link to [AI-USAGE.md](AI-USAGE.md), where the full account lives

Keep the detail in `AI-USAGE.md` rather than here. This section is the summary a
visitor reads; that file is the record the badge is graded from.

## Licence

MIT, see [LICENSE](LICENSE). Change it if you want different terms.
