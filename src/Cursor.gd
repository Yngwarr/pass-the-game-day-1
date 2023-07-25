extends Area2D

func _ready():
	add_to_group("cursor")

func _process(_delta: float):
	global_position = get_global_mouse_position()
