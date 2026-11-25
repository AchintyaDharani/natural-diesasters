extends Control
@onready var lvlscreen = load("res://scenes/levelscreen.tscn")

func _on_resume_pressed() -> void:
	get_tree().paused = false
	self.queue_free()


func _on_exit_pressed() -> void:
	get_tree().paused = false
	self.queue_free()
	get_tree().change_scene_to_packed(lvlscreen)
