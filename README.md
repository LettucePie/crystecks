# crystecks
Digital card dueling game with sharable/playable usermade content.

## Setup

 - Download and Run Godot 4.2+
 - Select Import or Scan from the top left and navigate to the directory.

## Main Concept
A decentralized card dueling game. Players earn coins from ai matches or matches with friends. They can buy the Vanilla packs provided by me through updates, or can buy a Set Printer which let's them build and share their own Set that other players can also Share and buy packs from. Card effects are programmatic, like conditions and actions that the player can fill out on their own, and the art is a bunch of stickers that can have filters, tints, and backgrounds. Card Game format/style would be mostly inspired by Magic The Gathering. All duels and set sharing would happen with local communications, wifi/bluetooth and wifi-direct. In theory this would create small localized meta-game structures for each small community and friend group who participates.

## Game Structure, Sets/Packs, and Cards

### Game Structure
- Turn based
  - Phases:
    - Start
    - Recharge (akin to Untapping)
    - Draw
    - Play
    - Combat
    - Post-Combat Play
    - End
- 6 Crystals representing Elemental Attunements, Faction, Gameplay identity, and emotional energy.
- Starting Health of 20
- Max health of 30
- All cards can be resources
  - Each turn you can attune one card into your attunement spectrum
- Cards can exist in multiple locations
  - The Deck
  - The Hand
  - The Battlefield
  - The Glitter Pouch (Graveyard)
  - The Shadow (Exile)


### Number of Players
I'm interpreting this as a 1v1 only experience. This is mainly based on the fact that most interactions will be local and on a phone. If you're hanging out with multiple friends, you're most likely going to have a better time playing a physical table-top game together rather than all 4 of you struggling to make sense of 4 player-boards on a phone screen.

#### Connectivity Method
Currently not thoroughly explored. The likelihood of Apple opening the gates is very low, so the main target will be Android and Linux aarch64. The downside of depending on Android is their data-security seems to be in constant flux, I don't think anyone knows how to connect their app to a file-system anymore. This means I will need to make multiple connection methods in case one updates into obsolesence.

#### CPU / AI Opponents
There will be 2 types of CPU Opponents. One is the Base CPU and the other is an extension I'm calling a "Reflection".

The Base CPU can be given a deck and a thought level. These thought levels ultimately represent difficulty, but should mimic realistic thought patterns a player may have playing the game.

A Reflection is a special player made challenge that can be shared with other players. When making a deck, a player can choose to also setup a Reflection; this will have the player specify their favorite card, and favorite combo(s) found within the deck.

**The Thought Levels**
1. The bare minimum. Really just playing cards and declaring attackers.
  - Primary Goal: Playing out their hand
  - Secondary Goal: Getting their opponent life total to 0
  - Contextual Level: 0, it has zero concern with what is happening to it's board.
  - Cautionary Level: 0, it has zero concern with what the opponent is doing.
2. Is aware that their cards can synergize, but still blind to the opponent.
  - Primary Goal: Playing out their hand
  - Secondary Goal: Getting their opponent life total to 0
  - Contextual Level: 1, seeks out some form of interaction, but doesn't plan to set it up or sensibly capitalize.
  - Cautionary Level: 0, it has zero concern with what the opponent is doing.
3. Actively wants their cards to synergize, and will show minimum levels of caution in trying to execute their plan.
  - Primary Goal: Dynamically decided based on style of deck.
  - Secondary Goal: Survival
  - Contextual Level: 2, capable of setting up a combo or establishing a board-state.
	- Look-Ahead: 2 Turns (This turn play A, next turn play B)
  - Cautionary Level: 1, becomes aware that the opponents bigger creature can block and also kill. Zero regard to opponents synergy.
4. Wants to combo, but is aware of responses.
  - Primary Goal: Dynamically decided based on style of deck.
  - Secondary Goal: Survival
  - Contextual Level: 2, capable of setting up a combo or establishing a board-state.
  - Cautionary Level: 2, can decipher the opponent may have a goal or goals.
5. Prioritizes subduing it's opponent
  - Primary Goal: Matching or exceeding the opponents board-state
  - Secondary Goal: Dynmically decided based on style of deck.
  - Contextual Level: 2, capable of setting up a combo or establishing a board-state.
  - Cautionary Level: 3, will hold onto Charge and Cantrips to respond.

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

