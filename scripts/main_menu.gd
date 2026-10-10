extends Control
@onready var lvl1 = preload("res://scenes/level_1.tscn")

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(lvl1)
