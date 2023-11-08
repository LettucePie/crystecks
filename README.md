# crystecks
Digital card dueling game with sharable/playable usermade content.

## Main Concept
A decentralized card dueling game. Players earn coins from ai matches or matches with friends. They can buy the Vanilla packs provided by me through updates, or can buy a Set Printer which let's them build and share their own Set that other players can also Share and buy packs from. Card effects are programmatic, like conditions and actions that the player can fill out on their own, and the art is a bunch of stickers that can have filters, tints, and backgrounds. Card Game format/style would be mostly inspired by Magic The Gathering. All duels and set sharing would happen with local communications, wifi/bluetooth and wifi-direct. In theory this would create small localized meta-game structures for each small community and friend group who participates.

## Game Structure, Sets/Packs, and Cards

### Game Structure
- Turn based
  - Phases; upkeep, draw, play, combat, post combat, end
- 6 Crystals instead of 5 colors
  - Crystals representing Elemental Attunements
- Starting Health of 20
- Max health of 30
- Card Effects and abilities all have a hard cap of 3 triggers, until next upkeep.

### Sets and Packs
Players can make and distribute Sets. Sets have 30 cards made by the player. Connecting players can choose to also distribute the set. Upon accepting the set, they have to approve or disapprove the name and art of each card, using rng to replace if they don't like it. After a set has been accepted and approved, other connecting players can accept it in the future, and they too have to approve it. Also the player gets 3 free packs after approving it. Packs contain 5 cards, but each card comes in pairs, bringing a total of 10.

#### Set Paradigms
Sets are designed by restrictions called Paradigms. The Paradigm types are integral to the set, and would labeled on the packs. Currently I have conceived 6 Paradigms. The main point is to restrict the distribution of supremely powerful cards and help make powerful cards feel special. The side effect is communities can make custom rules to only use a certain set, or collection of sets, and the Paradigms help form a structure for balanced distribution of the Card Types.

 - Hybrid Paradigm
   - 3 of 6 Crystals are chosen, and have to be multicolored.
   - There has to be 1 mythic for each chosen crystal, 2 Rares, 2 uncommons, and the rest common.
 - Standard Paradigm
   - Each crystal has to have 5 single color cards. 1 mythic, 1 rare, 1 uncommon and 2 common.
 - Prism Paradigm
   - Each crystal has to have 3 single color cards, and 2 multicolor.
   - Uses Standard Rarity Table.
 - Pyramid Paradigm
   - One Crystal is chosen to have the most, then 2 for fewer, 2 more for even less, then the last gets only one, and it has to be mythic.
   - The chosen one Crystal gets one rare, 4 uncommons, and the rest common.
   - The next 2 down get 2 Rares and 2 uncommons, rest common.
   - The next and final 2 down get 1 mythic, 1 rare, and the rest uncommon.
 - Duel Paradigm
   - 2 crystals are chosen.
   - 30 cards to each, all single color.
   - Each gets 2 mythics, 4 rares, 8 uncommon, and the rest common.
 - Void Paradigm
   - Any amount of any color, singular or multi.
   - 6 rares, 12 uncommon, the rest are common.
   - No mythics.

### Cards / Card Creation
All created cards will be using predefined Condition, Action code structure. Label all these like C1C2E3 internally. This way if someone gets the same card by chance from the same set or different they receive a partial refund. Also this helps with reducing file size for transferring the cards. Technically: a card will be an Image, a String for the name, an array of integers for the cost, an array of effect codes, an integer enum type, and some extra labeling depending on type. Like Power/Health, Spell or Cantrip, or Charm.

How Card Images will be made is currently undecided.
- Sticker system, where players arrange and color stickers in an area?
- Camera Access?
- Draw/Paint tools?
- Can't really stop anyone from making offensive content here...

All Condition Action Triggers or CATS will have Rarity levels to associate with the Rarity of card template, as well as Crystal Restrictions. Making a card for the player should start with what crystal, then CATS load in a list depending on Rarity and Crystal. Referring to Color Pie and power level of Magic The Gathering. Some CATS will be commonplace, and basically become Keywords.

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
