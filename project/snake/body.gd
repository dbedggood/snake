extends Line2D

signal body_grown

@onready var snake = $".."
@onready var head = $"../Head"


func _process(delta):
	set_point_position(0, head.get_point_position(Constants.HEAD_BASE_POINT_INDEX))
	snake.set_constrained_nodes(self)


func _input(event):
	var point_count = get_point_count()
	var last_point_index = point_count - 1

	if event.is_action_pressed("grow_snake"):
		print("grow!")
		var snake_tail_tip = get_point_position(last_point_index)
		var snake_tail_base = get_point_position(last_point_index - 1)
		var snake_tail_direction = (snake_tail_tip - snake_tail_base).normalized()

		add_point(
			(
				get_point_position(last_point_index)
				+ snake_tail_direction * Constants.MAX_POINT_DISTANCE
			)
		)
		body_grown.emit()

	if event.is_action_pressed("shrink_snake") and point_count > 3:
		remove_point(last_point_index)
