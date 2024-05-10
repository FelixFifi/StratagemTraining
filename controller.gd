extends Node2D

const DIRECTION_ACTION_MAPPING = {
	Arrow.EArrowDirection.UP: "ui_up",
	Arrow.EArrowDirection.RIGHT: "ui_right",
	Arrow.EArrowDirection.DOWN: "ui_down",
	Arrow.EArrowDirection.LEFT: "ui_left",
}


var arrows : Array[Arrow]= []
@onready var code = %Code
var arrow_scene = load("res://arrow.tscn")



func _ready():
	for i in range(5):
		var arrow: Arrow = arrow_scene.instantiate()
		arrow.set_direction(Arrow.EArrowDirection.DOWN)
		code.add_child(arrow)
		arrows.append(arrow)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _unhandled_key_input(event):
	if len(arrows) > 0:
		var arrow = arrows[0]

		var required_input =DIRECTION_ACTION_MAPPING[arrow.get_direction()]

		if event.is_action_pressed(required_input):
			arrow.queue_free()
			arrows.pop_front()


