extends Line2D

signal grown

@onready var snake = $".."
@onready var head = $"../Head"
@onready var tail = $"../Tail"


func _process(_delta):
	set_point_position(0, head.get_point_position(Constants.HEAD_BASE_POINT_INDEX))
	snake.set_constrained_nodes(self, Constants.BODY_MAX_POINT_DISTANCE)


func _on_snake_ate_cherries():
	grow_body()


func grow_body():
	add_point(tail.get_point_position(1))
	grown.emit()
