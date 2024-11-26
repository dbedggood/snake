GDPC                �                                                                         P   res://.godot/exported/133200997/export-151944cc1a3c50284be545b9c5908942-main.scn*      �      ��q� A�%�x�    T   res://.godot/exported/133200997/export-44993e454a239f783ef7361281f79f67-cherries.scn`       [
      �D�i� oxJ�E�I�}    T   res://.godot/exported/133200997/export-62d3af2d7f65c27adc3d63e8332852dd-snake.scn   �      �
      :˧������8S{}}mJ    ,   res://.godot/global_script_class_cache.cfg  �.             ��Р�8���8~$}P�       res://.godot/uid_cache.bin  /      �       FP�&�� 8�N}r�       res://project.binary�/      �      "}e� �I�7eTv5Z    $   res://project/cherries/cherries.gd          Y       K�-�w�Ϻv=ت��    ,   res://project/cherries/cherries.tscn.remap  �-      e       {��J�ԆX"�!�38�       res://project/constants.gd  �%      #      �T�n��x8�m�aB7F8       res://project/main.gd   �&      E      &��T�\�+�FEe        res://project/main.tscn.remap   �.      a       4!�lN�oQ��٧~�f       res://project/snake/body.gd �
      l      �#�>�!��,�;�\��       res://project/snake/head.gd 0      P      ��3Wp�-�+����2        res://project/snake/head_area.gd�      �       5���-�yl.���)       res://project/snake/snake.gd`      �      ,��ol�@,�V��    $   res://project/snake/snake.tscn.remap.      b       } �AQꂯ�BM;���       res://project/snake/tail.gd �"      �      ����#R|�/����            extends Area2D

signal eaten


