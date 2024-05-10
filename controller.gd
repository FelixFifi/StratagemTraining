extends Node2D

const DIRECTION_ACTION_MAPPING = {
	Arrow.EArrowDirection.UP: "ui_up",
	Arrow.EArrowDirection.RIGHT: "ui_right",
	Arrow.EArrowDirection.DOWN: "ui_down",
	Arrow.EArrowDirection.LEFT: "ui_left",
}


var arrows : Array[Arrow]= []
var arrows_done : Array[Arrow]= []
@onready var code = %Code
var arrow_scene = load("res://arrow.tscn")



func _ready():
	generate_arrows(5)

func generate_arrows(n: int):
	for i in range(n):
		var arrow: Arrow = arrow_scene.instantiate()
		var direction : Arrow.EArrowDirection = DIRECTION_ACTION_MAPPING.keys().pick_random()
		arrow.set_direction(direction)
		code.add_child(arrow)
		arrows.append(arrow)


func cleanup_arrows():
	for arrow in arrows_done:
		arrow.queue_free()
	arrows_done.clear()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if len(arrows) == 0:
		cleanup_arrows()
		generate_arrows(10)


func _unhandled_key_input(event):
	if len(arrows) > 0:
		var arrow = arrows[0]

		var required_input = DIRECTION_ACTION_MAPPING[arrow.get_direction()]

		if event.is_action_pressed(required_input):
			arrow.mark_done()
			arrows_done.append(arrows.pop_front())


