extends Line2D

signal grown

@onready var snake = $".."
@onready var head = $"../Head"
@onready var tail = $"../Tail"

@onready var body_collisions = $BodyArea/BodyCollisions


func _process(_delta):
	set_point_position(0, head.get_point_position(Constants.HEAD_BASE_POINT_INDEX))
	snake.set_constrained_nodes_with_collisions(self, Constants.BODY_MAX_POINT_DISTANCE)

	var snake_body_point_directions = snake.body_point_directions

	if !snake_body_point_directions.is_empty():
		var body_point_count = get_point_count()
		var new_body_collisions_polygon: PackedVector2Array = body_collisions.polygon

		for point_index in range(1, body_point_count * 2 - 1):
			if point_index < body_point_count:
				var point_position = get_point_position(point_index)
				var collision_position = (
					point_position + snake_body_point_directions[point_index - 1].orthogonal() * 8
				)
				new_body_collisions_polygon.set(point_index - 1, collision_position)
			else:
				var reverse_point_index = body_point_count * 2 - (point_index + 1)
				var point_position = get_point_position(reverse_point_index)
				var collision_position = (
					point_position + snake_body_point_directions[point_index - 1].orthogonal() * -8
				)
				new_body_collisions_polygon.set(point_index - 1, collision_position)

		body_collisions.polygon = new_body_collisions_polygon


func _on_snake_ate_cherries():
	for i in Constants.BODY_POINT_GROWTH:
		grow_body()
		await get_tree().create_timer(0.05).timeout


func grow_body():
	var new_point_position = tail.get_point_position(1)
	add_point(new_point_position)

	var new_body_collisions_polygon: PackedVector2Array = body_collisions.polygon

	# TODO: insert these at the right location
	new_body_collisions_polygon.append(Vector2.ZERO)
	new_body_collisions_polygon.append(Vector2.ZERO)

	body_collisions.set_deferred("polygon", new_body_collisions_polygon)

	grown.emit()
