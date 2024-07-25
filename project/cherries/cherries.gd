extends Area2D

signal cherry_eaten


func _on_area_entered(_area):
	cherry_eaten.emit()
	queue_free()
