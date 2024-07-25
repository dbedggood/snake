extends Area2D


func _process(_delta):
	var head_tip_position = get_global_mouse_position()
	position.x = head_tip_position.x
	position.y = head_tip_position.y
