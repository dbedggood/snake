extends Line2D

signal grown

@onready var snake = $".."
@onready var head = $"../Head"


func _process(_delta):
	set_point_position(0, head.get_point_position(Constants.HEAD_BASE_POINT_INDEX))
	snake.set_constrained_nodes(self)


func _on_snake_ate_cherries():
	var point_count = get_point_count()
	var last_point_index = point_count - 1
	var snake_tail_base = get_point_position(last_point_index)
	var snake_body_end = get_point_position(last_point_index - 1)
	var snake_tail_direction = (snake_tail_base - snake_body_end).normalized()

	add_point(
		get_point_position(last_point_index) + snake_tail_direction * Constants.MAX_POINT_DISTANCE
	)

	grown.emit()
