extends Label

@onready var countdown = $"../Timer"

 

func _process(_delta: float) -> void:
	var mins = floor(countdown.time_left/60)
	var sec = countdown.time_left - mins*60
	text = '%02d : %02d' % [mins, sec]
