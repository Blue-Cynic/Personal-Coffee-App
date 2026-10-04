# AI usage

## 1. How I used AI

### 2026-09-19 - Boilerplate Designer

- **Tool:** Claude
- **What I asked for:** I asked Claude if it could give me a good foundation for all my screens that follows my mockup. Essentially, asking Claude to give me boilerplate code that does a good job in depicting the design of my mockup.
- **What it gave back:** A good base template to work with for my screens.
- **What I kept, what I changed, and why:** I kept a good chunk of it because it is a foundation to the screens. Of course, I had to make changes to adapt it, particularly for stopwatch and ratio calculator.
- **Commit:** https://github.com/Blue-Cynic/Personal-Coffee-App/commit/d8bef42568ff5ef0ba88c698590bc82639c844da

### 2026-09-19 - Stopwatch Got Me Stopped

- **Tool:** Claude
- **What I asked for:** I asked Claude if it could assist me with the logic of the stopwatch for my stopwatch screen. This is because I am not well versed in StatefulWdigets.
- **What it gave back:** Claude gave me a working stopwatch.
- **What I kept, what I changed, and why:** I kept most of it, just to preserve the logic as it worked well. As for changes, I changed a good bit of it because what Claude provided did not closely resemble my mockup. So I ensured the stopwatch works and looks just like in my mockup.
- **Commit:** https://github.com/Blue-Cynic/Personal-Coffee-App/commit/d8bef42568ff5ef0ba88c698590bc82639c844da

### 2026-09-19 - Calculated Help

- **Tool:** Claude
- **What I asked for:** I asked Claude to help me build the logic for `ratio_calculator.dart` as I was a little stumped.
- **What it gave back:** Being specific with what I asked for, Claude gave me a chunk of code to work with, but not the whole thing.
- **What I kept, what I changed, and why:** I kept pretty much the entire thing because all I asked for was the code that drives the calculator to work. What changed was the fact it was put inside of a screen I built for it. As for why, I had some trouble with the handling of inputs and calculations at first. Given the time constraints of the week, I had to use Claude for this one or else I'd get stumped for too long on it.
- **Commit:** https://github.com/Blue-Cynic/Personal-Coffee-App/commit/d8bef42568ff5ef0ba88c698590bc82639c844da

### 2026-09-22 - Brewing the Brew Notes

- **Tool:** ChatGPT
- **What I asked for:** I asked ChatGPT if it can give me clues for brew notes
- **What it gave back:** It gave me clues on brew notes, which then I applied some of. I realized that what it gave me was lacking and not really in scope of what I actually have in mind. A drastic overhaul by me was eventually done.
- **What I kept, what I changed, and why:** I kept the general structure yet changed much of everything else to be in line with my proposal.
- **Commit:** https://github.com/Blue-Cynic/Personal-Coffee-App/commit/05c32cdf00f9d86d9da200ac8d58aa58a3e09c95

### 2026-09-22 - The Grind on the Grind Settings

- **Tool:** ChatGPT
- **What I asked for:** Like with brew notes, I asked for clues for grind settings.
- **What it gave back:** It gave me some clues on how to go about it
- **What I kept, what I changed, and why:** I kept the core idea but changed a good chunk because like with notes, it was obvious the AI was straying from the actual idea. An example is it adding light roast so I had to remove it. Still, was kinda useful because it let me know it will not be painful to add light roast in the future.
- **Commit:** https://github.com/Blue-Cynic/Personal-Coffee-App/commit/05c32cdf00f9d86d9da200ac8d58aa58a3e09c95

### 2026-09-27 - Strength Badge Strain

- **Tool:** Claude
- **What I asked for:** I asked Claude for help in integrating my strength badge calculator.
- **What it gave back:** Claude gave blocks of modified code for notes and ratio calculator which will use the strength badge calculator.
- **What I kept, what I changed, and why:** I kept it all and changed nothing. As for why, time constraints. However, I did read the blocks of code and tested what Claude had. The outcomes were good, so I accepted them as is.
- **Commit:** https://github.com/Blue-Cynic/Personal-Coffee-App/commit/9e27ad08fa148d5e38ccddf1817bbf8a08f39b2c

## 2. Where the AI got it wrong

Three cases. Be specific. If you write that the AI was never wrong, this section
scores zero.

### Case 1 - Transitioned to Fury

