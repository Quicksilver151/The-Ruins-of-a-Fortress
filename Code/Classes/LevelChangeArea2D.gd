extends Area2D
class_name LevelChangeArea2D

@export var scene_name: String = ""
@export var fade_to_white: bool = false

func _ready():
	body_entered.connect(on_body_entered)
	

func on_body_entered(body):
	if body.name == "Player":
		SceneManager.change_scene("res://Scenes/"+scene_name+".tscn", fade_to_white)
	


