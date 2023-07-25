extends Node2D

@export var tile_scene: PackedScene
@export_file("*.txt") var layout_file

const CHAR_STATE = {
	'.': GameTile.State.EMPTY,
	'x': GameTile.State.STONE,
	's': GameTile.State.START,
	'e': GameTile.State.END,
	'b': GameTile.State.ENEMY
}

const tile_distance_w := 100
const tile_distance_h := 100

## TODO change it's type to TileMap
##      sorry folks, there's no time for me to learn TileMaps properly :(

func _ready():
	var f := FileAccess.open(layout_file, FileAccess.READ)
	var layout := f.get_as_text()
	load_level(layout)

func load_level(layout: String):
	var pos := Vector2(0, 0)
	for ch in layout:
		if ch == '\n':
			pos.x = 0
			pos.y += tile_distance_h
			continue
		pos.x += tile_distance_w

		# kudos to Godot that does allow me to do GameTile.new(), but refuses
		# to instantiate the node's bloody children after that!
		var cell := tile_scene.instantiate()
		cell.init(CHAR_STATE[ch])
		cell.position = pos
		add_child(cell)
