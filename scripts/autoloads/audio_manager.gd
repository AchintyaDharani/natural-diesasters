extends Node

@onready var button_click_sfx: AudioStreamPlayer = %ButtonClickSFX

func play_button_click_sfx() -> void:
	button_click_sfx.play()
