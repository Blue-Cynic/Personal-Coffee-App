# Personal Coffee App

## Overview

The here is a personal Flutter app for creating and keeping coffee brewing recipes and the variables that may affect the outcome of the drink. Said variables are: grind size, roast, brew time, and the brew method (currently supports moka pot, french press, and cold brew). It currently supports the Timemore C3ESP grinder.

## Setup and installation

- Flutter: 3.47.2
- Dart: 3.13.2

1. Clone the repo:
   ```
   git clone https://github.com/Blue-Cynic/Personal-Coffee-App
   cd Personal-Coffee-App
   ```
2. Install dependencies:
   ```
   flutter pub get
   ```
3. No API keys or configuration required at this stage.

## How to run it

```
flutter run -d chrome
```

If all goes right, you will see the app open within a phone-frame preview showing the home screen and the four feature cards: Ratio Calculator, Brew Stopwatch, Grind Setting, and Notes.

## Features and usage

**Ratio Calculator** — enter coffee dose (grams) and a ratio; water amount needed is calculated live as you type. enter a coffee dose and a coffee-to-water ratio. The quantity of water is calculated as you type.

**Brew Stopwatch** — a stopwatch with start, stop, and reset for buttons. Will show minutes:seconds.

**Grind Setting** *(to be done)* — currently a placeholder screen. Will suggest a grind setting based on the brew method chosen.

**Notes** *(to be done)* — currently a placeholder screen. Will let you log notes per brew, backed by `hive_ce`.

## Project structure

```
lib/
  main.dart                        # Entry point, theme, DevicePreview wrapper
  screens/
    home_screen.dart               # Navigation hub, done
    ratio_calculator_screen.dart   # Done
    stopwatch_screen.dart          # Done
    grind_settings_screen.dart     # To be done, placeholder
    notes_screen.dart              # To be done, placeholder
```

## Screenshots
![home screen](1-1.png)
![ratio calculator](1-2.png)
![stopwatch](1-3.png)
![grinder settings](1-4.png)
![notes](1-5.png)


## Known issues and next steps

- Grind settings and notes are not yet implemented.
- No way to store data yet. `hive_ce` still not yet implemented. Nothing is saved for now.
- No automated tests yet.
- Next steps: do the two remaining screens, integrate `hive_ce`, test responsive layout across screen sizes, and ensure app looks like what was in the mockup, design systems, and proposal
