GDPC                �                                                                         T   res://.godot/exported/133200997/export-343260f166ed44b6779fdf4991ea2236-snake.scn    w      v      �,�M�w%.t5T    T   res://.godot/exported/133200997/export-3bb3e8316df5682fb67a951ec53f009a-wiggler.scn 0      n      �:�4��ɋ�����E    P   res://.godot/exported/133200997/export-dbe59258b6e7c5860bca2a5bbd0223c3-main.scn �      �      �*p�n�㽮�X]��B    ,   res://.godot/global_script_class_cache.cfg   �             ��Р�8���8~$}P�    X   res://.godot/imported/index.apple-touch-icon.png-b21a756d869f84af832970a74d8371bc.ctex  �      �      ��Q�-޾��PbPT    L   res://.godot/imported/index.icon.png-b92c9a802ad4b78e247784454a6b506f.ctex   $      �      ���wE6 �΢�tAԡ    H   res://.godot/imported/index.png-0c78d14d192abe5f22f8c25928ca1ab8.ctex   �>      -      �%�$����<�׿�+       res://.godot/uid_cache.bin   �      �      ��Y+o��gq�����        res://archive/wiggler/wiggler.gd        0      )9cp���s�<�a    (   res://archive/wiggler/wiggler.tscn.remap��      d        3�خѨ�`k���cN    ,   res://docs/index.apple-touch-icon.png.import@#      �       τ
mY��+�B܇�a        res://docs/index.icon.png.import�=      �       �{�,��=8� ġ�       res://docs/index.png.import �k      �       {�q�d9ʋ/%JBb�       res://project.binary��      o      �� ��ũ��n)А�       res://src/main.tscn.remap   ��      a       6�-�	��6��s�M�       res://src/snake/body.gd �l            �H�����C�����b�       res://src/snake/head.gd �q      :      P��G�����ۥ��        res://src/snake/snake.tscn.remap �      b       C��#e`i5��9�       res://src/snake/tail.gd �~      �      ��vy�Zq���Y�    extends Line2D

const MAX_POINT_DISTANCE = 50
const PUPILLARY_DISTANCE = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var point_count = get_point_count()
	var mouse_position = get_global_mouse_position()
	set_point_position(0, mouse_position)

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

	if event.is_action_pressed("shrink_snake"):
		if point_count > 3:
			print("shrink!")
			remove_point(last_point_index)
		else:
			print("too small to shrink!")


func _draw():
	var snake_head_tip = get_point_position(0)
	var snake_head_base = get_point_position(1)
	var snake_head_direction = (snake_head_tip - snake_head_base).normalized()

	#draw eyes
	var left_eye_offset = snake_head_direction.orthogonal() * 20
	var right_eye_offset = left_eye_offset * -1
	draw_circle(snake_head_tip + left_eye_offset, PUPILLARY_DISTANCE / 2, Color.BLACK)
	draw_circle(snake_head_tip + right_eye_offset, PUPILLARY_DISTANCE / 2, Color.BLACK)
RSRC                    PackedScene            ��������                                            
      resource_local_to_scene    resource_name 
   min_value 
   max_value    bake_resolution    _data    point_count    script    metadata/_snap_enabled 	   _bundled       Script !   res://archive/wiggler/wiggler.gd ��������      local://Curve_omd7f �         local://PackedScene_rbxko �         Curve             
       ���>                            
   ���=333?                            
   ��L>���>                            
   ���>���>                            
   333?���>                            
     �?��L>                                                       PackedScene    	      	         names "   
      Wiggler    points    width    width_curve    default_color    joint_mode    begin_cap_mode    end_cap_mode    script    Line2D    	   variants       %   
     �B   A  C   A  pC  @A  �C   A  �C   A  D   A  /D   A  HD   A  aD   A  zD   A     �B                 ��?      �?                      node_count             nodes        ��������	       ����                                                              conn_count              conns               node_paths              editable_instances              version             RSRC  GST2   �   �      ����               � �        h  RIFF`  WEBPVP8LT  /��,� j�F�w��G|$"���M�P��ٷQ�6�d(��[nw�Q$I�j��J�+�`�F��� ��c�|�<�OJ!�P
