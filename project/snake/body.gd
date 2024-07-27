extends Line2D

signal grown

var point_collision_areas = []

@onready var snake = $".."
@onready var head = $"../Head"
@onready var tail = $"../Tail"


func _ready():
	for body_point_index in get_point_count():
		add_collision_area(get_point_position(body_point_index))


func _process(_delta):
	set_point_position(0, head.get_point_position(Constants.HEAD_BASE_POINT_INDEX))
	snake.set_constrained_nodes(self, Constants.BODY_MAX_POINT_DISTANCE)

	#apply body point positioning to collision areas
	for collision_area_index in get_point_count():
		point_collision_areas[collision_area_index].set_position(
			get_point_position(collision_area_index)
		)


func _on_snake_ate_cherries():
	for i in Constants.BODY_POINT_GROWTH:
		grow_body()
		await get_tree().create_timer(0.05).timeout


func grow_body():
	var new_point_position = tail.get_point_position(1)
	add_point(new_point_position)
	add_collision_area(new_point_position)
	grown.emit()


func add_collision_area(point_position):
	var area = Area2D.new()
	var shape = CircleShape2D.new()
	var collision = CollisionShape2D.new()

	shape.set_radius(5)
	collision.set_shape(shape)
	area.set_position(point_position)
	area.add_child(collision)
	add_child(area)
	point_collision_areas.append(area)


func _on_head_area_area_entered(area):
	if area.collision_layer == 1:
		head.get_child(0)
		for i in get_point_count():
			var last_point_index = get_point_count() - 1
			if last_point_index > 15:
				var last_point_collision_area = point_collision_areas.pop_back()
				last_point_collision_area.queue_free()
				remove_point(last_point_index)
				await get_tree().create_timer(0.01).timeout
