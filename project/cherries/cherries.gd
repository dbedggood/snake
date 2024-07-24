extends Area2D

signal cherry_eaten


func _on_area_entered(area):
	cherry_eaten.emit()
	queue_free()
