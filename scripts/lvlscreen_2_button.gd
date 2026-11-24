extends Button
@onready var button_press_component: ButtonComponent = $ButtonPressComponent
@onready var lvl2 = preload("res://scenes/level_2.tscn")



func _on_pressed() -> void:
	get_tree().change_scene_to_packed(lvl2)
