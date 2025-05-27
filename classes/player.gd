extends Entity
## Players are owners, weilders, and activators of Decks, Cards, Encantations, and Manifestations.
class_name Player

var player_health : int = 20
var player_attunement : Array[CRYSTAL]
var player_charge : Array[CRYSTAL]
var player_hand : Hand
var player_deck : Deck
var player_battlefield : Battlefield
