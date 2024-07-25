extends Line2D

@onready var body = $"../Body"


func _process(_delta):
	var tail_base_position = body.get_point_position(body.get_point_count() - 1)
	set_point_position(Constants.TAIL_BASE_POINT_INDEX, tail_base_position)

	var tail_tip_position = get_point_position(Constants.TAIL_TIP_POINT_INDEX)
	var base_to_tip_direction = (tail_tip_position - tail_base_position).normalized()
	var constrained_new_position = (
		tail_base_position + base_to_tip_direction * Constants.MAX_POINT_DISTANCE
	)
	set_point_position(Constants.TAIL_TIP_POINT_INDEX, constrained_new_position)


func _on_body_grown():
	var tail_base_position = body.get_point_position(body.get_point_count() - 1)
	var base_to_tip_vector = (
		tail_base_position - body.get_point_position(body.get_point_count() - 2)
	)
	set_point_position(Constants.TAIL_TIP_POINT_INDEX, tail_base_position + base_to_tip_vector)
