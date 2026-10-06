extends Node2D
@onready var tornado = preload("res://scenes/tornado.tscn")
@onready var arrow = preload("res://scenes/arrow.tscn")
@onready var earthquake = preload("res://scenes/earthquake.tscn")
@onready var hud: CanvasLayer = $hud

var mouse_pos = get_global_mouse_position()
var placing = false
var directing = false
var arrowdir
var scene
var e_placing = false

var tornado_scaling = Vector2(.1, .1)
var earthquake_scaling = Vector2(1,1)
var arrow_scaling = Vector2(10, 10)




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	mouse_pos = get_global_mouse_position()
	if directing == true:
		arrowdir.look_at(mouse_pos)
		if Input.is_action_just_pressed("Click"):
			directing = false
			scene.update_direction(mouse_pos - scene.position)
			scene.activate()
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
	if e_placing == true:
		hud.blur()
		scene.position = mouse_pos
		if Input.is_action_just_pressed("Click"):
			e_placing = false
			scene.activate()
			hud.unblur()
			hud.enable_button()

func spawn_tornado():
	hud.disable_button()
	var instance = tornado.instantiate()
	add_child(instance)
	scene = instance
	instance.scale = tornado_scaling
	placing = true
	
	
func spawn_earthquake():
	hud.disable_button()
	var instance = earthquake.instantiate()
	add_child(instance)
	move_child(instance, 5)
	scene = instance
	instance.scale = earthquake_scaling
	e_placing = true
