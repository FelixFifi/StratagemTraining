extends VBoxContainer
class_name Sequence

var arrows: Array[Arrow] = []
var arrows_done: Array[Arrow] = []
var stratagem: Stratagem

var arrow_scene = load("res://arrow.tscn")
var failed = false

func process_input(direction_input: Arrow.EArrowDirection):
	if failed:
		return

	if len(arrows) == 0:
		return

	var arrow = arrows[0]

	var required_input = arrow.get_direction()
	if required_input == direction_input:
		arrow.mark_done()
		arrows_done.push_front(arrows.pop_front())
	else:
		# wrong direction input
		fail()

	if len(arrows) == 0:
		complete()


func load_stratagem(stratagem: Stratagem):
	self.stratagem = stratagem
	%Name.text = stratagem.stratagem_name
	for direction in stratagem.directions:
		var arrow: Arrow = arrow_scene.instantiate()
		arrow.set_direction(direction)
		%Sequence.add_child(arrow)
		arrows.append(arrow)

func generate_arrows(n: int):
	for i in range(n):
		var arrow: Arrow = arrow_scene.instantiate()
		var direction : Arrow.EArrowDirection = Arrow.POSSIBLE_DIRECTIONS.pick_random()
		arrow.set_direction(direction)
		%Sequence.add_child(arrow)
		arrows.append(arrow)

func reset():
	for arrow in arrows_done:
		arrow.reset()
		arrows.push_front(arrow)

	arrows_done.clear()
	failed = false
	%Sequence.modulate = Color(1, 1, 1)

func fail_not_solution():
	failed = true
	%Sequence.modulate = Color(1, 0.5, 0.5)

func fail():
	failed = true
	%Sequence.modulate = Color(0.5, 0.5, 0.5)

func complete():
	%Sequence.modulate = Color(0.8, 1, 0.8)

func is_completed():
	return not failed and len(arrows) == 0
