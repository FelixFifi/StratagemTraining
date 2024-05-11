extends Node
class_name Stratagems

const EAGLE_STRATAGEMS = {
	"Eagle Strafing Run": "URR",
	"Eagle Airstrike": "URDR",
	"Eagle Cluster Bomb": "URDDR",
	"Eagle Napalm Airstrike": "URDU",
	"Eagle Smoke Strike": "URUD",
	"Eagle 10MM Rocket Pods": "URUL",
	"Eagle 500kg Bomb": "URDDD"
}

const ORBITAL_STRATAGMES = {
	"Orbital Gatling Barrage": "RDLUU",
	"Orbital Airburst Strike": "RRR",
	"Orbital 120MM HE Barrage": "RRDLRD",
	"Orbital 380MM HE Barrage": "RDUULDD",
	"Orbital Walking Barrage": "RDRDRD",
	"Orbital Laser": "RDURD",
	"Orbital Railcannon Strike": "RUDDR",
	"Orbital Precision Strike": "RRU",
	"Orbital Gas Strike": "RRDR",
	"Orbital EMS Strike": "RRLD",
	"Orbital Smoke Strike": "RRDU",
}

const CHAR_DIRECTION_MAPPING = {
	"U": Arrow.EArrowDirection.UP,
	"R": Arrow.EArrowDirection.RIGHT,
	"D": Arrow.EArrowDirection.DOWN,
	"L": Arrow.EArrowDirection.LEFT,
}

static var sequence_scene = load("res://sequence.tscn")

static func get_random_stratagem():
	var all_stratagems = {}
	for group in [EAGLE_STRATAGEMS, ORBITAL_STRATAGMES]:
		all_stratagems.merge(group)


	var stratagem: String = all_stratagems.keys().pick_random()

	var directions: Array[Arrow.EArrowDirection] = []
	for letter in all_stratagems[stratagem]:
		directions.append(CHAR_DIRECTION_MAPPING[letter])

	var sequence: Sequence = sequence_scene.instantiate()
	sequence.load_stratagem(directions, stratagem)

	return sequence
