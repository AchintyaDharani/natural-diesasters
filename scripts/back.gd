extends TextureButton
@onready var button_press_component: ButtonComponent = $ButtonPressComponent

func _on_pressed() -> void:
	button_press_component._press_button()
	if button_press_component:
		button_press_component._press_button()
