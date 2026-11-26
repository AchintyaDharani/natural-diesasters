extends Area2D

var building = []
var damage = 10
@onready var animation = $AnimationPlayer.get_animation("earthquake")
@onready var index = animation.find_track("CollisionShape2D:scale", Animation.TYPE_VALUE)

@onready var hitbox = $CollisionShape2D
@onready var redraw = false
var level:int = 0:
	set(value):
		if value == level:
			return
		level = value
		_on_level_changed()


func _on_level_changed():
	match level:
		0:
			damage = 10
			#animation.track_set_key_value(index, 0,Vector2(0.1))
			#TODO: LORIK
			$Earthquake1.scale = Vector2(0.1,0.1)
			$Earthquake2.scale = Vector2(0.1,0.1)
			$Earthquake3.scale = Vector2(0.1,0.1)
#			needs hitbox fixing
		1:
			damage = 15
			$Earthquake1.scale = Vector2(0.3,0.3)
			$Earthquake2.scale = Vector2(0.3,0.3)
			$Earthquake3.scale = Vector2(0.3,0.3)
		2:
			damage = 20
			$Earthquake1.scale = Vector2(0.4,0.4)
			$Earthquake2.scale = Vector2(0.4,0.4)
			$Earthquake3.scale = Vector2(0.4,0.4)
		3:
			damage = 25
			$Earthquake1.scale = Vector2(0.4,0.4)
			$Earthquake2.scale = Vector2(0.4,0.4)
			$Earthquake3.scale = Vector2(0.4,0.4)
		4:
			damage = 30
			$Earthquake1.scale = Vector2(0.6,0.6)
			$Earthquake2.scale = Vector2(0.6,0.6)
			$Earthquake3.scale = Vector2(0.6,0.6)
		5:
			damage = 45
			$Earthquake1.scale = Vector2(0.8,0.8)
			$Earthquake2.scale = Vector2(0.8,0.8)
			$Earthquake3.scale = Vector2(0.8,0.8)


func _ready() -> void:
	process_mode = PROCESS_MODE_DISABLED


func _draw() -> void:
	if redraw == false:
		draw_circle(Vector2(0,0),hitbox.shape.radius * 3, Color.RED)


func _process(_delta: float) -> void:
	if redraw != true:
		redraw = true
		queue_redraw()
	level = Global.earthquake_level

func _on_body_entered(body: Node2D) -> void:
	building.append(body)

func deal_damage():
	for i in building:
		i.take_damage(damage, "earthquake")


func activate():
	process_mode = PROCESS_MODE_INHERIT
