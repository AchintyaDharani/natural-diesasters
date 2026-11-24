extends CanvasLayer
signal win_appeared
@onready var win = load("res://scenes/levelscreen.tscn")

#
#func _ready() -> void:
	#EventSystem.WinScreenShow.emit()

func win_game() -> void:
	show()
	EventSystem.WinScreenShow.emit()

func _on_continue_win_pressed() -> void:
	get_tree().change_scene_to_packed(win)
	#.win_appeared.emit()
