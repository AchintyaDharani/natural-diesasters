extends Node2D
@onready var tornado = preload("res://scenes/tornado.tscn")
@onready var arrow = preload("res://scenes/arrow.tscn")
@onready var hud: Control = $hud

var mouse_pos = get_global_mouse_position()
var placing = false
var directing = false
var arrowdir
var scene

var tornado_scaling = Vector2(.1, .1)
var arrow_scaling = Vector2(10, 10)




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	mouse_pos = get_global_mouse_position()
	if directing == true:
		arrowdir.look_at(mouse_pos)
		print("lorik")
		if Input.is_action_just_pressed("Click"):
			directing = false
			scene.update_direction(mouse_pos - scene.position)
			arrowdir.queue_free()
			hud.unblur()
			hud.enable_button()
	if placing == true:
		hud.blur()
		scene.position = mouse_pos
		if Input.is_action_just_pressed("Click"):
			var instance = arrow.instantiate()
			add_child(instance)
			instance.position = mouse_pos + Vector2(0, 100) * tornado_scaling
			instance.scale = arrow_scaling
			arrowdir = instance
			directing = true
			placing = false
	

func spawn_tornado():
	hud.disable_button()
	var instance = tornado.instantiate()
	add_child(instance)
	scene = instance
	instance.scale = tornado_scaling
	placing = true
