extends Node2D

signal ate_cherries

var body_point_directions = []


# TODO: refactor
func set_constrained_nodes_with_collisions(target_node, max_point_distance):
	var current_body_point_directions = []
	var reverse_body_point_directions = []

	for point_index in range(1, target_node.get_point_count()):
		var previous_point_position = target_node.get_point_position(point_index - 1)
		var current_point_position = target_node.get_point_position(point_index)
		var previous_to_current_direction = (
			(current_point_position - previous_point_position).normalized()
		)

		# saving to calculate collision shape
		current_body_point_directions.append(previous_to_current_direction)
		reverse_body_point_directions.push_front(previous_to_current_direction)

		var constrained_new_position = (
			previous_point_position + previous_to_current_direction * max_point_distance
		)
		target_node.set_point_position(point_index, constrained_new_position)

	current_body_point_directions.append_array(reverse_body_point_directions)
	if body_point_directions != current_body_point_directions:
		body_point_directions = current_body_point_directions


func set_constrained_nodes(target_node, max_point_distance):
	for point_index in range(1, target_node.get_point_count()):
		var previous_point_position = target_node.get_point_position(point_index - 1)
		var current_point_position = target_node.get_point_position(point_index)
		var previous_to_current_direction = (
			(current_point_position - previous_point_position).normalized()
		)
		var constrained_new_position = (
			previous_point_position + previous_to_current_direction * max_point_distance
		)
		target_node.set_point_position(point_index, constrained_new_position)


func _on_cherries_eaten():
	ate_cherries.emit()
