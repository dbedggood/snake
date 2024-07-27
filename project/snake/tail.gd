extends Line2D

@onready var snake = $".."
@onready var body = $"../Body"


func _process(_delta):
	var tail_base_position = body.get_point_position(body.get_point_count() - 1)
	set_point_position(0, tail_base_position)
	snake.set_constrained_nodes(self, Constants.BODY_MAX_POINT_DISTANCE)


func _on_body_grown():
	var tail_tip_index = get_point_count() - 1
	var tail_tip_position = get_point_position(tail_tip_index)
	var tail_tip_from_previous_point_vector = (
		tail_tip_position - get_point_position(tail_tip_index - 1)
	)

	for tail_point_index in range(tail_tip_index):
		set_point_position(tail_point_index, get_point_position(tail_point_index + 1))

	set_point_position(tail_tip_index, tail_tip_position + tail_tip_from_previous_point_vector)