#### Tribals
Rather than allowing CATS and other buffs work off of a Fiend/Creature type, such as "other Goblins you control get +1/+0", let's use the descriptive adjectives for each color (as seen in Crystals / Colors).

An issue I was facing before was trying to figure out how to allow Tribal buffs / Fiend type synergy. I don't want to limit the amount/type of Fiends people can design with sets. If they want to make an entire set of Deer Fiends that's great. The issue is if they make cards that buff Deer and someone else makes some ultra powerful set that also has Deer then we have a problem where Deer become the most valuable type of Fiend; people may feel incentivized to only make new sets just using Deer.

So let's use the Crystal / Color descriptive adjectives. It allows us to buff types of creatures while also applying some sense of power distribution and alignment. Currently there is 4 for each Color, 2 "positive" and 2 "negative". This will probably need to be expanded a bit more, and some descriptors that blend between multiple colors could be nice too.

### Resources / Crystal Attunement and Energy
Cards have costs to play, and so we have a resource system. Instead of dealing with concepts like land or energy cards; and all of the baggage that accompanies it, we're going to try a more modern approach. Once each turn players can choose to attune a card from their hand, increasing their attunement. The level of attunement dictates the amount of Energy available for playing cards that turn, in each spectrum attuned too. When a Player attunes a card that has just Prism color cost, their Prism Attunement increases by one. Same for if a card has only Red Green Blue Cyan Magenta or Yellow costs. If a player attunes a card with more than one color cost, they get to choose the color to attune to. So a card with Red and Magenta costs could level up their Red or Magenta attuenement by one.

During Upkeep the player gets charged with energy matching their attunement spectrum. So if it's turn 4 and they have attuned 2 Red and 1 Yellow they start their turn with 2 Red Energy and 1 Yellow Energy. They could play a card using that energy or attune another card, lets say they attune for Prism energy. Now their attunement spectrum is 2 Red, 1 Yellow, and 1 Prism. Each turn a player gets to attune a card once for free, and it immediately charges their energy. Some card effects (CATS) can increase attunement but not always charged.

### Playing Cards / Energy Costs
Just above is the Attunement and Energy section. Referring to that, we had an example where it's turn 4 and we have 2 Red, 1 Yellow, and 1 Prism Energy / Attunement. Those Enery resources get consumed upon playing cards that require them. Colors that aren't Prism require energy of their matching color to play. So with 2 Red, 1 Yellow, and 1 Prism we can play 2 cards with a cost a 1 Red, or 1 Card with a cost of 2 Red, or 1 card with a cost a 1 Red and 1 Yellow. Prism Costs can be covered by Prism energy or any color energy. 

### Zones, Battlefield, Glitter Pouch, Shadow
The Battlefield is what it is. It's the area where Manifestations reside, and combat occurs. The Glitter Pouch is effectively the Trash/Graveyard. It will function like any other card-games discard pile. The Shadow is going to mostly be like "Exile", it will generally be the place where cards don't come back from. However I want there to be play-styles that utilize The Shadow, and it's going to have a distinct difference where all cards here are not revealed, or public.

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


### Cards

Card properties are as follows:
- An Image within a colored Border
- A String for the Name
- An Array of integers for the cost
  - 2 Prism and 2 Magenta would be `[Prism, Prism, Magenta, Magenta]` or just `[0, 0, 5, 5]`
- An Integer for the card SuperType
  - `[Manifestation, Encantation]`
- An integer for card type, most likely enum
  - `[Fiend, Spell, Cantrip, Charm]`
- A follow-up integer enum for subtype
  - For Fiends this will connect to the Color trait / adjective.
	- Max of 2, one Positive trait and one Negative?
  - Spells and Cantrips probably won't make much use of this.
  - Charms could have "Battlefield Charm" or "Fiend Charm" or "Player Charm".
- Another String for Fiends describing what they are such as "Deer" or "Human", ignore otherwise
  - Default value will be randomly pulled from a premade list of generic animals and fantasy races.
- An Integer for Fiends if they're Regular, Heroic, or Villainous
  - `[Regular, Heroic, Villainous]`
- Power and Health for Fiends, ignore otherwise
  - Default values of `0`
- Array of Effect Codes