func _on_area_entered(_area):
	eaten.emit()
	queue_free()
       RSRC                    PackedScene            ��������                                                  .    scale    resource_local_to_scene    resource_name    custom_solver_bias    radius    script    length 
   loop_mode    step    tracks/0/type    tracks/0/imported    tracks/0/enabled    tracks/0/path    tracks/0/interp    tracks/0/loop_wrap    tracks/0/keys    _data 	   _bundled       Script #   res://project/cherries/cherries.gd ��������      local://CircleShape2D_v21nt �         local://Animation_fm4vm �         local://Animation_8uku5 �         local://AnimationLibrary_n2gq7          local://PackedScene_t36rw z         CircleShape2D            pA      
   Animation          o�:      
   Animation 	            spawn 
         value                                                                    times !             ?��?      transitions !         ?  �?   ?      values       
   �{,�{,
      @   @
      @   @      update                 AnimationLibrary                   RESET                spawn                   PackedScene          	         names "      	   Cherries    scale    collision_layer    collision_mask    script    Area2D    CollisionShape2D    shape    BackCherry 	   position    color    polygon 
   Polygon2D    Stalk    points    width    default_color    begin_cap_mode    Line2D    FrontCherry    AnimationPlayer 
   libraries 	   autoplay    _on_area_entered    area_entered    	   variants       
   ��'7��'7                                
     ��   �   ��?          �?%        `A  �@  �A   @  �A   @  �A  �@  �A   @  �A   @  �A  �@  �A  �@  �A   A  �A  @A  �A  PA  �A  PA  �A  @A  `A   A  PA  �@
     B    %        ��  �@  ��      ��  ��z6��� ��  ��  �  ��  `�     �?       ���>      �?
     ��  ��   ��*?          �?
     �A  ��%        @�  �@   �          ��  @@   �  �@  `�       ���>      �?                            spawn       node_count             nodes     _   ��������       ����                                              ����                           ����   	      
                             ����   	         	      
                                 ����   	      
                             ����   	               
                                 ����                         conn_count             conns                                       node_paths              editable_instances              version             RSRC     extends Line2D

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
    extends Line2D

@onready var snake = $".."


func _process(_delta):
	var head_tip_position = get_global_mouse_position()
	set_point_position(Constants.HEAD_TIP_POINT_INDEX, head_tip_position)
	snake.set_constrained_nodes(self, Constants.HEAD_MAX_POINT_DISTANCE)


func _draw():
	var snake_head_tip = get_point_position(Constants.HEAD_TIP_POINT_INDEX)
	var snake_head_centre = get_point_position(Constants.HEAD_CENTRE_POINT_INDEX)
	var snake_head_direction = (snake_head_tip - snake_head_centre).normalized()

	#draw eyes
	var left_eye_offset = snake_head_direction.orthogonal() * Constants.PUPILLARY_DISTANCE
	var right_eye_offset = snake_head_direction + left_eye_offset * -1
	draw_circle(snake_head_centre + left_eye_offset, Constants.EYE_RADIUS, Color.BLACK)
	draw_circle(snake_head_centre + right_eye_offset, Constants.EYE_RADIUS, Color.BLACK)
extends Area2D

@onready var head = $".."


func _process(_delta):
	var head_tip_position = head.get_point_position(Constants.HEAD_TIP_POINT_INDEX)
	position.x = head_tip_position.x
	position.y = head_tip_position.y
        extends Node2D

signal ate_cherries


func set_constrained_nodes(target_node, max_point_distance):
	for point_index in range(1, target_node.get_point_count()):
		var previous_point_position = target_node.get_point_position(point_index - 1)
		var current_point_position = target_node.get_point_position(point_index)
		var previous_to_current_vector = current_point_position - previous_point_position
		var constrained_new_position = (
			previous_point_position + previous_to_current_vector.normalized() * max_point_distance
		)
		target_node.set_point_position(point_index, constrained_new_position)


func _on_cherries_eaten():
	ate_cherries.emit()
      RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 
   min_value 
   max_value    bake_resolution    _data    point_count    script    metadata/_snap_enabled    custom_solver_bias    radius 	   _bundled       Script    res://project/snake/snake.gd ��������   Script    res://project/snake/body.gd ��������   Script    res://project/snake/tail.gd ��������   Script    res://project/snake/head.gd ��������   Script !   res://project/snake/head_area.gd ��������      local://Curve_d3lmw �         local://Curve_xg11q �         local://CircleShape2D_54wsa P         local://PackedScene_y43gt n         Curve             
       ��?                            
   ��L>��?                            
     �?���>                                                       Curve             
       ���>                            
   ���>  �?                            
     �?��?                                                       CircleShape2D             PackedScene          	         names "         Snake    z_index    script    metadata/_edit_group_    Node2D    Body    points    width    default_color    joint_mode    begin_cap_mode    Line2D    Tail    width_curve    end_cap_mode    Head 	   HeadArea    collision_layer    collision_mask    Area2D    CollisionCircle    shape    CollisionShape2D    _on_snake_ate_cherries    ate_cherries    _on_body_grown    grown    _on_head_area_area_entered    area_entered    	   variants                             %        pB�{,  �B�{,  �B�{,  �B�{,  �B�{,  �B�{,  �B�{,  C�{,  C�{,  C�{,   C�{,  *C�{,  4C�{,  >C�{,  HC�{,  RC�{,     �A       ��?      �?               %        RC�{,  \C      fC�{,  pC�{,  zC�{,  �C�{,  �C         HB                   %      �{,�{,  �A�{,  pB�{,                                                node_count             nodes     b   ��������       ����                                        ����                     	      
                              ����            	      
         	      
                                    ����            	               	      
                             ����                                      ����                   conn_count             conns                                                                                    node_paths              editable_instances              version             RSRC      extends Line2D

@onready var snake = $".."
@onready var body = $"../Body"


func _process(_delta):
	var tail_base_position = body.get_point_position(body.get_point_count() - 1)
	set_point_position(0, tail_base_position)
	snake.set_constrained_nodes(self, Constants.BODY_MAX_POINT_DISTANCE)


func _on_body_grown():
	var tail_tip_index = get_point_count() - 1
	var tail_tip_position = get_point_position(tail_tip_index)
	var tail_tip_from_previous_point_vector = (
		tail_tip_position - get_point_position(tail_tip_index - 1)
	)

	for tail_point_index in range(tail_tip_index):
		set_point_position(tail_point_index, get_point_position(tail_point_index + 1))

	set_point_position(tail_tip_index, tail_tip_position + tail_tip_from_previous_point_vector)
extends Node

const VIEWPORT_PADDING = 50

const EYE_RADIUS = 6
const PUPILLARY_DISTANCE = 15

const HEAD_TIP_POINT_INDEX = 0
const HEAD_CENTRE_POINT_INDEX = 1
const HEAD_BASE_POINT_INDEX = 2

const HEAD_MAX_POINT_DISTANCE = 30
const BODY_MAX_POINT_DISTANCE = 5

const BODY_POINT_GROWTH = 5
             extends Node2D

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
           RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://project/main.gd ��������   PackedScene %   res://project/cherries/cherries.tscn ��5Ig:   PackedScene    res://project/snake/snake.tscn b����[      local://PackedScene_vddoq �         PackedScene          	         names "         Main    script    cherries_scene    Node2D 	   Camera2D    anchor_mode    Snake    	   variants                                                node_count             nodes        ��������       ����                                  ����                     ���                    conn_count              conns               node_paths              editable_instances              version             RSRC   [remap]

path="res://.godot/exported/133200997/export-44993e454a239f783ef7361281f79f67-cherries.scn"
           [remap]

path="res://.godot/exported/133200997/export-62d3af2d7f65c27adc3d63e8332852dd-snake.scn"
              [remap]

path="res://.godot/exported/133200997/export-151944cc1a3c50284be545b9c5908942-main.scn"
               list=Array[Dictionary]([])
        ��5Ig:$   res://project/cherries/cherries.tscnb����[   res://project/snake/snake.tscn�����F$1   res://project/main.tscn               ECFG      application/config/name         snake      application/run/main_scene          res://project/main.tscn    application/config/features(   "         4.2    GL Compatibility       autoload/Constants$         *res://project/constants.gd #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility 