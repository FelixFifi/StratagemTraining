extends Node
class_name Stratagems

static var EAGLE_STRATAGEMS: Array[Stratagem] = [
	Stratagem.new("Eagle Strafing Run", "URR", [Situation.ETraits.area_low_damage]),
	Stratagem.new("Eagle Airstrike", "URDR", [Situation.ETraits.explosive_multiple]),
	Stratagem.new("Eagle Cluster Bomb", "URDDR", [Situation.ETraits.explosive_multiple]),
	Stratagem.new("Eagle Napalm Airstrike", "URDU", [Situation.ETraits.area_low_damage]),
	Stratagem.new("Eagle Smoke Strike", "URUD"),
	Stratagem.new("Eagle 10MM Rocket Pods", "URUL"),
	Stratagem.new("Eagle 500kg Bomb", "URDDD", [Situation.ETraits.explosive_large]),
]

static var ORBITAL_STRATAGMES: Array[Stratagem] = [
	Stratagem.new("Orbital Gatling Barrage", "RDLUU", [Situation.ETraits.area_low_damage]),
	Stratagem.new("Orbital Airburst Strike", "RRR", [Situation.ETraits.area_low_damage]),
	Stratagem.new("Orbital 120MM HE Barrage", "RRDLRD"),
	Stratagem.new("Orbital 380MM HE Barrage", "RDUULDD"),
	Stratagem.new("Orbital Walking Barrage", "RDRDRD"),
	Stratagem.new("Orbital Laser", "RDURD"),
	Stratagem.new("Orbital Railcannon Strike", "RUDDR"),
	Stratagem.new("Orbital Precision Strike", "RRU", [Situation.ETraits.explosive]),
	Stratagem.new("Orbital Gas Strike", "RRDR", [Situation.ETraits.area_low_damage]),
	Stratagem.new("Orbital EMS Strike", "RRLD"),
	Stratagem.new("Orbital Smoke Strike", "RRDU"),
]

static var ALL_STRATAGEMS: Array[Stratagem] = EAGLE_STRATAGEMS + ORBITAL_STRATAGMES

static var sequence_scene = load("res://sequence.tscn")

static func get_random_stratagem_sequence() -> Sequence:
	var stratagem = ALL_STRATAGEMS.pick_random()

	var sequence: Sequence = sequence_scene.instantiate()
	sequence.load_stratagem(stratagem)

	return sequence
