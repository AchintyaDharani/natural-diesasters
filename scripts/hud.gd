extends CanvasLayer

@onready var map_1: Node2D = $".."
@onready var color_rect: ColorRect = $ColorRect
@onready var button: TextureButton = $Bottom/HBoxContainer2/Button
@onready var cd: Timer = $Bottom/HBoxContainer2/Button/cooldown_nado
@onready var label: Label = $Bottom/HBoxContainer2/Button/Label
@onready var button2: TextureButton = $Bottom/HBoxContainer2/Button2
@onready var cd2: Timer = $Bottom/HBoxContainer2/Button2/cooldown_quake
@onready var label2: Label = $Bottom/HBoxContainer2/Button2/Label
@onready var button3: TextureButton = $Bottom/HBoxContainer2/Button3
@onready var cd3: Timer = $Bottom/HBoxContainer2/Button3/cooldown_lightning
@onready var label3: Label = $Bottom/HBoxContainer2/Button3/Label
@onready var shop: PackedScene = preload("res://scenes/shop.tscn")
@onready var pausemenu = preload("res://scenes/pause_menu.tscn")

var t_locked = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_rect.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if cd.time_left > 0:
		label.text = str(snapped(cd.time_left, 0.1))
	else:
		label.text = ""
	if cd2.time_left > 0:
		label2.text = str(snapped(cd2.time_left, 0.1))
	else:
		label2.text = ""
	if cd3.time_left > 0:
		label3.text = str(snapped(cd3.time_left, 0.1))
	else:
		label3.text = ""


func _on_button_pressed() -> void:
	button.disabled = true
	cd.start()
	map_1.spawn_tornado()

func blur():
	color_rect.visible = true

func unblur():
	color_rect.visible = false
	
func disable_button():
	button.disabled = true
	button2.disabled = true
	button3.disabled = true
	cd.paused = true
	cd2.paused = true
	cd3.paused = true

func enable_button():
	if cd.time_left == 0 and t_locked == false:
		button.disabled = false
	if cd2.time_left == 0:
		button2.disabled = false
	if cd3.time_left == 0:
		button3.disabled = false
	cd.paused = false
	cd2.paused = false
	cd3.paused = false



func _on_shop_pressed() -> void:
	var instance = shop.instantiate()
	add_child(instance)


func _on_button_2_pressed() -> void:
	button2.disabled = true
	cd2.start()
	map_1.spawn_earthquake()


func _on_pause_pressed() -> void:
	get_tree().paused = true
	var instance = pausemenu.instantiate()
	add_child(instance)


func _on_button_3_pressed() -> void:
	button3.disabled = true
	cd3.start()
	map_1.spawn_lightning()


func _on_cooldown_nado_timeout() -> void:
	if t_locked == false:
		button.disabled = false


func _on_cooldown_quake_timeout() -> void:
	button2.disabled = false


func _on_cooldown_lightning_timeout() -> void:
	button3.disabled = false

func lock_nado():
	t_locked = true
	button.disabled = true

func unlock_nado():
	t_locked = false
	button.disabled = false
