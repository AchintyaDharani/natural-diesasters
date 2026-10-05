extends Control

@onready var tornado = preload("res://scenes/tornado_tree.tscn")
@onready var buttons_array = $centre.get_children()
@onready var centre_pos = $centre.position
@onready var label = $Label
@export var radius = 100






func _ready() -> void:
	var phi = (2*PI)/ len(buttons_array)
	var counter = 0
	for button in buttons_array:
		var angle = counter * phi - (PI/2)
		button.global_position = Vector2(centre_pos.x + radius * cos(angle),centre_pos.y + radius * sin(angle)) - (button.size / 2)* button.scale
		counter += 1
		print(button.size)


func _process(_delta: float) -> void:
	for button in buttons_array:
		if button.is_hovered():
			if button == $centre/Tornado:
				label.text = "Tornado"
			else:
				label.text = "earfquake"
			break
		else:
			label.text = ""



func _on_texture_button_pressed() -> void:
	self.queue_free()


func _on_tornado_pressed() -> void:
	var instance = tornado.instantiate()
	add_child(instance)
