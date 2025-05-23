extends Manifestation
## A Manifestation that can interact with the Combat phase.
class_name Fiend

enum LEGACY {Generic, Heroic, Villainous}

var fiend_legacy : LEGACY
var fiend_traits : PackedStringArray
var fiend_descriptives : String
var fiend_power : int
var fiend_health : int

## TODO CATS
