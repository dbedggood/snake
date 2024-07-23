GDPC                �                                                                      
   P   res://.godot/exported/133200997/export-151944cc1a3c50284be545b9c5908942-main.scn�      �      j���u0c�y�c�s    T   res://.godot/exported/133200997/export-62d3af2d7f65c27adc3d63e8332852dd-snake.scn   `
      �      y�oN�g�5��r�1B�2    ,   res://.godot/global_script_class_cache.cfg                ��Р�8���8~$}P�       res://.godot/uid_cache.bin         {      ��e�� B�	(Bɋ?       res://project.binary�      s      �y�=�Jm�*�vz���        res://project/main.tscn.remap   �      a       4!�lN�oQ��٧~�f       res://project/snake/body.gd               �H�����C�����b�       res://project/snake/head.gd        :      P��G�����ۥ��    $   res://project/snake/snake.tscn.remap       b       } �AQꂯ�BM;���       res://project/snake/tail.gd �      �      ��vy�Zq���Y�        extends Line2D

signal body_grown

@onready var head = $"../Head"

const MAX_POINT_DISTANCE = 30


func _process(delta):
	var point_count = get_point_count()
	set_point_position(0, head.get_point_position(2))

	for point_index in range(1, point_count):
		var previous_point_position = get_point_position(point_index - 1)
		var current_point_position = get_point_position(point_index)
		var previous_to_current_vector = current_point_position - previous_point_position
		var constrained_new_position = (
			previous_point_position + previous_to_current_vector.normalized() * MAX_POINT_DISTANCE
		)
		set_point_position(point_index, constrained_new_position)


func _input(event):
	var point_count = get_point_count()
	var last_point_index = point_count - 1

	if event.is_action_pressed("grow_snake"):
		print("grow!")
		var snake_tail_tip = get_point_position(last_point_index)
		var snake_tail_base = get_point_position(last_point_index - 1)
		var snake_tail_direction = (snake_tail_tip - snake_tail_base).normalized()

		add_point(get_point_position(last_point_index) + snake_tail_direction * MAX_POINT_DISTANCE)
		body_grown.emit()

	if event.is_action_pressed("shrink_snake"):
		if point_count > 3:
			print("shrink!")
			remove_point(last_point_index)
		else:
			print("too small to shrink!")
               extends Line2D

const EYE_RADIUS = 6
const PUPILLARY_DISTANCE = 15

const MAX_MOUSE_DISTANCE = 10
const MAX_POINT_DISTANCE = 30

const HEAD_TIP_POINT_INDEX = 0
const HEAD_CENTRE_POINT_INDEX = 1
const HEAD_BASE_POINT_INDEX = 2


func _process(delta):
	var head_tip_position = get_global_mouse_position()
	set_point_position(HEAD_TIP_POINT_INDEX, head_tip_position)

	for point_index in range(1, 3):
		var previous_point_position = get_point_position(point_index - 1)
		var current_point_position = get_point_position(point_index)
		var previous_to_current_vector = current_point_position - previous_point_position
		var constrained_new_position = (
			previous_point_position + previous_to_current_vector.normalized() * MAX_POINT_DISTANCE
		)
		set_point_position(point_index, constrained_new_position)


