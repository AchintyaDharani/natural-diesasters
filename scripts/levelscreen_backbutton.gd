extends TextureButton
@onready var button_press_component: ButtonComponent = $ButtonPressComponent
@onready var back = load("res://scenes/main_menu.tscn")

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(back)
	button_press_component._press_button()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		self._on_pressed()
