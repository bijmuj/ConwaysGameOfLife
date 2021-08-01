extends Node2D

export(Vector2) var screen_size = Vector2(1000, 1000)

var grid_size = Vector2.ZERO
var cell_size
var cell_scale
var grid = []
var alive = []

onready var Cell = preload("res://Grid/Cell.tscn")


func make_grid(size):
	grid_size = size
	cell_scale = screen_size / (64 * grid_size)
	cell_size = screen_size / grid_size
	for i in range(grid_size.x):
		var grid_row = []
		var alive_row = []
		for j in range(grid_size.y):
			var cell = Cell.instance()
			cell.scale = cell_scale
			cell.position.x = i * cell_size.x + cell_size.x / 2
			cell.position.y = j * cell_size.y + cell_size.y / 2
			cell.alive = 0
			add_child(cell)
			grid_row.append(cell)
			alive_row.append(0)
		grid.append(grid_row)
		alive.append(alive_row)

func edit_cell(val):
	var mouse = get_global_mouse_position()
	mouse /= cell_size
	grid[mouse.x][mouse.y].alive = val
	alive[mouse.x][mouse.y] = val


func step():
	var cur = Vector2.ZERO
	var num
	var new_alive = []
	var dir = [
		[-1, -1], [-1, 0],[-1, 1],
		[0, -1],[0, 1],
		[1, -1],[1, 0],[1, 1]]
		
	for i in range(grid_size.x):
		var new_alive_row = []
		for j in range(grid_size.y):
			num = 0
			for d in dir:
				var x = i + d[0]
				var y = j + d[1]
				x = wrap_around(x, grid_size.x)
				y = wrap_around(y, grid_size.y)
				num += alive[x][y]
			if grid[i][j].alive==1:
				if num>3 or num<2:
					grid[i][j].alive = 0
					new_alive_row.append(0)
				else:
					new_alive_row.append(1)
			else:
				if num==3:
					grid[i][j].alive = 1
					new_alive_row.append(1)
				else:
					new_alive_row.append(0)
		new_alive.append(new_alive_row)
	alive = new_alive


func wrap_around(v, bound):
	if v==-1:
		v = bound - 1
	elif v==bound:
		v = 0
	return v
