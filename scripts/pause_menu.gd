extends Control


func _on_resume_pressed() -> void:
	get_tree().paused = false
	self.queue_free()
