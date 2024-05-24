# crystecks
Digital card dueling game with sharable/playable usermade content.

## Main Concept
A decentralized card dueling game. Players earn coins from ai matches or matches with friends. They can buy the Vanilla packs provided by me through updates, or can buy a Set Printer which let's them build and share their own Set that other players can also Share and buy packs from. Card effects are programmatic, like conditions and actions that the player can fill out on their own, and the art is a bunch of stickers that can have filters, tints, and backgrounds. Card Game format/style would be mostly inspired by Magic The Gathering. All duels and set sharing would happen with local communications, wifi/bluetooth and wifi-direct. In theory this would create small localized meta-game structures for each small community and friend group who participates.

## Game Structure, Sets/Packs, and Cards

### Game Structure
- Turn based
  - Phases; upkeep, draw, play, combat, post combat, end
- 6 Crystals representing Elemental Attunements, Faction, Gameplay identity, and emotional energy.
- Starting Health of 20
- Max health of 30

### Crystals / Colors
RGBCMY (a fun nod to virtual colorspace)

- Prism (Has no distinct properties, neutral)
- Red
  - Fire Element
  - Passion, Excitement
  - Impatient, Wrath
- Green
  - Earth/Nature Element
  - Adaptive, Lively
  - Stubborn, Simple
- Blue
  - Water Element
  - Caring, Sophisticated
  - Excessive, Undeterred
- Cyan
  - Air/Wind Element
  - Gentle, Relaxed
  - Lazy, Apathetic
- Magenta
  - Illusion Element
  - Playful, Clever
  - Deceitful, Conniving
- Yellow
  - Stable Element
  - Proud, Orderly
  - Cold, Close-Minded

Crystals would be integers behind the scenes, referring to an enum table.
```
[Prism, Red, Green, Blue, Cyan, Magenta, Yellow]

[0, 1, 2, 3, 4, 5, 6]
```

For Rules regarding Single Color or Multicolor, we're playing off the Light and Crystal theme, using the words `Monochromatic` and `Dichromatic`. I highly doubt this project could be copyright struck for describing quantities of color on a card; I just think chromatic is a fun word.
- Possibily replacing "Dichromatic" with "Polychromatic"

### Crystal Spectrum
A classification listing what functionalities each Crystal has access too, akin to the Color-Pie.

WIP. Mainly need to touch on gameplay points of Speed, Recovery, Strength, Flexibility.

### Sets and Packs
Players can make and distribute Sets. Sets have 30 cards made by the player. Connecting players can choose to also distribute the set. Upon accepting the set, they have to approve or disapprove the name and art of each card, using rng to replace if they don't like it. After a set has been accepted and approved, other connecting players can accept it in the future, and they too have to approve it. Also the player gets 3 free packs after approving it. Packs contain 5 cards, but each card comes in pairs, bringing a total of 10.

#### Set Paradigms
Sets are designed by restrictions called Paradigms. The Paradigm types are integral to the set, and would labeled on the packs. Currently I have conceived 6 Paradigms. The main point is to restrict the distribution of supremely powerful cards and help make powerful cards feel special. The side effect is communities can make custom rules to only use a certain set, or collection of sets, and the Paradigms help form a structure for balanced distribution of the Card Types.

 - Hybrid Paradigm
   - 3 of 6 Crystal pairs are chosen, and are thus Dichromatic (aka multicolored).
   - The Crystal pairs can intercept.
   - There has to be 1 Mythic for each chosen Crystal pair, 2 Rares, 2 Uncommons, and the rest Common.
     - Example without interceptions.
     - Cyan + Red gets 1 Mythic, 2 Rares, 2 Uncommons, and 5 Commons. For a total of 10
     - Magenta + Green gets the same, 1 Mythic, 2 Rares, 2 Uncommons, and 5 Commons.
     - Yellow + Blue. 1 Mythic, 2 Rares, 2 Uncommons, 5 Commons.
     - Example with interceptions.
     - Red + Yellow
     - Yellow + Blue
     - Blue + Red
 - Standard Paradigm
   - Use all 6 Crystals
   - Each Crystal has to have 5 Monochromatic cards. 
   - Rarity Table: 1 Mythic, 1 Rare, 1 Uncommon and 2 Common.
 - Prismatic Paradigm
   - Use all 6 Crystals
   - Each Crystal has to have 3 Monochromatic cards, and 2 Dichromatic.
   - Uses Standard Rarity Table.
     - Example:
     - Red has 3 Monochromatic cards, a Red + Green and a Red + Yellow
     - Green has 3 Monochromaic cards, a Green + Red and a Green + Blue
     - etc.
 - Pyramid Paradigm
   - One Crystal is chosen to have the most, then 2 for fewer, 2 more for even less, then the last gets only one, and it has to be Mythic.
   - The chosen one Crystal gets 1 Rare, 4 Uncommons, and 4 Commons.
   - The next 2 down get 2 Rares and 2 Uncommons, 2 Commons.
   - The next and final 2 down get 1 Mythic, 1 Rare, 2 Uncommons.
     - Example: We choose Green as the Tier 1, Red and Blue as Tier 2, Cyan and Yellow as Tier 3, and Magenta as Outcast
     - Green gets 9 Cards: 1 Rare, 4 Uncommon, 4 Common
     - Red and Blue get 6 Cards each, total of 12: 2 Rare, 2 Uncommon, 2 Common
     - Cyan and Yellow get 4 Cards each, total of 8: 1 Mythic, 1 Rare, 2 Uncommon
     - Magenta gets 1 Mythic card.
 - Duel Paradigm
   - 2 Crystals are chosen.
   - 15 cards to each, all Monochromatic.
   - Each gets 1 Mythic, 2 Rares, 4 Uncommon, 8 Common.
     - Example: 15 Red, and 15 Blue.
 - Void Paradigm
   - Any amount of any Crystal, Mono or Di-Chromatic.
   - 6 Rares, 12 Uncommon, 12 Common.
   - No Mythics.

