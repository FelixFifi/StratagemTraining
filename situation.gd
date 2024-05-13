extends Node
class_name Situation

var description: String = "Default description"
var solving_traits_list: Array[Array] = []



# TODO: add more situations and new traits
static var ALL_SITUATIONS: Array[Situation] = [
	Situation.new("Single Factory.", [[Traits.ETraits.explosive], [Traits.ETraits.explosive_large], [Traits.ETraits.explosive_multiple], [Traits.ETraits.high_damage]]),
	Situation.new("Single Factory with Helldiver close by.", [[Traits.ETraits.exact_target, Traits.ETraits.explosive], [Traits.ETraits.exact_target, Traits.ETraits.high_damage]]),
	Situation.new("Patrol of small enemies.",[[Traits.ETraits.high_rate_of_fire], [Traits.ETraits.area_low_damage], [Traits.ETraits.explosive_large], [Traits.ETraits.explosive_multiple], [Traits.ETraits.paralyze], [Traits.ETraits.blocks_sight]]),
	Situation.new("Patrol of small enemies. You are under time pressure.",[[Traits.ETraits.high_rate_of_fire, Traits.ETraits.turret], [Traits.ETraits.area_low_damage], [Traits.ETraits.explosive_large], [Traits.ETraits.explosive_multiple], [Traits.ETraits.paralyze], [Traits.ETraits.blocks_sight]]),
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
