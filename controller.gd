extends Node2D

var DIRECTION_ACTION_MAPPING = {
	Arrow.EArrowDirection.UP: "strategem_up",
	Arrow.EArrowDirection.RIGHT: "strategem_right",
	Arrow.EArrowDirection.DOWN: "strategem_down",
	Arrow.EArrowDirection.LEFT: "strategem_left",
}

static var sequence_scene: PackedScene = load("res://sequence.tscn")
@onready var sequence_container = %SequenceContainer
var sequences: Array[Sequence] = []
var situation: Situation

@onready var situation_description = %SituationDescription
@onready var success_timer = %SuccessTimer
var waiting_for_next_sequences = false

func _ready():
	reset()

func reset():
	for sequence in sequences:
		sequence.queue_free()

	sequences.clear()

	situation = Situation.ALL_SITUATIONS.pick_random()
	situation_description.text = situation.description

	var solving_stratagem: Stratagem = situation.get_solving_stratagems().pick_random()
	var solving_sequence: Sequence = sequence_scene.instantiate()
	assert(solving_stratagem != null)
	solving_sequence.load_stratagem(solving_stratagem)
	sequences.append(solving_sequence)
	sequence_container.add_child(solving_sequence)

	for i in range(3):
		var sequence: Sequence = Stratagems.get_random_stratagem_sequence()
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
				if situation.is_solving_stratagem(sequence.stratagem):
					success_timer.start()
					waiting_for_next_sequences = true
					return
				else:
					sequence.fail_not_solution()


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

