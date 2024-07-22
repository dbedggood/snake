extends Line2D

const MAX_POINT_DISTANCE = 30
const TAIL_BASE_POINT_INDEX = 0
const TAIL_TIP_POINT_INDEX = 1

@onready var body = $"../Body"


func _process(delta):
	var tail_base_position = body.get_point_position(body.get_point_count() - 1)
	set_point_position(TAIL_BASE_POINT_INDEX, tail_base_position)

	var tail_tip_position = get_point_position(TAIL_TIP_POINT_INDEX)
	var base_to_tip_direction = (tail_tip_position - tail_base_position).normalized()
	var constrained_new_position = tail_base_position + base_to_tip_direction * MAX_POINT_DISTANCE
	set_point_position(TAIL_TIP_POINT_INDEX, constrained_new_position)