- **What it gave me:** Screen transitions with the boiler plate we worked on.
- **What was wrong with it:** The boilerplate code I and Claude worked with had fancy screen transitions which I liked at first. However, after a colleague tested my app, I realized there were issues. He pointed out that the nav bar transitions alongside the screen. So, what was once a nifty thing turned into an annoyance.
- **What I did instead:** I effectively removed the screen transitions after getting tired of trying to fix it. The app feels more responsive this way. This was done with the creation of `MainShell`, which holds the nav bar and swaps the screen above it without pushing routes, which means no more transitions.
- **Commit:** https://github.com/Blue-Cynic/Personal-Coffee-App/commit/d8bef42568ff5ef0ba88c698590bc82639c844da#diff-935e56a557f0ab902a679f47de66345d9f47058bccb96f870e6383d19e2c86dd

### Case 2 - Ratio Calculator Should be Ratio'd on X

- **What it gave me:** Asked help with getting the screens to hand off data to the notes screen.
- **What was wrong with it:** There was an overflow issue with the ratio calculator
- **What I did instead:** Added in `Expanded` within the text output of `ratio_card.dart`. It lets the text wrap instead of trying to push the badge off.
- **Commit:** https://github.com/Blue-Cynic/Personal-Coffee-App/commit/4c3be774c42818b035ad8a9131137006abb25b98#diff-785072aa90e74eb371c8dadd6a30c00e4f394b9af13f9b7e618b0d47773b4c99

### Case 3 - Stopwatch is a Time Stopper

- **What it gave me:** Given the massive overhaul to turn my in-line code to reusable widgets, I asked AI for some help.
- **What was wrong with it:** The stopwatch would soft lock the entire app. This had to do with the timer display widget and my new `theme.dart`. The theme demanded every button to be as wide as they can. The old timer would put three buttons in a row, side by side. There was no width limit, so they demanded infinite width, causing the app to fail.
- **What I did instead:** Each button was wrapped in `Expanded`, so they all get an equal share of the row's width. This made the buttons behave as intended, and no longer freezes the app. 
- **Commit:** https://github.com/Blue-Cynic/Personal-Coffee-App/commit/4a5caced3155f592c8bb7d74cdeee382cc836fc2

## 3. Who wrote what

### Written by me
These are some of the files that I worked on. These are the commits where such work was done. There is a good chance some of them did eventually get help from AI, most likely from when I begun implementing reusable widgets.

- **File:** notes_screen.dart
- **Commit:** https://github.com/Blue-Cynic/Personal-Coffee-App/commit/7104c3d573bdd94478e62f764f60af3d2403ad35
- **What it does and why it is built this way:** So, this is the so-called notes overhaul that was needed in order for notes to truly live up to what was proposed and be capable of what is in the plan and in my mind when I envisioned the coffee app. I know it received some changes later in the newer commits, but, this is the one that was made by me. Any changes after this commit were done with myself and/or assistance of an AI. Of all the files I have worked on, this is the one I am the proudest of and the one I find best to explain. This is because the notes screen is to me, the most important screen of this entire app. For it can stand on its own without the other screens handing off data to it. Without further ado:
What it does: So, `BrewNote` holds the entire recipe, which basically means every variable for coffee. The old one pretty much held only a method and a string. To save, you just press Save. This makes the Brew Note dialog turn the form into a BrewNote and write it to the notes Hive box. To show the notes, the screen reads every note from that box, sorts them to the most recent being at the top, and puts them all in a list. Each title shows the brew method, the coffee-to-water ratio, the roast type, the grind settings, the strength label, and the taste notes. To check the inputs, Save will do nothing unless coffee and water inputs are actually numbers and that coffee's inputs are not zero. The other number fields will just default to 0.
Why is it built this way: The use of `toMap` and `fromMap` is because Hive uses plain maps. Having these methods written by hand prevents the generation of Hive adapters, which keeps things easy for baby's first app. The date is stored as an ISO text string because maps hold simple values. `tempCelsius` is read as a `num` and converted, because a number like 92 can be an `int`. Now, `_notes` is a getter that reads the box on every build, and `_addNote` writes to the box and calls for `SetState`. There is no second list that is kept in memory, so the screen and the saved data cannot drift apart. Ratio, which is dividing water and coffee are calculated at save time. The ratio and the appropriate strength label are stored in their note. Any rule changes with strength label will not rewrite old notes. The form is wrapped in `SingleChildScrollView`. This lets the seven fields fit in small screens with the keyboard active. The brew method and roast type live in plain local variables because the dropdowns have no need to rebuild anything. The controllers are disposed of in `.then` after the dialog closes. This keeps memory leaks from happening.

