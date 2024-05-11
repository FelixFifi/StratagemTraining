extends Node2D

var DIRECTION_ACTION_MAPPING = {
	Arrow.EArrowDirection.UP: "strategem_up",
	Arrow.EArrowDirection.RIGHT: "strategem_right",
	Arrow.EArrowDirection.DOWN: "strategem_down",
	Arrow.EArrowDirection.LEFT: "strategem_left",
}

var sequence_scene = load("res://sequence.tscn")
@onready var sequence_container = %SequenceContainer
var sequences: Array[Sequence] = []

func _ready():
	for i in range(4):
		var sequence: Sequence = sequence_scene.instantiate()
		sequence.generate_arrows(10)
		sequences.append(sequence)
		sequence_container.add_child(sequence)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _unhandled_key_input(event):
	if event.is_action_pressed("strategem_reset"):
		for sequence in sequences:
			sequence.reset()

	for direction in DIRECTION_ACTION_MAPPING:
		if event.is_action_pressed(DIRECTION_ACTION_MAPPING[direction]):
			for sequence in sequences:
				sequence.process_input(direction)

