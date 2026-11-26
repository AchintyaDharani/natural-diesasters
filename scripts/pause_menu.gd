extends Control

@onready var settings = preload("res://scenes/settings.tscn")


func _on_resume_pressed() -> void:
	get_tree().paused = false
	self.queue_free()


func _on_settings_pressed() -> void:
	var instance = settings.instantiate()
	add_child(instance)
