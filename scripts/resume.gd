extends Button
@onready var button_press_component: ButtonComponent = $ButtonPressComponent
@onready var pausemenu = $"../../.."

func _on_pressed() -> void:
	print("lorik")
	button_press_component._press_button()
	pausemenu.get_tree().paused = false
	pausemenu.queue_free()
