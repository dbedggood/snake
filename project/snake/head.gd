extends Line2D


func _process(delta):
	var head_tip_position = get_global_mouse_position()
	set_point_position(Constants.HEAD_TIP_POINT_INDEX, head_tip_position)

	for point_index in range(1, 3):
		var previous_point_position = get_point_position(point_index - 1)
		var current_point_position = get_point_position(point_index)
		var previous_to_current_vector = current_point_position - previous_point_position
		var constrained_new_position = (
			previous_point_position
			+ previous_to_current_vector.normalized() * Constants.MAX_POINT_DISTANCE
		)
		set_point_position(point_index, constrained_new_position)


func _draw():
	var snake_head_tip = get_point_position(Constants.HEAD_TIP_POINT_INDEX)
	var snake_head_centre = get_point_position(Constants.HEAD_CENTRE_POINT_INDEX)
	var snake_head_direction = (snake_head_tip - snake_head_centre).normalized()

	#draw eyes
	var left_eye_offset = snake_head_direction.orthogonal() * Constants.PUPILLARY_DISTANCE
	var right_eye_offset = snake_head_direction + left_eye_offset * -1
	draw_circle(snake_head_centre + left_eye_offset, Constants.EYE_RADIUS, Color.BLACK)
	draw_circle(snake_head_centre + right_eye_offset, Constants.EYE_RADIUS, Color.BLACK)
