extends Control

@onready var map_1: Node2D = $".."
@onready var color_rect: ColorRect = $ColorRect
@onready var button: TextureButton = $Bottom/HBoxContainer2/Button
@onready var shop: PackedScene = preload("res://scenes/shop.tscn")




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
	
func disable_button():
	button.disabled = true

func enable_button():
	button.disabled = false




func _on_shop_pressed() -> void:
	var instance = shop.instantiate()
	add_child(instance)
