extends Line2D

@onready var snake = $".."


func _process(_delta):
	var head_tip_position = get_global_mouse_position()
	set_point_position(Constants.HEAD_TIP_POINT_INDEX, head_tip_position)
	snake.set_constrained_nodes(self)


func _draw():
	var snake_head_tip = get_point_position(Constants.HEAD_TIP_POINT_INDEX)
	var snake_head_centre = get_point_position(Constants.HEAD_CENTRE_POINT_INDEX)
	var snake_head_direction = (snake_head_tip - snake_head_centre).normalized()

	#draw eyes
	var left_eye_offset = snake_head_direction.orthogonal() * Constants.PUPILLARY_DISTANCE
	var right_eye_offset = snake_head_direction + left_eye_offset * -1
	draw_circle(snake_head_centre + left_eye_offset, Constants.EYE_RADIUS, Color.BLACK)
	draw_circle(snake_head_centre + right_eye_offset, Constants.EYE_RADIUS, Color.BLACK)
