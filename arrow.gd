extends TextureRect
class_name Arrow

enum EArrowDirection {
	UP = -90,
	RIGHT = 0,
	DOWN = 90,
	LEFT = 180,
}

const POSSIBLE_DIRECTIONS = [EArrowDirection.UP, EArrowDirection.RIGHT, EArrowDirection.DOWN, EArrowDirection.LEFT]

const TEXTURE_MAPPING = {
	"todo": {
		EArrowDirection.UP: "res://textures/texture_arrow_up.tres",
		EArrowDirection.RIGHT: "res://textures/texture_arrow_right.tres",
		EArrowDirection.DOWN: "res://textures/texture_arrow_down.tres",
		EArrowDirection.LEFT: "res://textures/texture_arrow_left.tres",
	},
	"done": {
		EArrowDirection.UP: "res://textures/texture_done_up.tres",
		EArrowDirection.RIGHT: "res://textures/texture_done_right.tres",
		EArrowDirection.DOWN: "res://textures/texture_done_down.tres",
		EArrowDirection.LEFT: "res://textures/texture_done_left.tres",
	}
}


@export var arrow_direction: EArrowDirection = EArrowDirection.UP


func set_direction(direction: EArrowDirection):
	arrow_direction = direction
	texture = load(TEXTURE_MAPPING["todo"][arrow_direction])
	custom_minimum_size = texture.get_size()
	pivot_offset = custom_minimum_size / 2.0
	size = custom_minimum_size

func get_direction():
	return arrow_direction

func mark_done():
	texture = load(TEXTURE_MAPPING["done"][arrow_direction])

func reset():
	texture = load(TEXTURE_MAPPING["todo"][arrow_direction])
