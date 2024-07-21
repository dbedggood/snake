extends Line2D

const MAX_POINT_DISTANCE = 50
const PUPILLARY_DISTANCE = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var point_count = get_point_count()
	var mouse_position = get_global_mouse_position()
	set_point_position(0, mouse_position)

	for point_index in range(1, point_count):
		var previous_point_position = get_point_position(point_index - 1)
		var current_point_position = get_point_position(point_index)
		var previous_to_current_vector = current_point_position - previous_point_position
		var constrained_new_position = (
			previous_point_position + previous_to_current_vector.normalized() * MAX_POINT_DISTANCE
		)
		set_point_position(point_index, constrained_new_position)


func _input(event):
	var point_count = get_point_count()
	var last_point_index = point_count - 1

	if event.is_action_pressed("grow_snake"):
		print("grow!")
		add_point(get_point_position(last_point_index))
	if event.is_action_pressed("shrink_snake"):
		if point_count > 3:
			print("shrink!")
			remove_point(last_point_index)
		else:
			print("too small to shrink!")


func _draw():
	var snake_head_tip = get_point_position(0)

	var snake_head_base = get_point_position(1)
	var snake_head_direction = snake_head_tip - snake_head_base

	#draw eyes
	var left_eye_offset = snake_head_direction.orthogonal().normalized() * 20
	var right_eye_offset = left_eye_offset * -1
	draw_circle(snake_head_tip + left_eye_offset, PUPILLARY_DISTANCE / 2, Color.BLACK)
	draw_circle(snake_head_tip + right_eye_offset, PUPILLARY_DISTANCE / 2, Color.BLACK)
