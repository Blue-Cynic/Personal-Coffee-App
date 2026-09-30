# Design system

![Design system V2 (PDF)](https://github.com/Blue-Cynic/Personal-Coffee-App/blob/main/docs/assets/Espinosa%20Design%20System%20V2.pdf)

## Palette

The app is currently light mode only. One seed color is the driver of the entire scheme `ColorScheme.fromSeed` generates the other roles from it, so the code will set only three colors by hand.

| Role | Value | Used for |
| --- | --- | --- |
| Seed color | `#6F4E37` | The generated color scheme, and the app bar background |
| App bar text | White | Screen titles in the app bar |
| Hint text | `#8A6E5C` | The `labelSmall` text style |
| `primary` | Generated | Filled buttons, icons on the Home cards |
| `primaryContainer` | Generated | Fill for the ratio result card and the grind result card |

Every other color, such as the surface, error, and outline come from the generated scheme.Widgets read colors by role name through `Theme.of(context).colorScheme`. None of the widgets use a hardcoded color.

## Type scale

The theme sets three text styles. Widgets read them by name through `Theme.of(context).textTheme`.

| Style | Size and weight | Used for |
| --- | --- | --- |
| `titleLarge` | 22, bold | The suggested click setting on the grind result card |
| `bodyLarge` | 16, regular | Labels, result text, and the brew method line |
| `labelSmall` | 12, regular, `#8A6E5C` | Hints and small notes |

Three more styles come from Flutter's defaults. `titleMedium` and `bodySmall` are used on the Home cards and the Home helper text. `displayLarge` is used for the timer readout.

## Spacing

All spacing values live in the `AppSpacing` class in `theme.dart`.

| Name | Value | Used for |
| --- | --- | --- |
| `xs` | 4 | Tight gaps |
| `sm` | 8 | Gaps between related items, and the card margin |
| `md` | 16 | Screen padding, and gaps between fields and sections |
| `lg` | 24 | Gaps before results and before the main action |

Other theme settings:

- Filled buttons are full width and at least 48 tall.
- Cards have an 8 margin.

## Components

One row per reusable widget: what it is, which file it lives in, what parameters it takes, which screens use it.

Each widget takes data and callbacks. None of them hold their own state.

| Widget | What it is | File | Parameters | Used on |
| --- | --- | --- | --- | --- |
| PrimaryButton | Filled button with an optional icon | `primary_button.dart` | `label`, `onPressed`, `icon` (optional) | Home, Calculator, Grind, Timer |
| OutlineButton | Outlined button for secondary actions | `outline_button.dart` | `label`, `onPressed` | Timer (Reset) |
| LabeledTextField | Outlined text field with a label and an optional unit | `labeled_text_field.dart` | `label`, `controller`, `unit`, `onChanged`, `keyboardType` | Calculator |
| DropdownSelector | Outlined dropdown with a label | `dropdown_selector.dart` | `label`, `options`, `selected`, `onChanged` | Calculator, Grind |
| StrengthBadge | Small chip showing a strength label | `strength_badge.dart` | `label` | Calculator, inside RatioCard |
| RatioCard | Card with water and coffee grams and a strength badge | `ratio_card.dart` | `waterGrams`, `coffeeGrams`, `ratio`, `strengthLabel` | Calculator |
| GrindResultCard | Card with the suggested click setting | `grind_result_card.dart` | `roastLevel`, `grinder`, `clickSetting` | Grind |
| TimerDisplay | Time readout with Start, Stop, and Reset buttons | `timer_display.dart` | `currentTime`, `isRunning`, `onStart`, `onStop`, `onReset` | Timer |
| RecipeListTile | Card with a title and a two line subtitle | `recipe_list_tile.dart` | `title`, `subtitle`, `onTap` (optional) | Notes |
| AppNavBar | Bottom navigation with icons and labels | `app_nav_bar.dart` | `activeRoute`, `onSelect` | Every screen, through `MainShell` |

## Changes since the last version

- There is a lack of recent recipes on the home screen. RecipeListTile is only used on Notes for now. Will likely add it in.
- The nav bar is now one shared AppNavBar inside `MainShell`, not one per screen. Screens swap in place, so the bar no longer animates when the user switches screens.
- The nav bar now has five tabs: Home, Calc, Grind, Timer, and Notes.
- Home now has a Start Brewing button above the four cards/buttons of the other screens.
- The palette is now defined by the seed color alone. The V2 hex table for secondary, surface, background, and error is not set in the code.
- StrengthBadge appears only on the Calculator, within RatioCard. Notes shows the strength as plain text.
- RatioCard takes `ratio` but does not show it. GrindResultCard takes `roastLevel` and `grinder` but shows only the click setting.
- A few widgets still use raw numbers, such as 8, 12, 16, and 32, instead of `AppSpacing`.
