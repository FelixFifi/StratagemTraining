extends Node
class_name Stratagem

var stratagem_name: String
var directions: Array[Arrow.EArrowDirection]
var traits: Array[Situation.ETraits]

const CHAR_DIRECTION_MAPPING = {
	"U": Arrow.EArrowDirection.UP,
	"R": Arrow.EArrowDirection.RIGHT,
	"D": Arrow.EArrowDirection.DOWN,
	"L": Arrow.EArrowDirection.LEFT,
}


func _init(stratagem_name: String, direction_code:  String, traits: Array[Situation.ETraits] = []):
	self.stratagem_name = stratagem_name
	self.traits = traits
	self.directions = direction_code_to_directions(direction_code)


func direction_code_to_directions(direction_code: String) -> Array[Arrow.EArrowDirection]:
	var dirs: Array[Arrow.EArrowDirection] = []
	for letter in direction_code:
		dirs.append(CHAR_DIRECTION_MAPPING[letter])
	return dirs
