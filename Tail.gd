extends Line2D

const MAX_POINT_DISTANCE = 50

@onready var body = $"../Body"


func _process(delta):
	var point_count = get_point_count()
	set_point_position(0, body.get_point_position(body.get_point_count() - 1))

	for point_index in range(1, point_count):
		var previous_point_position = get_point_position(point_index - 1)
		var current_point_position = get_point_position(point_index)
		var previous_to_current_vector = current_point_position - previous_point_position
		var constrained_new_position = (
			previous_point_position + previous_to_current_vector.normalized() * MAX_POINT_DISTANCE
		)
		set_point_position(point_index, constrained_new_position)
