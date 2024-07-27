extends Snake

signal grown

@onready var snake = $".."
@onready var head = $"../Head"
@onready var tail = $"../Tail"


func _ready():
	pass


func _process(_delta):
	set_point_position(0, head.get_point_position(Constants.HEAD_BASE_POINT_INDEX))
	snake.set_constrained_nodes(Constants.BODY_MAX_POINT_DISTANCE)


func _on_snake_ate_cherries():
	for i in Constants.BODY_POINT_GROWTH:
		grow_body()
		await get_tree().create_timer(0.1).timeout


func grow_body():
	var new_point_position = tail.get_point_position(1)
	add_point(new_point_position)
	grown.emit()
