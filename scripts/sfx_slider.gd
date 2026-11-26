extends HSlider

@onready var index = AudioServer.get_bus_index("sfx")

func _ready() -> void:
	self.value = db_to_linear(AudioServer.get_bus_volume_db(index))


func _on_value_changed(values: float) -> void:
	AudioServer.set_bus_volume_db(index, linear_to_db(values))


func _on_drag_ended(_value_changed: bool) -> void:
	BgMusic.get_child(0).play()
