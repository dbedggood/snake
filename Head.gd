extends Line2D

const PUPILLARY_DISTANCE = 10
const MAX_MOUSE_DISTANCE = 10
const MAX_POINT_DISTANCE = 50


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


func _draw():
	var snake_head_tip = get_point_position(0)
	var snake_head_base = get_point_position(1)
	var snake_head_direction = (snake_head_tip - snake_head_base).normalized()

	#draw eyes
	var left_eye_offset = snake_head_direction.orthogonal() * 20
	var right_eye_offset = left_eye_offset * -1
	draw_circle(snake_head_tip + left_eye_offset, PUPILLARY_DISTANCE / 2, Color.BLACK)
	draw_circle(snake_head_tip + right_eye_offset, PUPILLARY_DISTANCE / 2, Color.BLACK)