When crafting the Sets, each Paradigm will have a step by step process. So the Standard and Primsatic Paradigm will have 6 tabs/steps the player can switch through for each Crystal requirement. The Pyramid will have steps for each tier. Void will be just one single step. Hybrid will have a declaration of colors step, then assigning cards to those 3 declarations.


### Cards / Card Creation
All created cards will be using predefined Condition, Action code structure. Label all these like C1C2E3 internally. This way if someone gets the same card by chance from the same set or different they receive a partial refund. Also this helps with reducing file size for transferring the cards. 

Card properties are as follows:
- An Image within a colored Border
- A String for the Name
- An Array of integers for the cost
  - 2 Prism and 2 Magenta would be `[Prism, Prism, Magenta, Magenta]` or just `[0, 0, 5, 5]`
- An integer for card type, most likely enum
  - `[Fiend, Spell, Cantrip, Charm]`
- A follow-up integer enum for subtype
  - Fiends may have a whole table of Fiend Types or Occupations like "Rabbit Warrior" or "Frog Receptionist" idk I haven't gotten that far yet
  - Spells and Cantrips probably won't make much use of this.
  - Charms could have "Battlefield Charm" or "Fiend Charm" or "Player Charm".
- Power and Health for Fiends, ignore otherwise
  - Default values of `0`
- Array of Effect Codes

How Card Images will be made is currently undecided.
- Sticker system, where players arrange and color stickers in an area?
- Camera Access?
- Draw/Paint tools?
- Can't really stop anyone from making offensive content here...

All Condition Action Triggers or CATS will have Rarity levels to associate with the Rarity of card template, as well as Crystal Restrictions. Making a card for the player should start with what Crystal, then CATS load in a list depending on Rarity and Crystal. The effects and themes will be based on the Crystal Spectrum. Some CATS will be commonplace, and basically become Keywords. 
- Card Effects and abilities all have a hard cap of 3 triggers, until next upkeep.

How CATS are provided during creation is currently undecided.
- Limited Randomly decided amount?
- Access to ALL possible CATS for a Crystal/Color?
- Limit based on chosen Paradigm?

Players should be able to combine multiple weaker level CATS on a powerful card, or use a single powerful CAT.

## Visual Style
Glow Fairy Crystal Forest. Very Colorful and Elemental.

## Concerns / Worries
- Too Close to the insirpation: Magic The Gathering?
  - I'm currently ill-equipped to know every single word combination and contextual situation that Hasbro/Wizards has trademarked.
- Set Builder Too Complicated?
  - The Largest appeal point will likely be the community made sets.
  - If the process takes too long, or is too difficult to use, the project is dead.
  - However if it lacks complexity and creative opportunity, it's likely to grow stale.

 ## Why?
 I'm a fan of MTG, and I also feel like Cardboard Games could become more restricted and harder to produce in the wake of Climate Change. The only alternative is Magic Online, or Arena, and I don't particularly care for either. At the same time, I always have random ideas for cool MTG sets, but the liklihood of my ideas reaching Wizards of the Coast is extremely low. I'm sure others have fun ideas too... so yeah, why not make a digital card game that is potentially future-proof, and doesn't require any cardboard or central server?
