extends MarginContainer

@export var button_node: BoxContainer

func _ready():
	SceneManager.scale_screen(1)
	for button in button_node.get_children():
		# print(button)
		button.mouse_entered.connect(func():button.grab_focus())
		button.pressed.connect(button_pressed.bind(button.name.to_lower()))

func button_pressed(button_name: String):
	match button_name:
		"play": SceneManager.change_scene("res://Scenes/CharacterSelect.tscn"); AP.play_sound("press")
		"about": SceneManager.change_scene("res://Scenes/About.tscn"); AP.play_sound("press")
		"quit": SceneManager.quit(); AP.play_sound("press")

func _unhandled_input(_event):
	if get_viewport().gui_get_focus_owner() == null:
		button_node.get_child(0).grab_focus()
