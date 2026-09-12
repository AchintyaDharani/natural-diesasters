extends Node2D
@onready var tornado = preload("res://scenes/tornado.tscn")
@onready var hud: Control = $hud

var mouse_pos = get_global_mouse_position()
var placing = false
var scene



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	mouse_pos = get_global_mouse_position()
	if placing == true:
		hud.blur()
		scene.position = mouse_pos
		if Input.is_action_just_pressed("Click"):
			hud.unblur()
			placing = false

func spawn_tornado():
	var instance = tornado.instantiate()
	add_child(instance)
	scene = instance
	instance.scale = Vector2(0.1, 0.1)
	placing = true
