extends Node2D
@onready var tornado = preload("res://scenes/tornado.tscn")
@onready var arrow = preload("res://scenes/arrow.tscn")
@onready var earthquake = preload("res://scenes/earthquake.tscn")
@onready var lightning = preload("res://scenes/lightning.tscn")
@onready var hud: CanvasLayer = $hud

var mouse_pos = get_global_mouse_position()
var placing = false
var directing = false
var arrowdir
var scene
var e_placing = false
var t_placing
var counted_nados = 0

var tornado_scaling = Vector2(.1, .1)
var earthquake_scaling = Vector2(1, 1)
var lightning_scaling = Vector2(.7, .7)
var arrow_scaling = Vector2(10, 10)

var max_tornados = 2
var tornado_level:int = 0:
	set(value):
		if value == tornado_level:
			return
		tornado_level = value
		_on_tornado_level_changed()
var switch = 0


func _on_tornado_level_changed():
	match tornado_level:
		0:
			max_tornados = 2
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	tornado_level = Global.tornado_level
	
	var counter = 0
	for i in self.get_children():
		if i is CharacterBody2D:
			counter += 1
	counted_nados = counter
	if counted_nados == max_tornados and switch == 0:
		hud.lock_nado()
		switch = 1
	elif counted_nados != max_tornados and switch == 1:
		hud.unlock_nado()
		switch = 0
	
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
	if t_placing == true:
		hud.blur()
		scene.position = mouse_pos
		if Input.is_action_just_pressed("Click"):
			t_placing = false
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
	
	
func spawn_lightning():
	hud.disable_button()
	var instance = lightning.instantiate()
	add_child(instance)
	scene = instance
	instance.scale = lightning_scaling
	t_placing = true
