extends Line2D

const MAX_POINT_DISTANCE = 50

@onready var head = $"../Head"


func _process(delta):
	var point_count = get_point_count()
	set_point_position(0, head.get_point_position(2))

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
		var snake_tail_tip = get_point_position(last_point_index)
		var snake_tail_base = get_point_position(last_point_index - 1)
		var snake_tail_direction = (snake_tail_tip - snake_tail_base).normalized()

		add_point(get_point_position(last_point_index) + snake_tail_direction * MAX_POINT_DISTANCE)

	if event.is_action_pressed("shrink_snake"):
		if point_count > 3:
			print("shrink!")
			remove_point(last_point_index)
		else:
			print("too small to shrink!")
