extends Control
@onready var lvl1 = preload("res://scenes/levelscreen.tscn")
@onready var settings = preload("res://scenes/settings.tscn")

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(lvl1)


func _on_settings_button_pressed() -> void:
	var instance = settings.instantiate()
	add_child(instance)
