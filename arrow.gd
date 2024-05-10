extends Control
class_name Arrow

enum EArrowDirection {
	UP = -90,
	RIGHT = 0,
	DOWN = 90,
	LEFT = 180,
}

@export var arrow_direction : EArrowDirection = EArrowDirection.UP


func set_direction(direction: EArrowDirection):
	var arrow_up: TextureRect = $ArrowUp_Texture
	arrow_up.rotation_degrees = direction
	arrow_direction = direction
	if direction in [EArrowDirection.UP, EArrowDirection.DOWN]:
		custom_minimum_size = Vector2(arrow_up.texture.get_height(), arrow_up.texture.get_width())
	else:
		custom_minimum_size = Vector2(arrow_up.texture.get_width(), arrow_up.texture.get_height())
	pivot_offset = custom_minimum_size / 2.0
	size = custom_minimum_size

func get_direction():
	return arrow_direction

func mark_done():
	var texture : Texture = load("res://textures/texture_done_right.tres")
	var arrow_up = $ArrowUp_Texture
	arrow_up.texture = texture
