extends CanvasLayer
@onready var win = load("res://scenes/levelscreen.tscn")

func _on_continue_win_pressed() -> void:
	get_tree().change_scene_to_packed(win)
