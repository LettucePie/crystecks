extends Entity
## Cards host Manifestations or Encantations.
class_name Card

enum CARD_SUPERTYPE {Manifestation, Encantation}
enum CARD_TYPE {Fiend, Charm, Spell, Cantrip}

var card_name : String = "Card"
var card_image : Texture2D
var card_cost : Array[CRYSTAL] = []
var card_supertype : CARD_SUPERTYPE
var card_type : CARD_TYPE
