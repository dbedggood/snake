extends Node2D


func set_constrained_nodes(target_node):
	for point_index in range(1, target_node.get_point_count()):
		var previous_point_position = target_node.get_point_position(point_index - 1)
		var current_point_position = target_node.get_point_position(point_index)
		var previous_to_current_vector = current_point_position - previous_point_position
		var constrained_new_position = (
			previous_point_position
			+ previous_to_current_vector.normalized() * Constants.MAX_POINT_DISTANCE
		)
		target_node.set_point_position(point_index, constrained_new_position)