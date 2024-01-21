extends Node

var room_completed: Dictionary = {
	"wizard": false,
	"healer": false,
	"knight": false,
	"king"  : false,
}

var room_survived: Dictionary = {
	"wizard": true,
	"healer": true,
	"knight": true,
	"king"  : true,
}

func _ready():
	RenderingServer.set_default_clear_color(Color.BLACK)


# func _process(delta):
	# print(room_completed, room_survived)

func _input(event):
	
	if event.is_action_pressed("f_fullscreen"):
		toggle_fullscreen()

func toggle_fullscreen():
	match get_window().mode:
		Window.MODE_EXCLUSIVE_FULLSCREEN:
			get_window().mode = Window.MODE_WINDOWED
		Window.MODE_FULLSCREEN:
			get_window().mode = Window.MODE_WINDOWED
		_: 
			get_window().mode = Window.MODE_FULLSCREEN