- **File:** grind_settings_screen.dart
- **Commit:** https://github.com/Blue-Cynic/Personal-Coffee-App/commit/9a21032f4d5ac386ba575e7f0153812772163490
- **What it does and why it is built this way:** This screen has the settings in a `static const` map that is keyed by method and by the roast. A lookup table then fits here in this case because the data will not change during runtime. The `_method` and `_roast state` variables drive a null-safe getter, `_clicks`, which will read the matching entry. When a user changes a dropdown, `setState` will rebuild the screen with the new value. I also changed the placeholder values after doing proper research about my grinder and reading its manual. The map's type also changed to `Map<String, Map<String, String>>` from `Map<String, Map<String, int>>`. This is to enable me to put in grind settings to be like "30-40" clicks instead of being locked to just 30. After all, microadjustments can still be made if you feel the coffee tastes off, so having a range makes more sense than just one grind setting.

- **File:** ratio_calculator_screen.dart
- **Commit:** https://github.com/Blue-Cynic/Personal-Coffee-App/commit/9e27ad08fa148d5e38ccddf1817bbf8a08f39b2c
- **What it does and why it is built this way:** This screen will turn a coffee dose and a brew ratio to the amount of water needed. `_calculateWater` parses both of those inputs which are currently text, with `double.tryParse`. `_calculateWater` then multiplies the coffee grams by ratio, and stores the output in a state. Two extra features are added in. The first one is the strength badge, where `calculateStrengthLabel` will return an output of Strong for any ratio that is 14 or below. Balanced would be up to 17 whilst Mild will be anything more than that. A `Chip` beside the water result will display the strength label. This function was also moved from notes_screen.dart into brew_calculations.dart. The second feature is the ability to save to notes. `_saveToNotes` checks if the coffee value is valid and that a result does exist. It then pushes `NotesScreen` and passes the coffee grams and the water grams as constructor arguments. `NotesScreen` will then read them in `initState` and opens the add note dialog with their respective fields already filled in. It then waits for `addPostFrameCallback` for a dialog needs a fully built context. Passing data through a constructor means the two screens are coupled, even if loosely. It also keeps the user from having to manually put in the data again when they already did so in the previous screens.
A future rework, particularly with strength label also happened in a later commit in order to properly reflect strength labels based on brew type. After all, a brew ratio of 10 is considered balanced for a moka pot, but strong for french press.

### The AI-written part I understand best

- **Files:** primary_button.dart, recipe_list_tile.dart
- **Commit:** https://github.com/Blue-Cynic/Personal-Coffee-App/commit/4a5caced3155f592c8bb7d74cdeee382cc836fc2
- **What it does and why we kept it:** So, I decided to include two files here instead of just one. I had some help with some of the widgets, particularly the more complex ones. The simpler ones, such as these two, are instead made completely with AI. It clearly shows given that none of the ones I would consider fairly basic had no issues nor troubleshooting from my end.
What they do: So, these are part of my commit which were turning in-line code amongst screens into reusable widgets. This is to make my life easy if I need to make some UI changes as I only change them and not every screen. `PrimaryButton` is one filled button that will take a label, an optional icon, and a callback. If an icon is given, it will build a `FilledButton.icon`. Else, it will instead build a plain `FilledButton`. `RecipeListTile` on the other hand, is one card that shows a title card, a subtitle, and an optional tap action. Before, every screen had in-line buttons and cards. Calculator had its own `FilledButton.icon` whilst Notes had its own `Card` and `ListTile`. They get replaced by these new widgets.
Why I kept them: Biggest reason I kept them is because I am pretty sure my proposal mentioned the use of such widgets. Clearly, that put me in a bit of a panic because I was doing things in-line. So, I needed help with AI to speed up progress instead of getting stuck, which would suck because of the really bad time constraints. Other reason is because, it makes it easy for me to make UI changes in the future, should I need to do so. I won't have to fiddle around and juggle multiple screens and their code. And lastly, I checked their code and tested them myself and found nothing wrong with them. My biggest gripes were really with the more complex widgets, which I fixed some before committing and the others after committing because I missed some bugs. If you ever wonder why I missed some bugs, I did mostly light testing because I was in a panic and in a hurry. So, I would only ever find the more egregious bugs when I was admiring my work.
