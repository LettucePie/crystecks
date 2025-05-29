extends Object
class_name Overseer
## The Overseer manages/records all flags/events throughout a game

enum EVENT_TYPE {
	TIME, PLAYER_STATUS, 
	PLAYER_DECK, PLAYER_HAND, 
	PLAYER_BATTLEFIELD, PLAYER_MANIFESTATIONS,
	CARD, MANIFESTATION, ENCANTATION,
	FIEND, CHARM, SPELL, CANTRIP
}
enum TURN_FLAGS {
	GAME_START, GAME_END,
	PLAYER_START, PLAYER_CHARGED, PLAYER_TURN, PLAYER_END, 
	OPPONENT_START, OPPONENT_CHARGED, OPPONENT_TURN, OPPONENT_END
}
enum STATUS_FLAGS {
	PLAYER_GAINED, PLAYER_LOST, PLAYER_TARGETED, PLAYER_CHARMED,
	OPPONENT_GAINED, OPPONENT_LOST, OPPONENT_TARGETED, OPPONENT_CHARMED
}
enum DECK_FLAGS {
	INITIALIZED, SHUFFLED, SEARCHED, CHECKED
}
enum HAND_FLAGS {
	MULLIGAN, DRAWN
}
enum BATTLEFIELD_FLAGS {
	MANIFESTATION_ENTERED, MANIFESTATION_LEFT
}

var event_enum_table : Array = [
	TURN_FLAGS, STATUS_FLAGS, DECK_FLAGS, HAND_FLAGS
]


class GameEvent:
	var turn_id : int
	var event_type : EVENT_TYPE
	var event_flag : int
	var host_entities : Array[Entity]
	var target_entities : Array[Entity]


var event_log : Array[GameEvent] = []
var turn_id : int = 0

func log_event(args : Array):
	pass
