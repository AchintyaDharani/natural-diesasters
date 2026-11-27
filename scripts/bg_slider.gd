extends HSlider

@onready var index = AudioServer.get_bus_index("bgm")
@onready var settings = $"../../../.."
@onready var button_press_component = $"../../../../Top Right/HBoxContainer/Back/ButtonPressComponent"

func _ready() -> void:
	self.value = db_to_linear(AudioServer.get_bus_volume_db(index))

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		self._on_back_pressed()


func _on_value_changed(values: float) -> void:
	AudioServer.set_bus_volume_db(index, linear_to_db(values))


func _on_back_pressed() -> void:
	var pausemenu = settings.get_parent()
	if "settop" in pausemenu:
		pausemenu.settop = false
	button_press_component._press_button()
	settings.queue_free()
