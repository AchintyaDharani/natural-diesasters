extends Control

@onready var settings = preload("res://scenes/settings.tscn")
@onready var resumebtn = $Middle/ButtonContainer/Resume
var settop = false


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("esc") and settop == false:
		resumebtn._on_pressed()
		self._on_resume_pressed()


func _on_resume_pressed() -> void:
	get_tree().paused = false
	self.queue_free()


func _on_settings_pressed() -> void:
	settop = true
	var instance = settings.instantiate()
	add_child(instance)