؍d����S�;��O���m��{BDL 	yT�R��S$���텺��0�=Jǜ(f{*�\*������8ff�da�k!#�m#A����Sc���>��-I�$E�4"����� Smwe�lێ�9�/�줎S��lc��ɶ���4ٶݮ��;pI���e>|�7l�Ӷ���!��`��a̼�5ޛ�����1333333��:lא����$�K/z��t۶i�ڶ���\{͵m^�m�]�
_�aо��5����
پ��9s�W��m��m�VL�o�--6�$n��Ck��{ΚC��H�$1���_\�}CL  �| ��  ���Y�ȁ�)��Ġ!C&�@�A�_�<Gܱ����}���4��j ���  ��	�w;<uo� A��;V�oo�	�"�C�+��Lyϧ�����;�A+�  ]z�m�CzH('�O?K���ߌ��p�n��@#!@6�ίO<��٣�o�������ig��aȪ{{f��H�z	I0��_���kd���'����#��hܸ~jB"PM�kj���v�.�W`�`�8|*��.O{��Z�L�`�@P���E�%@"���8���!�u !E�bԋ�ِ$��2I��F ��q`�J�!�T�.�T������U�AT$�:���-Unp�� z�XpK�u�r�R� ����]���Eoj@?;���8 �*6���F�नSu��$�Їu��� ����ܦ�-75��YpE��\'# �4Bf)��	r��7��3��K���ܦ��hx���٦�&(�]�:e��w���� <����_�gM-����unA��Q��{�������N�{D��+ V�v������W?/Q��G`�Ζ�S��b��z�Q�A|1A�	g5�O�O�I��^
�^rKH���|Ua��_o#ƕ�4Ġ��8҅����e��"�Zr@E�BJ
@9�O�s�d� �	�5�m����  �I	(�[��V�M�CK,l�BC(����B�Xca-A0@��k h�B R ��������!m�2u$X��h�Os�z���M]맯�dDn�c����혥���-�[�E[�yq�!�e}C�D/  �|��8a7�ƌ  �ɗ�]��Ƶ�M �,%w�P����a6	f�|�
Oe�.7o5��1���:�"{��KNb������>6����-��25��un�|�W���厍��*�E� �d{�}Zj���MUF]���#Ԗw4�WI���+�e���xvh����k"�9�(�2A��ȉX�	�~^�IQ�8�63�#)�x2�(����-����a0�1>��Bӿ�����W�&e�%�:N�v9��ʘaZN7��ܜ���b��-�*7	��!��u��� �<S��)�% ��+�ԥ,�.����IS#TŒ�K�oU��D�u,�J7�DK��ao�����a�4$9"!9�v;�t��$�RLMS]���1Ҧ���D��5-���e���[�	Ȥ�Z�$��ٍ�s[�lG��b���eH[�kW��elC�o��ᛘ�N
��e �R��ͭ`Q�U�s�\#�{n��dk��]�]����$����I�p�Z�ݮ�������s}�I��]!��,���]��� `�<K\ڦzzu5�l}��F�(d���P@�0lL  �`�0�����J5������D��t7�H��-����
� �ms��oOфӊ:�������(]s�j\�]�H����w����R"o.$(Ige[$g�}E &�vLbO�j��X�VZy�����7�����P7MX�h5E�smh�dm�Ai^\4���l����c>�ĝoM�P\��}�z��%��X+�{������{�r���Z�̨�*qbP�ټ�H��t1��3ˁ�8u����F����fGj;;*GBuO���T���'���qN�*�Z���Fb�;<��13��`�����fH��.7ś�����_c,�=9�v�������`x�p�J�YJ7��#�h�z�� iI��&���	H�춉3�,������6;��\�h�d��׳�ҳ�a̓�����_�.@��V�Ãn��  ��Oݪ��ޒsw�/����p�����o��N�Җk��y���
���w�G���4~RO�l�����������x����/��S���]�՗O������#o�y�4v��<Tn'Bd����v���;}�)Anw?k���=�A���b�zv�O��ǤE\+��;��?��@b�}�|u������ �p�5y�0wx@��+};��kO?w���E�\�mЎ�]�>�wzͿ���ϴ���q  �ǟs��U:z<%�� �۱�����{6p ��+w���ew�L �Ѻ'}Y���K�Ʀ�K ���܏�:���T>u Xy��B���Zq���o촍W�&�ԗsU@�2o�ya_ ����O���;ci��!����#Е_�0 ��>q��;=������{D�}b�z(c%��{���ܧ�/Е�_���;; H,��̩'�5�������@d���9 ���Q�H켗m����62��_i�}�-�S�X ��$_�M���� �.6=����x%��~���R�� `�^�	h.�\���HZ}�̕hţ�- |�扩��*w �Ƨ�Ov7���qe��9��\j�hd|�#����F�EKm���́�r�i+\x�ɿ�Z�mF-b��[�)�\'�f������u������!�. b] =yo�p5�e.�y���;��VB�t ���Z���N<�kC�o�;w �1�7�@0k���}�T���V��	�I���ֶ�Ubl�@s���5�6X�:1,����������\3 �;l��?�O�{��w�;~
*q-�B5�O �����z�'�������$�5���� �}���{��?�J�᛿x���D��?S�z���C���CK�k��HZ���m �cvTٱt �d���y�W}�٢�y�y�W�����wt\oJ����{�3��׿�mQ��ޝ~3 @P�[
d��谅;�����/���]�����^��m�Ԇ�'���K���j�o���%�����>=���G��u<���Ō��Q �?��^�~���kΟ�>M�w[��������-���sWG�G�����V�sx���c�����9�B�������/�����95��
�X����: ���/^��Uw�ֻr�V�;/w�r���@#�xܩ�ֳ��G�Z�"���{�W�Q[�?�u�n.�+�a�8_~6x9�B�`��ņ�+ �Õ��H�+�������\�؀��:���8Cɨ�;E���c�o�|5����si]Kw]%.��N��xLuu��@����زv�FS�f:6�7�K@�p]�_ez���V��ʎ���a�ωsӑ�����F"��:_\��5�<f�)�Sv|���c H %�
�?�~�ܹa�HZH3�9�k���  	.�fP�:��?9
	����7.pS����B����a8��V���J�4}�M���U�Jܘ�r*j!9�r��*T.W�ˍ�7H�.�������/	#e����7g�Nr�	'5h��̍z�"��(W&�̜�2e�K�4i�1�f�򿐀D�s�#<���k귋Ha2w癍�.���
!h	 p:�7�&!$lQ�q����p�L��?84�ɖ������ah;�K�� �������@</5RC��HW|%-p_�o_@��.˓O�T���S+C �'d){;M��9?]:"Hj�7.t|�'�J�XE�Q%���@�ŋ�r�#^�O]��5��d�%`t�2��$^B�
�����kF��|��z �t ܐ$���u�>!����st��Hc @�"�!'����� 	!��\{���a!��'Q����7�l/ @*}`�B �ڛFH�g|������)4�'`n"u�МޅI��4���\���^*'�$�[ WR�4ڥ�D��%�kM�݉(j����7�Rĉ��,���J�'O�Zv�-7y�&/��<y9�:���'��r�Rׅ����!CF2d��bTm�h��H����h�6� ��Xb�#��`�m��C}��P�+T��/W�� �I�2]:��e��B�9
MZ��H"���Y���w�G�h�ǜI���=�߂��?�ܯ>2!��E�Οp��{<Ss��g[���#�'����'������o��x���ۋ��}> �����W)^}�~�?�F32�H���������`Bj���O`My���+����~��PDӌ4B|�������n�k�6s�k���u�:s��a��?��cٮ��wޯ���\����I���͹�s����m�_w7�m�v���v����|�]��ǹ��۽xDk:�2d��1� ��!�@"�ɴ#�>���˜b��u��?�n !����/����i�[�7rn������Ņ�����!�pH����xu��o��5$1�i�Ξ�P'���,dz�BiH�0��ҥ���(�5�)2�� 2!Z���L,��\��c.+�,��	H�l����&�1�`H]ݺ�
�y�b4�4��v%�H��b\�� i�Ő�v�Pd���cv�@�h��]��T8�&��]� ��7��H�d$XÝ(J��X�L$�c�fs��	aHc*X��9�r���<�	(�Y�k�+)�'���+�Z�z-�����h}��B�H���	r��l��M���U&_Җ�����t�	���]M���)��MB�L^��9��K&l��0�kP����-����r0��MO��ay�tO��@	ڇKO,<O>�s��� ����A��W��В(�
%Ċ����{x�<I)�XP�R�xM��j �"�䖔��C ���|�� ��]v���<w�]؟�����S��I/Eo A�-dx�;�#^OyO�!�1#��I*R��
x�xo�w.;�>xSQ'#(H�|��c��:�v�qhu���� 0��YR��)������=�q ��׷�@��`�;ʗl1fv�p5���u��	Q'��]�箐<�ǿ��W�[��y D]zMkj����mS��
�����' ����o�^ ���
���q�v�6-N�)��}��������� �TlH/hu��ޝELx��\�����M�}����vvǆ[![\��[�l�H��',oyw��g{ x���G�# ����/���a�>��߹2 ����da��"z�!��-��sy{K�C�㹦¡�
 @��'��}C�A(�.�;���!w����Y~�� �v������V)/X����d��o�"H*�%�] ������U�H�9m�$�:	�3}�kl�>
�faY3�<z# ��s����(��D��g����b��j��l��yj��e}@d�� ������~^�	g5���\h��rȆ���pnt֒I窂!���}�n-���; \����}���0�lȟ����VB1dA
$(������JwZ��l{������Ļ� <�� ��� [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://x2xagl64uq3q"
path="res://.godot/imported/index.apple-touch-icon.png-b21a756d869f84af832970a74d8371bc.ctex"
metadata={
"vram_texture": false
}
               GST2            ����                        |  RIFFt  WEBPVP8Lh  /��?�(Hۀ�������� �N�X�t5ɒ$�n��T� Z�����o��ݙ��<_�@��m���k��m�HN�C';���ڎ=:������mu�ƶ�Mot�m�vl�ǁ۶�D'��}�_��m��V��BB�5��4��H]��� ���JW�sו���e�>C���K�|��%���&���o�O ������,jTd���JA ش�+�y�\C�CF��%I�����\҉���M�fH�~�Dhm۶��ޭj���m��L�A�i�O[S1]�����D۶�����?�K�v��؃�=�(E�Hs I��jz�p	�!����I�$��1d��v��(���\ j��h��G�s��u�@t���@'����q�����IU���6|�  �C�9�_e���q�a2����s�d�ZO�vk�m:������ɰ��L*�o_B;�м�k�K�M�&�C� ɡ��P�_�
������g?�����׼)��`��k����h���DhS4�G��*\q	�L3b�q�*�q��*Zu|�p�x��-����y�}��s�����[�׌K�!�&jV+ҵ
}ް� ��Cvq��-�׻�}����{�kǩ�������6o�R���&��o�gF)�z����jR+�u�b��jx���y�}&�c�[G�� �m�+�G��Z�����ǲ����q�A8#j;5ռ)���O��ײ�Բ��)@��&��,�
�[k�_��&��tc����F
)*��Q�}��>��`��T! TR@*�D_�n���1���ض�Jj=̍�)f�s.��,�T��^�%��^��@��F,��c�g��2�WZ5�R �ƍ�;-ɓx0�ڨ�객h.���53�� �Ԏ`�^3U�1� �g�ڱ�3�,� y� i�su�1�^H���e��*{���3Y,�U���1Pk	g_p�o�~��ڣֽ��lݳ���%x�1[�����^�u�5�j��<�U�@�}f���� ,�"�~���hi���^�RTI�Q��]+"���Fx����Fa�G���gu��҈
�4H
[��>�l2��a�f;e�:�)Rg���+''��'@�D��E�x��r�z�����4�:�T�� �� v۶��q˴įn�S�дBJ{��:Q!Ղ�R��5'�H�n�����Sk��r^枊`.�����s&��P�孶���щ
h%ϘnB���;}6�c����t�z{�TD�Pj��d���U�I5T�P�JzH�i��u�N"-����a�g$Sל��S��nv$* S�n@:#y��k 5����5�壈�/yt�z5��tTp�q��\�C��A����b��&�Zl-�܆���u�u��;�V�
v�=t��N�v>Qi��7��E�k:݅�B��b�[{��g�>��mR��V��͹:ek�j�b���7�Ɨ�����
�ǀ{|�(O�Ġ�3��n�O:�����f��tZl-V�}��\g�Z����^X�?�\]H���t́�AXT@������C@ �N|�T���*���Tnq*�P�7�7NU�{I%QA��ma�w�(�n�� �"7�pF��9[K��� q/��.yv��;
X�8Df��
���}똃�O������r==�kev���1��p+9�}K>��R�!�l%�gBα���e�����h7��7(���g�U���!�s�9xF�V�F�kJ5��͌�:{�#J���F1���tb���A)��ȓ��I�t��!7۩��&��@��.N\	�
Kya���vr�3Nt�q��5����|��s����6����P�*vXZv�0	��ȯ�*�{�����g�~��R�O_ �������ݜ���8���'�L��zzr���5E��1`fDi��La������`��=��^��n�ŀF8��	���sV�Vd�����;`�-�� �7ɓC�7�ƣ;�Q��$B.�à2`R�t��ELl*YAg��J�b���EF��cL.�-� q�\����Յ�I��1`��nvD�;��@_��G�����F'sO=a�I����ƀ���C����2`�������/U3(j����xv$-ز;��lzGa1X�R3B$[>;T�R^(��*�	^w���/�A��&W���Xdj�ė������VZu����{9���a�X���QJI@@I@�JN:�UT��{��թ���?�[�`]DJ��������E��"  �%�����㴷��T;]��So��*���k�c�`t9�^�!�G�ݝ�n����$�T���c�;l��%:�n��� ^�h7���noؘ��fl�q
�Z�@�ŵ�{��.f�\=D�H�.��YiE���Q�i�孫��#�v��z�٦��wõ�v����J�~��9Q]�WK�Uj6s�&Y7�B���R7�ā+Uss�VUo�}d�n2�'=uT��lD^M���*;s����qO6�>? R��U:�
��t���*4�s�H@����'���Gȯ�#��Kr����-����$�@�o�#�'�M��Y"�/�V��Ec��	�"� ��z�\$	4��O"���
M�!:�����@�'�@.�c�0jW��pI��@!Y�^'{	�.i5i�����@�yZ���^ԝ�F�Q��"��($�G�[ �g��%�v��e�v�n��UQٝ�Mm2$��9o+��C ��ݳO*��K�!�%��דddJ�5�Cxbm��%$�'v,�A��n���īA+�	檅A�h��?r LPH&���H� �;x^ji�H�7#�~$��x��iG�sJ<@&RH�6�!�ް�@5�ɉLo2�:@�I1�C`v/>-Sc&
�d^'#�o"��'$��Dn?>�o�V~0��Lя�y�L��|��m�AXB����K˹�	=@N���j���x�!�dR5 �h��,!�R&�I~��O�2�ج�,�'�1��]ħWo>�� �`�z�����s9��4��cbV2��3�+^l�����������A�`��I��[������t͌$$p��s �Zŵ�
A	޻��s9'�!���i���˷F�?4�ʱ��dR�D�|�Hah^�A�J�aju���Rw��K<M�w�5�Q
6���G&�5��8��#��KC� ���\�X)�B�U(7��E��Y-�Ję�y���?�ȋ�(gr�1��DϬ�}H������RFԠ��]�:����P.O����#V�������I.�*QJ�R$޴�{l~>�Ir�-� ����jI����?i	����C�mvdQ2��F�ݳ��"z����<��9�9�Ra��8�|��r/�� ,��n��G��f���;*'$��|�����nFb ,����uR�d���DXԻoդ��$��?V�*>�sP=�9�ӫd+p �3u�#	Q��ɸ.��H,/QJ�K��?$*� O���2oe$�d���@j
�1:���$�e8���3�q������diP�
�2 ���/����$��q�p �:�]�z�
�X)©�w��us�����
�;L6����@	�m����Ɵ#�쩃ک������[뚶�xIP �L�'l�%�83�J~a)�7���c�Ǌ�s��K���^����A�90�.n05��|-��C�qxu�������u��p�Rr�;8��8�����ȬH�p-]_����\��Eᴷ\�fQT��╹K��Q�J��"�T�=ߔY4�3�(o�?�B���/��6�^���
��T�Gq�:_\����y	!�0B���:������W�������o�����7�����;�_�]�{��U�������j6��Wo������q?4�f����뉝@f��J�?�oJWަ���o�V?}����!��f��m���G����[y�����������&[=D��O�˷�iXp
 H���[�'���]�ǝ�N�ds�[���ϗ���t͂Pp<��� ���]��i	���fD9��ʨ_��bq�kr���jtY*����9)���z�o��~����������P�`�,B��t@�?)@���_��a�]��}4������`x�/Wĺ�2�n0ڭ�uW���ܓB?�7/���~~9~�}d��<<7�Z/e$Je�Y��>�'^ʧO������_��㫢7l����;۬C#?�]w�B����[���i;�(�t��|���H��W0�� ��/D��잵��_�7[�S%�Yw��u�b�3��wy�.�a��w�*F�fu���Ձ�%6ʠ]r����an�9b9{�0'���Zb�K!��D��/��KC^]�yje�?�.T�v�H�Bn�>"\����m
I��hv�y��jF��4�
�%���G٭�fh��iQ�Q��	t��d��y"��LRhń���@�FTeg�0�{�B�幺 >29���٦����6(�z�f��$��&��[;j���bYk[bdQ�Z�~d"��HğX��SQ�-��]����]�?ݳ5�ɜ�f�.V��%㭿��)Dx�61F�v;��AM�s�_�S��������x)�=u_b���!��ұe�6-�Pݟ��j�/V��'��>�_��[ר]Ng��M���3kF��O�v��Ǟ�n�>��G�j!���w��p����BT�&�UT���_ڝ�:���p>J�Wy_X�CM������`�n^-��6c�b.J7�A�����K9߮N@Ǵ�x5��M�qD��lH�j�a��&���e��	G��#���V��U��{���QPD2��=�ώ��H��հ��HNr����yG1�	��_��+�Pn2� )���e�w@�����4�;A�2�����8�uL��y=���d�\�ۏ�I��5]3��]5�(�e�����>����<���xr�Ϋ�i�����
���t,("�X�6��$��l�nw��MM��{�ͫ�M��o�O��yX�/=�Q�-p��0h�F~n�}pW-�>��K�'���n����hz�/��m~5���]-ơQ���W�e��	j��=�*��<�ܥf0�}O�ΫF�/�-'_[����7lڂ�v0�{��:����q8�x&����	�_�s_K��D�a���.(")Y�Lt�(��B�
�?+U�n�������M4����em�����g�W�ͬ~��>����fu�������,��p;-Zv�J@���qϸ��؉/��v$[�¹]w�$|7]sРg��}а�Wke6�Z,�<����]��TիNW����wF�N��M��r�:3�Q�����q/����:[����[#Ϩ���Ӊt}*"������]s8�f��h~����%.v?x!�`���'q��x���R-�Ɨ3h�T�xK���B����T�C�}K%+Qi��c��!"�r~h��K㣜��};i�Q��C+"���>#�WO^Ĺ�v!����HƮF�R�k��e]U��e��MZ�c�÷i�a���J���a�o1-�m�����?���I���6�$��d�P�ʑ_5>����0�����>"�ӳ�>/���i�����y���N�Yc�φ��{c]
ۜ<��Μ�S;���^*v5�g�:���j�+鱝\�S�j�m���ޱFל�1u}�li���c���N����Ճ��N�Jz�Uʋ�:�峋J�{Ƴ=�8���6�38�LWl�	��f��k ��%x�1[�^��ֽ��m��9p��/�f��5��j7zY�4f�[��:�ò�\yJ`�N*�ܳ��m�����j=֎�Z:�b{0��]S�:L�F���v_0���L]:���*�RXk�ㅏ=&:t�KÓ)Ŕ�>��![�<�� ]�Mŗ u��g�Yz�Qp��cd2�{�I�65���B+�@�P!��?>�O��5ő�3�U|eE���ϴ\:�����>�;����X
KQ�C\<�%c�kz�Q�YK��h͠�<h<���=��18�j�d0��i���p.�{M��B 2��ޣ�>*�q�3�S׎Bp �	�9����.N����wLi�q�ئ��n pu�✅k�Z�	���b1�r,{M����ۥ���0��p��s���H��ob�wǟn���{<����m��=�k~�����5'��
W�,z\j�V�j�e �u���Y��V��@8#�>GP-��s1��C��� �3g��!�:g1����,�$���i�1@���u�bו�����r����B���&s�u��]|W��/�O�U�+����Y����m��23�y�ـ^��qJhд�v��_���UT�� ������ w�TC�����Q��a0$sL)�hz�����>g            [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://02hmoxs4184x"
path="res://.godot/imported/index.icon.png-b92c9a802ad4b78e247784454a6b506f.ctex"
metadata={
"vram_texture": false
}
           GST2      X     ����                X       �,  RIFF�,  WEBPVP8L�,  /Õ�mۆq�����1�Ve���G�N^6۶�'�����L �	���������'�G�n$�V����p����̿���H�9��L߃�E۶c��ۘhd�1�Nc��6���I܁���[�(�#�m�9��'�mۦL���f�����~�=��!i�f��&�"�	Y���,�A����z����I�mmN����#%)Ȩ��b��P
��l"��m'���U�,���FQ�S�m�$�pD��жm�m۶m#�0�F�m�6����$I�3���s�������oI�,I�l���Cn����Bm&�*&sӹEP���|[=Ij[�m۝m��m���l۶m��g{gK�jm���$�vۦ�W=n�  q��I$Ij�	�J�x����U��޽�� I�i[up�m۶m۶m۶m۶m�ټ�47�$)Ι�j�E�|�C?����/�����/�����/�����/�����/�����/�����/�����̸k*�u����j_R�.�ΗԳ�K+�%�=�A�V0#��������3��[ނs$�r�H�9xޱ�	T�:T��iiW��V�`������h@`��w�L�"\�����@|�
a2�T� ��8b����~�z��'`	$� KśϾ�OS��	���;$�^�L����α��b�R鷺�EI%��9  �7� ,0 @Nk�p�Uu��R�����Ω��5p7�T�'`/p����N�گ�
�F%V�9;!�9�)�9��D�h�zo���N`/<T�����֡cv��t�EIL���t  �qw�AX�q �a�VKq���JS��ֱ؁�0F�A�
�L��2�ѾK�I%�}\ �	�*�	1���i.'���e.�c�W��^�?�Hg���Tm�%�o�
oO-  x"6�& `��R^���WU��N��" �?���kG�-$#���B��#���ˋ�銀�z֊�˧(J�'��c  ��� vNmŅZX���OV�5X R�B%an	8b!		e���6�j��k0C�k�*-|�Z  ��I� \���v  ��Qi�+PG�F������E%����o&Ӎ��z���k��;	Uq�E>Yt�����D��z��Q����tɖA�kӥ���|���1:�
v�T��u/Z�����t)�e����[K㡯{1<�;[��xK���f�%���L�"�i�����S'��󔀛�D|<�� ��u�={�����L-ob{��be�s�V�]���"m!��*��,:ifc$T����u@8 	!B}� ���u�J�_  ��!B!�-� _�Y ��	��@�����NV]�̀����I��,|����`)0��p+$cAO�e5�sl������j�l0 vB�X��[a��,�r��ς���Z�,| % ȹ���?;9���N�29@%x�.
k�(B��Y��_  `fB{4��V�_?ZQ��@Z�_?�	,��� � ��2�gH8C9��@���;[�L�kY�W�
*B@� 8f=:;]*LQ��D
��T�f=�` T����t���ʕ�￀�p�f�m@��*.>��OU�rk1e�����5{�w��V!���I[����X3�Ip�~�����rE6�nq�ft��b��f_���J�����XY�+��JI�vo9��x3�x�d�R]�l�\�N��˂��d�'jj<����ne������8��$����p'��X�v����K���~ � �q�V������u/�&PQR�m����=��_�EQ�3���#����K���r  ��J	��qe��@5՗�/# l:�N�r0u���>��ׁd��ie2� ���G'& �`5���s����'����[%9���ۓ�Хމ�\15�ƀ�9C#A#8%��=%�Z%y��Bmy�#�$4�)dA�+��S��N}��Y�%�Q�a�W��?��$�3x $��6��pE<Z�Dq��8���p��$H�< �֡�h�cާ���u�  �"Hj$����E%�@z�@w+$�	��cQ��
1�)��������R9T��v�-  xG�1�?����PO�}Eq�i�p�iJ@Q�=@�ݹ:t�o��{�d`5�����/W^�m��g���B~ h�  ����l  נ�6rߙ�����^�?r���   ���⤖��  �!��#�3\?��/  �ݝRG��\�9;6���}P6������K>��V̒=l��n)��p	 ����0n䯂���}   ���S*	 ��t%ͤ+@�����T�~��s����oL)�J� 0>��W�-  �*N�%x=�8ikfV^���3�,�=�,}�<Z��T�+'��\�;x�Y���=���`}�y�>0����/'ـ�!z9�pQ��v/ֶ�Ǜ����㗬��9r���}��D���ל���	{�y����0&�Q����W��y ����l��.�LVZ��C���*W��v����r���cGk�
^�Ja%k��S���D"j���2���RW/������ض1 ����
.bVW&�gr��U\�+���!���m ;+۞�&�6]�4R�/��Y�L�Ά`"�sl,Y/��x��|&Dv�_
Q*� V�NWYu�%��-�&D�(&��"  Wc��ZS���(�x� ,�!����!�L�AM�E�]}X�!��wB�o��-  �-���16���i���ю�z��� ���B��oB�0������v]���ȓ�����3�� +S�χ�=Q_�����˨�d��|)D>��k ��uȣ���Y[9̂�����! ^�!��r���j0Y+i��΍e(�ț� ���x��
��{��<6 R���پ�b��Y
C����+���������;���a ���,�o��bC�{�?���1 �(��¤ �V�������;�=��I��� ���EI���Z��)D����t=S ��] X��9K�= �.~�K[��Ŋ��,2��� p}>w<n�g h�
�t���R�u�G�1k���!��x���������� �L���|>D�0�Ǣ(Qc�� ����= �ۊ�Z0�^��c �
|�����L�%�d��q���(�WB� ��(	���� �J��8D�0�~$�Dsy�Ѿ!������j�^ ��mOa�8.�qce��s|%Dq~,X�u�������=T	���Q�M�ȣm�Y�%Y+�[�0|"DΞ�j�u�L6�(Qe��qw�V�э���ǂ���!j�K � �:�wQ�dÛ������R�
��C���X�u�`����\"j讀Dq21� �F>B[��[������]@K-���C�e�q�tWP�:W�۞X�z��,��t�p���P��Se����T���{dG��
KA���w�t3t��[ܘ�4^>�5ŉ�^�n�Eq�U��Ӎ��α�v�O6C�
�F%�+8eů��M����hk��w�欹񔈓����C��y訫���J�Is�����Po|��{�Ѿ)+~�W��N,�ů��޽���O��J�_�w��N8����x�?�=X��t�R�BM�8���VSyI5=ݫ�	-�� �ֶ��oV�����G������3��D��aEI��ZI5�݋����t��b��j��G����U���΃�C�������ق�в����b���}s����xkn��`5�����>��M�Ev�-�͇\��|�=� '�<ތ�Ǜ���<O�LM�n.f>Z�,~��>��㷾�����x8���<x�����h}��#g�ж��������d�1xwp�yJO�v�	TV����گ�.�=��N����oK_={?-����@/�~�,��m ��9r.�6K_=�7#�SS����Ao�"�,TW+I��gt���F�;S���QW/�|�$�q#��W�Ƞ(�)H�W�}u�Ry�#���᎞�ͦ�˜QQ�R_��J}�O���w�����F[zjl�dn�`$� =�+cy��x3������U�d�d����v��,&FA&'kF�Y22�1z�W!�����1H�Y0&Ӎ W&^�O�NW�����U����-�|��|&HW������"�q����� ��#�R�$����?�~���� �z'F��I���w�'&����se���l�̂L�����-�P���s��fH�`�M��#H[�`,,s]��T����*Jqã��ł�� )-|yč��G�^J5]���e�hk�l;4�O��� ���[�������.��������������xm�p�w�չ�Y��(s�a�9[0Z�f&^��&�ks�w�s�_F^���2΂d��RU� �s��O0_\읅�,���2t�f�~�'t�p{$`6���WĽU.D"j�=�d��}��}���S["NB�_MxQCA[����\	�6}7Y����K���K6���{���Z۔s�2 �L�b�3��T��ݹ����&'ks����ܓ�ЛϾ�}f��,�Dq&������s��ϼ��{������&'k�����Qw窭�_i�+x�6ڥ��f�{j)���ퟎƍ3ou�R�Y����徙�k����X�Z
m.Y+=Z��m3�L47�j�3o�=�!J
5s���(��A ��t)���N�]68�u< Ƞ��_�im>d ��z(���(��⤶�� �&�ۥ� ��  Vc�8�'��qo9 �t��i�ρdn��Of���O�RQP���h'������P֡���n ���č����k�K@�>����pH>z)-|��B��j���!j:�+������˧��t�������1����.`v�M�k�q#�$���N:�����-M5a10y����(�T��� X5 \�:� ?+�7#�?�*Y+-,s� ~�|\)뀀ap �drn�g��RN�X�er ��@ĕ���;��z��8ɱ�����	�- �
�bKc����kt�U]�䎚���hgu���|�_J{ �`p��o�p�T�U��p���/���Hϑ�H�$X ܬm3���ŉ�U'��뻩t��G9�}�)O������p�΃g���JO���\9�׫�����ڳ�!k����/��9R���^�%��C����T���;ji<�>�KY����;�J��ƶm .P��pT��
@HA��r��98V���b�v���YwaZ>�$oւ?-փ��ʹ|0�.��3���b駁�c��;?8E;���V�B�؀����|%\\s��%����e{o��Z�i�������^���s�Jx������B jh�\ �h�<��V��sh@:���.�ІYl��˂�`3hE.,P�2^����J��+�����p��
�ЊJd��x�*�@�7R��� �"�G="!�� �p����u�o��wV�m�g���~F��?����/�����}~����sо7� ���\,,k�J�T�6������Z�y�rBZ[D�>v�HQ�R��mq�������DD�-6+�V`���J�E�����\� 9!ߑ�`��6���ml�~ZM�Z�ȎV���g���������3?*u3���ctW����YQa�Cb�P�,B5�p0�m�cͺEt�{,��>s9f�^��`OG��]����2�Fk�9_�G�vd��	��)��=�1^Ų�Wl3{�����1��H)�e������9�هZ�]}�b���)b�C��es}�cVi~x���e
Z�)܃��39������C�(�+R����!�j����F�n���<?�p��l�8a�4xOb��������c�8&�UA�|	/l�8�8���3t�6�͏���v���� ����סy�wU��`� =��|M�Y?�'�A��&�@*�c~!�/{��),�>�=xr"	�qlF:��L&���=<5t�h.�#ᣭ���O�z�!�&`A�F�yK=�c<\GZ�� 4HG�0i�F녠uB"���<��c�Jeۈ�3!����O��q萞PiZ&�$M[���(G��e���ؤ���ã��O���5����'�gH~�����=��g�F|8�+�X�4�u���G�2����'��.��5[�OlB��$f4���`��mS�L�,y�t&V�#P�3{ ��763�7N���"��P��I�X��BgV�n�a:$:�FZ���'�7����f������z!�����KA�G��D#������ˑ`ڶs���&� ݱ��4�j��n�� ݷ�~s��F�pD�LE�q+wX;t,�i�y��Y��A�۩`p�m#�x�kS�c��@bVL��w?��C�.|n{.gBP�Tr��v1�T�;"��v����XSS��(4�Ύ�-T�� (C�*>�-
�8��&�;��f;�[Փ���`,�Y�#{�lQ�!��Q��ّ�t9����b��5�#%<0)-%	��yhKx2+���V��Z� �j�˱RQF_�8M���{N]���8�m��ps���L���'��y�Ҍ}��$A`��i��O�r1p0�%��茮�:;�e���K A��qObQI,F�؟�o��A�\�V�����p�g"F���zy�0���9"� �8X�o�v����ߕڄ��E �5�3�J�ص�Ou�SbVis�I���ص�Z���ڒ�X��r�(��w��l��r"�`]�\�B���Ija:�O\���/�*]�þR������|���ʑ@�����W�8f�lA���Xl��촻�K<�dq1+x�*U�;�'�Vnl`"_L�3�B����u�����M���'�!-�<;S�F�܊�bSgq� ���Xt�肦�a��RZ�Y_ި��ZRSGA��-:8����yw_}XW�Z���-k�g.U��|�7P�
&���$˳��+��~?7�k�bQ���g������~�Z�e����H�-p�7S�� 
�w"XK�`K%?�`Tr|p���"��\�a�?�٧ ��'u�cv�&��<LM�Ud��T���Ak��������'+7��XR`��[\�-0���e�AiW]�Dk���$u���0[?�-���L����X�ĚSK-�.%�9=j�3t^���(c�yM-��/�ao����\%�?�б �~���b][
tٵ�<qF�)�
�J�'QZY�����*pB�I4�޸�,������.Т�1���/
t�1-1������E�*��Cl/Ю©f�<,0�S�bf�^���[8Z$��@���kw�M<?�[`��)3)1� �U����:��/pR��XV`XE,/0���d���1>ѫ��i�z��*o�}&R{���$f�JV=5͉Ύ��Rl�/�N4.�U~Cm�N~��HPRS�?G��g�-���qvT{�G _�[ua�;���kco�9�Kw����n����E{d�j��C���,q����Y���cwY<$#�ؤ�m+�LL-�z� �y<{/7���[��X�?�-6(cO ?�XZ�M�������sb�[
�.����j|;d�!0lCIqZ�z�&��~�|7�A���A~��á@�� 417��}t ��,� X�6��lS)6v�G
��I:�).~��8R���#'��߶;9�'���U�$1nC�L��찦3�+b黙u�NJ�����8���X�?5�0��^��[B/+�0�Ur(��J��+Xr�H�����HZm&�#�p	�Y ����*���hM]��m���b�ݢ����G����s��z-�x��������� �J�"���Ћ�g�Ҝ �Aа��?��?6��c�Zx�$�t��{s
-R�E�24�?�{�l�-��1�3S�EJ��v6X]L�B^ ��]N��R�yN��62�����'R�p-�����n2�d�?Th|�h��3X������Rc8&��_,��;T�8�� �hΗv�(7I;�3Obn;��O�!����Lߍ*�E~wU,���n�MN1���Z��Y̖��tY;5�^�<Z�Ǩ�T#�bt�xfA�n�cq����"9GD*�^JL��HJ���4���V�-�܉��4*��u]�[
���,"ҏ�i!�r~L��_�����8 ]j�?x���<k+%w��Bk��=�u�ڤ��>%2Bۃ�Y�n<jBo������Κ�0M~�t>�#b/jZ�}���B��Q��#���6R$v�����k�R$c/:�~���(V�7;)��ߊ[̣0?F��;.�*ݪd������{A`w>~�i=D�c��������Y2�X�q~�r2��8@v=f�?��X��S�"X�j?��@$?�����x�(�k���c7��\�����>A�=fpM?9d?�׻{���)f�.⪝���3�������f,N;"��,N���X��*�"V���"��C��?���(2=���A��1�Ul���h�8Ao(5X�B�X�>S�j��s�!
l����GgGp��>�v;c���V�N1���-��K�S�=6PiN�fNq������,
�3SWx�ei����f'�*�r�rʹ̙�e�7���b�o���>_i��M�_��V�p�r�9��X�$�����B���t5�4#�B(E���3�������`����I�M�e��b6_����{~�f/��@��B��Y����E�4��޲�d�O�$���M�����ݖv�P����TR�oj~��+}��#���"�]1Υ_���nR���œ����^pQ2�7첾b��3�ba�\��uu2�~O�G�����5�^>v������m��?���mC;$eT��C񎋋��V��8�:��
���ʱlt��~e]�cC7dl���.�i����\w����/..F�Q5���œ��`�o���E����E�͛�ٽ-�o�z�"n��/��[�����ͳI���S��Dڢ��V�6��!��esq��AC���ڻ���OMk�y��{7`c0�ٺ���5C5�yiw��`ps�OC��f�X�5oQ�\_*m�f�)稹"���a2$O;�]C�A�;V.���c��iޢ�R5�X��t%�s����ȸ�; 5�����)��X|?����9&��wĽjdn�{��7��/����q]3Ɲ�}�[��yF~�Q0����x��U�� ���˘?����a�;���/yޫ�����6.��C}���&L��9�_�ս�w�o���W�^�;�^u�xoݖ��Q8����4��kW��'����:9>����Xp5H��ONtL��=��_�&�0��H"Q��|H���4!���]�'�!޹Eܢ���}=soϢ~	K�$���`"!]j�+{'e�M��D]��=�>c��xS��Y����X��7�7+�Me̯/���u�Q����i���Eg�9�g�RU��#'��ޑW\r�aS�/3�"/v
IgX���}ٻ���ʏr�r���_��<�6�Gʋ&���z%�Pl^d����㑭v�ʎو�w�[���Q��k�K�����IWˈ��`/�Y�X��9J"��_��V{��je�i��6�<�ZS��� �t���W�Bg��@5���..��X�eʡ��*�HRgkD^>�y裝"�9�+wQ4ABR������^�k3�>2�����x�C�l���f:��#gщ�s� ��ߜ��ȁ���+���A��˾�g�1K9Cܹ��:���T"!I������Hs�;���ue��9@#ChE5&!��'�2�����w*a/Q��I	�E������I�w�����?��v })B��GQ�n�h"]0��]Z֑���.}�&~x2��
eĞsF�n�+�b�e�i����0Ix�y��Aѕ���
[1�B�R$$����:�4E疳��#�4���y���ӈ�6o1O�V'��7]�H�.)/)�OwW./�g�l��£���"$d���}[���t���U~�MQԲ�$��~��c��S�M�a���ш=��diH��(N�+U�D����f"V�"�����.ƈ�#Ͼ�eH:�x��d!k 6�J�f9�GW�4����Kp��T��3��~��G�؀��,�zZ��澰؋7����v#� &�r+O�@Ud7͐�$�\�D�O��W_�Ew�ͻ�7��oD����y��,��Ƣ�cƙd	���U�u�:�#�h6]�R
�U~	V�՟R�V������/�:r�F¬�k?|Ī�r\�<.�^9����?��]Aʻ�iT;vg�PpyM���1��},�dY\e8��I��2�wjM��S/�p�1�\^�6$4�F��(:�\nۢ�2�}�Pm�X�'.����U�3��bq�nXK�i_BD�_H}�r;Y^�t�<���o��#gw��2q_�|�^�<��E�h���O�����R�-Ɖ���S�	!��z�1�+iH�1G���+<����~�;|�F�{�}v�;s�j�Q;�٩�;&f�}�������tL ���#��Ъ>;��z���?U˽�~������e��{K%��/:F�/<�n�2k�8�x��S-�5�`��ԗ�H�{���R�y�S�(w��ѥe
�	0���w�޻�U1��7V-Q�̶ꪸ�g�X��3V&�T[+)b����2���(���B��,��z����9���B`��!��o�ע(�W�RZ���m��%/V�&��|g��f��*[_��nn��M�M`�%��)��Z�K$�����F�� ��$r^�k�K,	u;w������X���;�L�eoI�6��y%����~����)���0"�zc�BH�<�kW�E\.�b��R>mٺ��<����͑Թ���a=2X���=/��_;	Ρ�e&o.����]��2!�嫈�"I������j�höR��͒\L�0�e������,)ýf�; ��E��0��<%�Q�Aø�x8�� �]eQL�;|���꼬z�W2
�H�z�_��
/K`J�O�O�Y�~j���>����d�v��%�ެ7�4{%��٥7Z��>����|��5^�\ױ���:��Z^;��U��s�)��#�|�.̡���R2��j����şBб���*cMvD�W^{�������m�D��0�,������#���?O����
����?z�{ȓ'�|����/�����/�����/�����/�����/�����/�����/�����/|�           [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dota1s5optuw"
path="res://.godot/imported/index.png-0c78d14d192abe5f22f8c25928ca1ab8.ctex"
metadata={
"vram_texture": false
}
                extends Line2D

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
   max_value    bake_resolution    _data    point_count    script    metadata/_snap_enabled 	   _bundled       Script    res://src/snake/head.gd ��������   Script    res://src/snake/body.gd ��������   Script    res://src/snake/tail.gd ��������      local://Curve_xg11q          local://Curve_d3lmw �         local://PackedScene_n8oan b         Curve             
       ���>                            
   ���>  �?                            
     �?��?                                                       Curve          
   
       ��?                            
     �?���>                                                       PackedScene    	      	         names "         Snake    metadata/_edit_group_    Node2D    Head    points    width    width_curve    default_color    joint_mode    begin_cap_mode    script    Line2D    Body    Tail    end_cap_mode    _on_body_body_grown    body_grown    	   variants             %      �{,�{,  HB�{,  �B�{,     HB                 ��?      �?                %        �B�{,  HC�{,     �A       ��?      �?         %        HC�{,  �C�{,                        node_count             nodes     H   ��������       ����                            ����                                 	      
                        ����                  	         	      
   
                     ����                                 	            
                conn_count             conns                                     node_paths              editable_instances              version             RSRC          extends Line2D

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
           RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       PackedScene    res://src/snake/snake.tscn b����[      local://PackedScene_bjv8t          PackedScene          	         names "         Main    Node2D    Snake    	   variants                       node_count             nodes        ��������       ����                ���                     conn_count              conns               node_paths              editable_instances              version             RSRC    [remap]

path="res://.godot/exported/133200997/export-3bb3e8316df5682fb67a951ec53f009a-wiggler.scn"
            [remap]

path="res://.godot/exported/133200997/export-343260f166ed44b6779fdf4991ea2236-snake.scn"
              [remap]

path="res://.godot/exported/133200997/export-dbe59258b6e7c5860bca2a5bbd0223c3-main.scn"
               list=Array[Dictionary]([])
        �mS]�v   res://icon.svg�����F$1   res://main.tscnb����[   res://snake.tscn=�l���b   res://wiggler.tscnb����[   res://snake/snake.tscn=�l���b"   res://archive/wiggler/wiggler.tscn�����F$1   res://src/main.tscnb����[   res://src/snake/snake.tscn�����F$1   res://main.tscn�����F$1   res://src/main.tscn�o�o�!   res://docs/index.icon.pngj��H2%   res://docs/index.apple-touch-icon.png���2�V   res://docs/index.png        ECFG      application/config/name         snake      application/run/main_scene         res://src/main.tscn    application/config/features(   "         4.2    GL Compatibility       input/grow_snake�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script         input/shrink_snake�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script      #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility 