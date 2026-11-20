extends Button
@onready var button_press_component: ButtonComponent = $ButtonPressComponent
@onready var lvl1 = preload("res://scenes/level_1.tscn")

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(lvl1)
