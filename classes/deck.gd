extends Entity
## Decks host Cards
class_name Deck

## The List of cards, doesn't get altered by gameplay.
var deck_list : Array[Card]
## The actively loaded deck used during gameplay.
var deck_active : Array[Card]
