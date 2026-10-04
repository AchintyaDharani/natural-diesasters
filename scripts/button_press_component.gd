extends Node
class_name ButtonComponent

var parent = null

func _ready() -> void:
	parent = get_parent()

func _press_button():
	if !parent:
		return

	parent.pivot_offset = parent.size / 2.0

	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_property(parent, "scale", Vector2(1.2, 1.2), 0.2).from(Vector2.ONE)
	tween.parallel().tween_property(parent, "rotation", randf_range(-0.2, 0.2), 0.2)
	tween.tween_property(parent, "scale", Vector2.ONE, 0.2)
	tween.parallel().tween_property(parent, "rotation", 0.0, 0.2)
