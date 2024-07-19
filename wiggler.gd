extends Line2D

const MAX_POINT_DISTANCE = 50


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var point_count = get_point_count()
	var mouse_position = get_global_mouse_position()
	set_point_position(0, mouse_position)
	
	for point_index in range(1, point_count):
		var previous_point_position = get_point_position(point_index-1)
		var current_point_position = get_point_position(point_index)
		var previous_to_current_vector = current_point_position - previous_point_position
		var constrained_new_position = previous_point_position + previous_to_current_vector.normalized() * MAX_POINT_DISTANCE
		set_point_position(point_index, constrained_new_position)
	
	
func _draw():
	var mouse_position = get_global_mouse_position()
	var snake_head_tip =get_point_position(0)
	var snake_head_base = get_point_position(1)
	var snake_head_direction = snake_head_tip - snake_head_base
	var left_eye_offset = snake_head_direction.orthogonal().normalized() * 20
	var right_eye_offset = left_eye_offset * -1
	draw_circle(mouse_position + left_eye_offset, 5.0, Color.BLACK)
	draw_circle(mouse_position + right_eye_offset, 5.0, Color.BLACK)	
	
