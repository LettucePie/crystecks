extends Overseer
class_name Logic
## Host of CATS. Uses enums from the Overseer.


class Condition:
	var short_name : String = ""
	var requirements : Array = []
	
	func _init(arg1, arg2):
		short_name = arg1
		requirements = arg2


var conditions : Array[Condition] = [
	Condition.new("If it is my turn", [0,1]),
	Condition.new("If it is Not my turn", [0,4]),
	Condition.new("If I Gained Life", [1,0]),
]
