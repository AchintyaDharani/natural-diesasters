extends Button
@onready var button_press_component: ButtonComponent = $ButtonPressComponent
@onready var lvl4 = preload("res://scenes/level_4.tscn")

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(lvl4)
	$ButtonPressComponent._press_button()
