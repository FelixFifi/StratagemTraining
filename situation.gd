extends Node
class_name Situation

var description: String = "Default description"
var solving_traits_list: Array[Array] = []

enum ETraits {
	explosive,
	explosive_large,
	explosive_multiple,
	turret,
	high_rate_of_fire,
	area_low_damage,
}

static var ALL_SITUATIONS: Array[Situation] = [
	Situation.new("Single Factory.", [[ETraits.explosive], [ETraits.explosive_large], [ETraits.explosive_multiple]]),
	Situation.new("Single Factory with Helldiver close by.", [[ETraits.explosive]]),
	Situation.new("Patrol of small enemies.",[[ETraits.high_rate_of_fire], [ETraits.area_low_damage], [ETraits.explosive_large], [ETraits.explosive_multiple]]),
	Situation.new("Patrol of small enemies. You are under time pressure.",[[ETraits.high_rate_of_fire, ETraits.turret], [ETraits.area_low_damage], [ETraits.explosive_large], [ETraits.explosive_multiple]]),
]

func _init(description: String, solving_traits_list: Array[Array]):
	self.description = description
	self.solving_traits_list = solving_traits_list

func get_solving_stratagems() -> Array[Stratagem]:
	var solving_stratagems: Array[Stratagem] = []
	for stratagem in Stratagems.ALL_STRATAGEMS:
		if is_solving_stratagem(stratagem):
			solving_stratagems.append(stratagem)
			break
	return solving_stratagems

func is_solving_stratagem(stratagem: Stratagem) -> bool:
	for solving_traits in solving_traits_list:
			if _array_contains_array(stratagem.traits, solving_traits):
				return true
	return false

func _array_contains_array(array_to_test: Array, array_to_contain: Array) -> bool:
	for val in array_to_contain:
		if val not in array_to_test:
			return false
	return true
