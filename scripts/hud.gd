extends Control

@onready var map_1: Node2D = $".."
@onready var color_rect: ColorRect = $ColorRect




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_rect.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	map_1.spawn_tornado()

func blur():
	color_rect.visible = true

func unblur():
	color_rect.visible = false
	
