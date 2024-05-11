extends Node2D

var DIRECTION_ACTION_MAPPING = {
	Arrow.EArrowDirection.UP: "strategem_up",
	Arrow.EArrowDirection.RIGHT: "strategem_right",
	Arrow.EArrowDirection.DOWN: "strategem_down",
	Arrow.EArrowDirection.LEFT: "strategem_left",
}

static var sequence_scene = load("res://sequence.tscn")
@onready var sequence_container = %SequenceContainer
var sequences: Array[Sequence] = []

@onready var success_timer = %SuccessTimer
var waiting_for_next_sequences = false

func _ready():
	reset()

func reset():
	for sequence in sequences:
		sequence.queue_free()

	sequences.clear()

	for i in range(4):
		var sequence: Sequence = Stratagems.get_random_stratagem()
		sequences.append(sequence)
		sequence_container.add_child(sequence)

	success_timer.stop()
	waiting_for_next_sequences = false


func _process(_delta):
	if waiting_for_next_sequences:
		if success_timer.time_left == 0:
			reset()
	else:
		for sequence in sequences:
			if sequence.is_completed():
				success_timer.start()
				waiting_for_next_sequences = true
				return


func _unhandled_key_input(event):
	if waiting_for_next_sequences:
		return

	if event.is_action_pressed("strategem_reset"):
		for sequence in sequences:
			sequence.reset()

	for direction in DIRECTION_ACTION_MAPPING:
		if event.is_action_pressed(DIRECTION_ACTION_MAPPING[direction]):
			for sequence in sequences:
				sequence.process_input(direction)

