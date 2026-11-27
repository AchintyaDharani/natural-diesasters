extends Button

@onready var button_press_component = $ButtonPressComponent
@onready var hud = $"../../../../hud"

func _on_pressed() -> void:
	button_press_component._press_button()
	hud.process_mode = Node.PROCESS_MODE_INHERIT
	Global.reset()
	get_tree().reload_current_scene()
