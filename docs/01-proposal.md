# Proposal

Prelim Proposal: [Prelim Proposal](assets/Espinosa%20App%20Proposal.pdf)

Midterm Proposal: [Midterm Proposal](assets/Proposal%20V2.pdf)

## The problem, in one sentence
My coffee is inconsistent because I struggle to keep track of my recipes and the variables that can affect it like grind size, roast type, and brewing time.

## Who it is for
This is for me because I am a coffee addict who happens to brew with 3 brewing methods: the moka pot, the french press, and cold brew. I am also supported by a Timemore C3ESP hand grinder and a Timemore Black Mirror 3 coffee scale. I also do not make any attempt in recording any of my recipes or variables, leading to inconsistent coffee.

## Core features
| # | Feature | Still in the MVP? | Flutter pieces it needs | Honest estimate |
| - | --- | --- | --- | --- |
| 1 | Ratio Calculator | keep | 2 TextFields for water and coffee grams, a StatefulWidget recalculating on every keystroke, Container or badge for the live strength label | 12 hours |
| 2 | Grind Setting | keep (stick to one grinder for the release version) | 2 DropdownButtonFormFields for brew type and roast level, a Dart Map lookup table, Container for the results | 12 hours |
| 3 | Stopwatch | keep | StatefulWidget with setState, Dart's Timer.periodic for the function, 3 ElevatedButtons for start, stop, and reset | 24 hours |
| 4 | Notes | keep | ListView.builder for saved recipes, showDialog or new-screen form with TextFields, Navigator.push for detail view, hive_ce box read/write | 24 hours |

## Out of scope, and why
- Multiple grinders like the Comandante C40 and Kingrinder K2. This is because of time constraints and due to that meaning having to do more research for click settings for each grinder. Decided the MVP will be about the grinder I do own, the Timemore C3ESP.
- Dark mode. Time constraint, having to make another theme and whatnot for dark mode will take time. Such time can be used on more important things. Will be rolled out in an update or so.

## Data the app remembers, and where it is saved
| Thing | Fields | Where it is saved |
| --- | --- | --- |
| Recipe | brewMethod, coffeeGrams, waterGrams, ratio, strengthLabel, roastLevel, grindSetting, brewTimeSeconds, tasteNotes, tempCelsius, dateCreated | hive_ce local box, notes |
| Grinder profile (Timemore C3ESP only for MVP) | brewMethod, roastLevel, clickSetting | Dart Map constant in code (static reference data, not user data) |

## Risks
- **The risk I named last time:** The risk I had was whether or not I was biting off more than I can chew by having 3 grinders to research grind settings for 3 brew types and 2 types of roast levels.
- **A new risk I did not see before:** It is my own inability to be focused and to be good with Dart and UI design. It is part of why my estimated times are so high. A risk I now believe in is probably not having the adequate time to finish this in a timely manner.
- **For each: what is my first step to reduce it, and when?** I suppose I should lock in and do proper time management. If I do that, it should make things easier for me and allow me to beat the high estimations I gave myself. Definitely practice more Dart and Flutter. As to when, before and after exams, especially before. Why? I will be reviewing Dart and Flutter anyway, which will also benefit my ability in developing my app.

## Changes since the last version

## September 28, 2026:

So, I have been hard at work in ensuring my app lives up to what was said in the proposal. That said, I feel that the UI is not a 1:1 recreation of what I had proposed. Not saying that is bad, I just feel a tad bit disappointed in myself. I am working hard to try and match my app with what I proposed, even if it is very difficult and will cause bugs, which is happening right now with the latest build.

## September 30, 2026:

Some more drastic changes were done due to my dissatisfaction with the previous build of the app and from a valid criticism from a friend. The screen transitions were pretty much removed because they were too much trouble for me. The UI of the screens with the mockup are still not an exact match with the ones in the actual app, but I am fine with it because the functionality is there and it is not at all aesthetically offensive. Did also add an extra nav bar icon which was not present in the mockup as well. However, handing off data to the notes screen feels good now and I am happy with how it turned out.
Of course, a major issue is the fact that there is no recent recipe screens. I will just have to add it in a later build.
