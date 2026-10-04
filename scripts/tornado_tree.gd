extends Control

@onready var tree = $ScrollContainer/VBoxContainer
@onready var list = []
@onready var label = $VBoxContainer2/Label
@onready var cost = $VBoxContainer2/cost
var costs = [10, 10, 10, 10, 10]
var explanations = [
	"a",
	"b",
	"c",
	"d",
	"e"
]

func _ready() -> void:
	tree.global_position.y = 30 - Global.tornado_level * 148
	for i in tree.get_children():
		if i is TextureButton:
			list.append(i)




func _process(_delta: float) -> void:
	var counter = Global.tornado_level
	if Global.tornado_level < len(list):
		list[Global.tornado_level].disabled = false
	for i in list:
		if counter == 0:
			pass
		else:
			i.disabled = true
			counter -= 1
		if i.is_hovered():
			label.text = explanations[list.find(i)]
			cost.text = "Cost:" + str(costs[list.find(i)])
			break
		else:
			label.text = ""
			cost.text = ""


func _on_texture_button_pressed() -> void:
	self.queue_free()


func _on_texture_button_1_pressed() -> void:
	if Global.coins >= costs[0]:
		Global.tornado_level = 1
		Global.coins -= costs[0]
	else:
		pass


func _on_texture_button_2_pressed() -> void:
	if Global.coins >= costs[1]:
		Global.tornado_level = 2
		Global.coins -= costs[1]
	else:
		pass


func _on_texture_button_3_pressed() -> void:
	if Global.coins >= costs[2]:
		Global.tornado_level = 3
		Global.coins -= costs[2]
	else:
		pass


func _on_texture_button_4_pressed() -> void:
	if Global.coins >= costs[3]:
		Global.tornado_level = 4
		Global.coins -= costs[3]
	else:
		pass


func _on_texture_button_5_pressed() -> void:
	if Global.coins >= costs[4]:
		Global.tornado_level = 5
		Global.coins -= costs[4]
	else:
		pass