func _draw():
	var snake_head_tip = get_point_position(HEAD_TIP_POINT_INDEX)
	var snake_head_centre = get_point_position(HEAD_CENTRE_POINT_INDEX)
	var snake_head_direction = (snake_head_tip - snake_head_centre).normalized()

	#draw eyes
	var left_eye_offset = snake_head_direction.orthogonal() * PUPILLARY_DISTANCE
	var right_eye_offset = snake_head_direction + left_eye_offset * -1
	draw_circle(snake_head_centre + left_eye_offset, EYE_RADIUS, Color.BLACK)
	draw_circle(snake_head_centre + right_eye_offset, EYE_RADIUS, Color.BLACK)
      RSRC                    PackedScene            ��������                                            
      resource_local_to_scene    resource_name 
   min_value 
   max_value    bake_resolution    _data    point_count    script    metadata/_snap_enabled 	   _bundled       Script    res://project/snake/head.gd ��������   Script    res://project/snake/body.gd ��������   Script    res://project/snake/tail.gd ��������      local://Curve_xg11q          local://Curve_d3lmw �         local://PackedScene_5jxqb n         Curve             
       ���>                            
   ���>  �?                            
     �?��?                                                       Curve          
   
       ��?                            
     �?���>                                                       PackedScene    	      	         names "         Snake    metadata/_edit_group_    Node2D    Head    points    width    width_curve    default_color    joint_mode    begin_cap_mode    script    Line2D    Body    Tail    end_cap_mode    _on_body_body_grown    body_grown    	   variants             %      �{,�{,  HB�{,  �B�{,     HB                 ��?      �?                %        �B�{,  HC�{,     �A       ��?      �?         %        HC�{,  �C�{,                        node_count             nodes     H   ��������       ����                            ����                                 	      
                        ����                  	         	      
   
                     ����                                 	            
                conn_count             conns                                     node_paths              editable_instances              version             RSRC              extends Line2D

const MAX_POINT_DISTANCE = 30
const TAIL_BASE_POINT_INDEX = 0
const TAIL_TIP_POINT_INDEX = 1

@onready var body = $"../Body"


func _process(delta):
	var tail_base_position = body.get_point_position(body.get_point_count() - 1)
	set_point_position(TAIL_BASE_POINT_INDEX, tail_base_position)

	var tail_tip_position = get_point_position(TAIL_TIP_POINT_INDEX)
	var base_to_tip_direction = (tail_tip_position - tail_base_position).normalized()
	var constrained_new_position = tail_base_position + base_to_tip_direction * MAX_POINT_DISTANCE
	set_point_position(TAIL_TIP_POINT_INDEX, constrained_new_position)


func _on_body_body_grown():
	var tail_base_position = body.get_point_position(body.get_point_count() - 1)
	var base_to_tip_vector = (
		tail_base_position - body.get_point_position(body.get_point_count() - 2)
	)
	set_point_position(TAIL_TIP_POINT_INDEX, tail_base_position + base_to_tip_vector)
           RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       PackedScene    res://project/snake/snake.tscn b����[      local://PackedScene_27nsi          PackedScene          	         names "         Main    Node2D    Snake    	   variants                       node_count             nodes        ��������       ����                ���                     conn_count              conns               node_paths              editable_instances              version             RSRC[remap]

path="res://.godot/exported/133200997/export-62d3af2d7f65c27adc3d63e8332852dd-snake.scn"
              [remap]

path="res://.godot/exported/133200997/export-151944cc1a3c50284be545b9c5908942-main.scn"
               list=Array[Dictionary]([])
        �mS]�v   res://icon.svg�����F$1   res://main.tscnb����[   res://snake.tscn=�l���b   res://wiggler.tscnb����[   res://snake/snake.tscn=�l���b"   res://archive/wiggler/wiggler.tscn�����F$1   res://src/main.tscnb����[   res://src/snake/snake.tscn�����F$1   res://main.tscn�����F$1   res://src/main.tscn�o�o�!   res://docs/index.icon.pngj��H2%   res://docs/index.apple-touch-icon.png���2�V   res://docs/index.pngf�w�k'M%   res://dist/index.apple-touch-icon.png�)�чE�U   res://dist/index.icon.png"�}YJ2{   res://dist/index.png�����F$1   res://project/main.tscnb����[   res://project/snake/snake.tscn     ECFG      application/config/name         snake      application/run/main_scene          res://project/main.tscn    application/config/features(   "         4.2    GL Compatibility       input/grow_snake�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script         input/shrink_snake�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script      #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility             