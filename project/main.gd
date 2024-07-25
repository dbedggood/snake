extends Node2D

@export var cherries_scene: PackedScene

@onready var camera = $Camera2D
@onready var snake = $Snake


func _ready():
	spawn_cherries()


func _on_cherries_eaten():
	spawn_cherries()


func spawn_cherries():
	var cherries = cherries_scene.instantiate()
	var viewport_size = camera.get_viewport().get_visible_rect().size

	var cherriesSpawnX = get_padded_cherry_spawn_dimension(viewport_size.x)
	var cherriesSpawnY = get_padded_cherry_spawn_dimension(viewport_size.y)
	cherries.position = Vector2(cherriesSpawnX, cherriesSpawnY)

	cherries.eaten.connect(_on_cherries_eaten)
	cherries.eaten.connect(snake._on_cherries_eaten)

	call_deferred("add_child", cherries)


func get_padded_cherry_spawn_dimension(max_value):
	return (
		Constants.VIEWPORT_PADDING + (randi() % (int(max_value) - Constants.VIEWPORT_PADDING * 2))
	)
