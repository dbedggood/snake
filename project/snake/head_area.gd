extends Area2D

@onready var head = $".."


func _process(_delta):
	var head_tip_position = head.get_point_position(Constants.HEAD_TIP_POINT_INDEX)
	position.x = head_tip_position.x
	position.y = head_tip_position.y
