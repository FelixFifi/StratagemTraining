extends Node
class_name Stratagems

# TODO: Add more traits
static var EAGLE_STRATAGEMS: Array[Stratagem] = [
	Stratagem.new("Eagle Strafing Run", "URR", [Traits.ETraits.area_low_damage]),
	Stratagem.new("Eagle Airstrike", "URDR", [Traits.ETraits.explosive_multiple]),
	Stratagem.new("Eagle Cluster Bomb", "URDDR", [Traits.ETraits.explosive_multiple]),
	Stratagem.new("Eagle Napalm Airstrike", "URDU", [Traits.ETraits.area_low_damage]),
	Stratagem.new("Eagle Smoke Strike", "URUD", [Traits.ETraits.blocks_sight]),
	Stratagem.new("Eagle 10MM Rocket Pods", "URUL", [Traits.ETraits.explosive, Traits.ETraits.exact_target]),
	Stratagem.new("Eagle 500kg Bomb", "URDDD", [Traits.ETraits.explosive_large]),
]

static var ORBITAL_STRATAGEMS: Array[Stratagem] = [
	Stratagem.new("Orbital Gatling Barrage", "RDLUU", [Traits.ETraits.area_low_damage]),
	Stratagem.new("Orbital Airburst Strike", "RRR", [Traits.ETraits.area_low_damage]),
	Stratagem.new("Orbital 120MM HE Barrage", "RRDLRD", [Traits.ETraits.explosive_multiple]),
	Stratagem.new("Orbital 380MM HE Barrage", "RDUULDD", [Traits.ETraits.explosive_multiple]),
	Stratagem.new("Orbital Walking Barrage", "RDRDRD", [Traits.ETraits.explosive_multiple]),
	Stratagem.new("Orbital Laser", "RDURD", [Traits.ETraits.high_damage]),
	Stratagem.new("Orbital Railcannon Strike", "RUDDR", [Traits.ETraits.high_damage, Traits.ETraits.exact_target]),
	Stratagem.new("Orbital Precision Strike", "RRU", [Traits.ETraits.explosive, Traits.ETraits.exact_target]),
	Stratagem.new("Orbital Gas Strike", "RRDR", [Traits.ETraits.area_low_damage]),
	Stratagem.new("Orbital EMS Strike", "RRLD", [Traits.ETraits.paralyze]),
	Stratagem.new("Orbital Smoke Strike", "RRDU", [Traits.ETraits.blocks_sight]),
]

static var BACKPACK_STRATAGEMS: Array[Stratagem] = [
	Stratagem.new("LIFT-850 Jump Pack", "DUUDU", [Traits.ETraits.escape]),
	Stratagem.new("B-1 Supply Pack", "DLDUUD", [Traits.ETraits.supply]),
	Stratagem.new("AX/LAS-5 'Guard Dog' Rover", "DULURR", [Traits.ETraits.guard_dog]),
	Stratagem.new("SH-20 Ballistic Shield Backpack", "DLDDUL", [Traits.ETraits.shield]),
	Stratagem.new("SH-32 Shield Generator Pack", "DULRLR", [Traits.ETraits.shield]),
	Stratagem.new("AX/AR-23 'Guard Dog'", "DUUDU", [Traits.ETraits.guard_dog]),
]

# TODO: add all stratagem types
static var ALL_STRATAGEMS: Array[Stratagem] = EAGLE_STRATAGEMS + ORBITAL_STRATAGEMS + BACKPACK_STRATAGEMS

static var sequence_scene = load("res://sequence.tscn")

static func get_random_stratagem_sequence() -> Sequence:
	var stratagem = ALL_STRATAGEMS.pick_random()

	var sequence: Sequence = sequence_scene.instantiate()
	sequence.load_stratagem(stratagem)

	return sequence
