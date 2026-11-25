extends Button
@onready var button_press_component: ButtonComponent = $ButtonPressComponent
@onready var lvlscreen = load("res://scenes/levelscreen.tscn")

func _on_pressed() -> void:
	button_press_component._press_button()
	get_tree().paused = false
	Global.reset()
	get_tree().change_scene_to_packed(lvlscreen)
