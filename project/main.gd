extends Node2D

@export var cherries_scene: PackedScene

@onready var camera_2d = $Camera2D
@onready var snake = $Snake


func _ready():
	spawn_cherries()


func _on_cherries_eaten():
	spawn_cherries()


func spawn_cherries():
	var cherries = cherries_scene.instantiate()
	var viewport = camera_2d.get_viewport()
	var viewport_size = viewport.get_visible_rect().size

	var cherriesX = min(max(randi() % int(viewport_size.x), 50), int(viewport_size.x) - 50)
	var cherriesY = min(max(randi() % int(viewport_size.y), 50), int(viewport_size.y) - 50)
	cherries.position = Vector2(cherriesX, cherriesY)

	cherries.eaten.connect(_on_cherries_eaten)
	cherries.eaten.connect(snake._on_cherries_eaten)

	call_deferred("add_child", cherries)
