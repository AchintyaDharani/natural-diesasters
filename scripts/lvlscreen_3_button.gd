extends Button
@onready var button_press_component: ButtonComponent = $ButtonPressComponent
@onready var lvl3 = preload("res://scenes/level_3.tscn")

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(lvl3)
	$ButtonPressComponent._press_button()
