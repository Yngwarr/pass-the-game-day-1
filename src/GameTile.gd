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

func init(new_state: State):
	state = new_state

func _ready():
	view.frame = STATE_FRAME[state]
