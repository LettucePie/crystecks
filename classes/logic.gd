extends Overseer
class_name Logic
## Host of CATS. Uses enums from the Overseer.


class Condition:
	var short_name : String = ""
	var requirements : Array[EventPair] = []
	
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
	Condition.new(
		"If it is my Turn",
		[
			EventPair.new(EVENT_TYPE.TURN, TURN_FLAGS.THIS_TURN),
			EventPair.new(EVENT_TYPE.OWNERSHIP, OWNERSHIP_FLAGS.HOST_PLAYER),
			EventPair.new(EVENT_TYPE.TIMING, TIMING_FLAGS.PRESENT)
		]
	)
	
]


var actions : Array[Action] = [
	
]


var triggers : Array[Trigger] = [
	
]
