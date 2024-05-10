extends Control
class_name Arrow

enum EArrowDirection {
	UP = -90,
	RIGHT = 0,
	DOWN = 90,
	LEFT = 180,
}

var arrow_direction : EArrowDirection = EArrowDirection.UP


func set_direction(direction: EArrowDirection):
	var arrow_up = $ArrowUp
	arrow_up.rotation_degrees = direction
	arrow_direction = direction

func get_direction():
	return arrow_direction
