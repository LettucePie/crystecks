extends Overseer
class_name Logic
## Host of CATS. Uses enums from the Overseer.


class Condition:
	var short_name : String = ""
	var requirements : Array = []
	
	func _init(arg1, arg2):
		short_name = arg1
		requirements = arg2


class Action:
	var short_name : String = ""


var conditions : Array[Condition] = [
	Condition.new("If it is my turn", [EVENT_TYPE.TIME, TURN_FLAGS.PLAYER_TURN]),
	Condition.new("If it is Not my turn", [EVENT_TYPE.TIME, TURN_FLAGS.OPPONENT_TURN]),
	Condition.new("If I Gained Life", [EVENT_TYPE.PLAYER_STATUS, STATUS_FLAGS.PLAYER_GAINED]),
	Condition.new("If I Lost Life", [EVENT_TYPE.PLAYER_STATUS, STATUS_FLAGS.PLAYER_LOST])
]
