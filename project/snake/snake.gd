class_name Snake
extends Line2D

signal ate_cherries


func set_constrained_nodes(max_point_distance):
	for point_index in range(1, get_point_count()):
		var previous_point_position = get_point_position(point_index - 1)
		var current_point_position = get_point_position(point_index)
		var previous_to_current_vector = current_point_position - previous_point_position
		var constrained_new_position = (
			previous_point_position + previous_to_current_vector.normalized() * max_point_distance
		)
		set_point_position(point_index, constrained_new_position)


func _on_cherries_eaten():
	ate_cherries.emit()
