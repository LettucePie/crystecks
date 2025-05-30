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


class Trigger:
	var short_name : String = ""
	var requirements : Array = []
	
	func _init(arg1, arg2):
		short_name = arg1
		requirements = arg2


var conditions : Array[Condition] = [
	Condition.new("If it is my turn", [EVENT_TYPE.TIME, TIME_FLAGS.PLAYER_TURN]),
	Condition.new("If it is Not my turn", [EVENT_TYPE.TIME, TIME_FLAGS.OPPONENT_TURN]),
	Condition.new("If it happened This Turn", [EVENT_TYPE.TIME, TIME_FLAGS.THIS_TURN]),
	Condition.new("If it happened Last Turn", [EVENT_TYPE.TIME, TIME_FLAGS.PREVIOUS_TURN]),
	Condition.new("If I Gained Life", [EVENT_TYPE.PLAYER_STATUS, STATUS_FLAGS.PLAYER_GAINED]),
	Condition.new("If I Lost Life", [EVENT_TYPE.PLAYER_STATUS, STATUS_FLAGS.PLAYER_LOST]),
	Condition.new("If the entity is Prism", [EVENT_TYPE.CRYSTAL, Card.CRYSTAL.Prism])
]


var actions : Array[Action] = [
	
]


var triggers : Array[Trigger] = [
	Trigger.new("At the Start of My Turn", [EVENT_TYPE.TIME, TIME_FLAGS.PLAYER_START]),
	Trigger.new("At the Start of the opponents Turn", [EVENT_TYPE.TIME, TIME_FLAGS.OPPONENT_START]),
	Trigger.new("At the Start of Each Turn", [EVENT_TYPE.TIME, TIME_FLAGS.TURN_START])
]