#### Super Types
In a traditional sense, a card is the object that is placed onto the board. In this case though, since we're purely digital we don't have to refer to just *card*. We can distinguish absolutely that cards contain spells, and those spells either *Manifest* something or execute an effect/ability. With this in mind;
 - Fiends and Charms are Manifestations
   - Manifestations are Manifested
   - Fiends can also be either Heroic or Villainous
 - Spells and Cantrips are Encantations
   - Encantations are Chanted

#### Heroic or Villainous
To assist with card story-telling, cards can have a Super Type called Heroic, or Villainous. All of these cards must have a CAT for if the card is already in play to resolve a different effect. This could be on the backside of the card, but we're digital so we can really have fun with the design.

Example:
 - Queen Sarah, the Diligant
 - Yellow
 - Heroic Orderly Fiend
 - CAT 1:
   - Whenever a Fiend is Manifested, if it's Toughness is less or greater than Queen Sarah's Toughness, set it's toughness to be equal to Queen Sarahs.
 - CAT 2:
   - If Queen Sarah is in play, give her a +1 Counter

#### Art
How Card Images will be made is currently undecided.
- Sticker system, where players arrange and color stickers in an area?
- Camera Access?
- Draw/Paint tools?
- Can't really stop anyone from making offensive content here...

#### Card Frames
Frames will be universal and most likely static in design. I feel like keeping the frames recognizable is important. The following card Frames will be available:
 - Manifestations
   - Generic Fiends
   - Heroic Fiends
   - Villainous Fiends
   - Charms
 - Encantations

### Abilities, Keywords, CATS
All Condition Action Triggers or CATS will have Rarity levels to associate with the Rarity of card template, as well as Crystal Restrictions. Making a card for the player should start with what Crystal, then CATS load in a list depending on Rarity and Crystal. The effects and themes will be based on the Crystal Spectrum. Some CATS will be commonplace, and basically become Keywords. 
- Card Effects and abilities all have a hard cap of 3 triggers, until next upkeep.

All created cards will be using predefined Condition, Action code structure. Label all these like C1C2E3 internally. This way if someone gets the same card by chance from the same set or different they receive a partial refund. Also this helps with reducing file size for transferring the cards. 

#### Creating CATS
How CATS are provided during creation is currently undecided.
- Limited Randomly decided amount?
- Access to ALL possible CATS for a Crystal/Color?
- Limit based on chosen Paradigm?

Players should be able to combine multiple weaker level CATS on a powerful card, or use a single powerful CAT.

#### The Language and Phrasing for CATS
To prevent confusion, but also keep things simple we have to find a balance between descriptive and simple wording. Concise I think is the goal. If we force a structure of phrases (which will ultimately be the case given the goal of modularity) that become familiar and understandable, then we can reduce the level of confusion for when an effect could/would/should occur and in what order.

**Triggered CATS **
- **Whenever a card is Played**
  - Past Tense: Whenever any card is Played and not Attuned.
  - This would resolve before the effect of the card.
	- So if it were a Manifestation (Fiend or Charm) being played the order would be:
	  1. Card is Played, a Fiend
	  2. Whenever a card is Played CAT
	  3. Manifest Fiend -> the Fiend is Manifested
	- If it were an Encantation:
	  1. Card is Played, a Cantrip
	  2. Whenever a card is Played CAT
	  3. Encantation is Chanted
- **Whenever a card is Attuned**
  - Past Tense: Whenever any card is Attuned instead of Played.
- **Whenever a Player Manifests**
  - Past Tense: Whenever any Manifestation enters play under any players control
- **Whenever a Fiend is Manifested**
  - Past Tense: Whenever any Fiend enters play under any players control
  - Replacements: Fiend could be replaced with Charm
- **Whenever a Player Chants**
  - Past Tense: Whenever any Cantrip or Spell card is activated
- **Whenever a Spell is Chanted**
  - Past Tense: Whenever any Spell card is activated
  - Replacements: Spell could be replaced with Cantrip

All of these can also be customized with Addendums specifying Color, Type, or Ownership.
Examples:
- Heroic or Villainous could be inserted as "Whenever a Player Manifests something Heroic".
- Color Identity could be inserted as "Whenever a Player Manifests something Blue".
  - or "Whenever a Player Chants something Blue".
  - or "Whenever a Red Card is Attuned".
- Location and Ownership could be inserted "Whenever you Manifest".
  - or "Whenever you Chant".

**Activated CATS**
TODO make up new name for Activated Abilities...

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
