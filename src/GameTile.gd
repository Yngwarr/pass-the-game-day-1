class_name GameTile
extends Node2D

enum State { EMPTY, STONE, ENEMY, START, END, END_COMPLETE }

const STATE_FRAME = {
	State.EMPTY: 0,
	State.START: 1,
	State.STONE: 2,
	State.END_COMPLETE: 3,
	State.END: 4,
	State.ENEMY: 5
}

var state: State

@onready var view: Sprite2D = $View
@onready var area: Area2D = $Area

func init(new_state: State):
	state = new_state

func _ready():
	view.frame = STATE_FRAME[state]
	area.area_entered.connect(on_area_entered)

func on_area_entered(other: Area2D):
	if not other.is_in_group('cursor'):
		return

	if not state == State.EMPTY:
		return

	var tween = create_tween()
	tween.tween_property(view, 'scale', Vector2(1.1, 1.1), .2).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(view, 'scale', scale, .2).set_trans(Tween.TRANS_QUAD)
