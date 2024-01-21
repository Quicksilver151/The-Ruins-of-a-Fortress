extends CanvasLayer

@export var ScreenFadePlayer : AnimationPlayer

func change_scene(path: String = "res://Scenes/Main.tscn", white: bool = false):
	get_window().gui_disable_input = true
	
	if white:
		ScreenFadePlayer.play("fade_to_white")
	else:
		ScreenFadePlayer.play("fade_to_black")
	# ScreenFadePlayer.speed_scale = int(fast) + 1
	# await get_tree().create_timer(2.5 - int(fast) * 2).timeout
	await ScreenFadePlayer.animation_finished
	
	get_tree().change_scene_to_file(path)

	if white:
		ScreenFadePlayer.play("fade_from_white")
	else:
		ScreenFadePlayer.play("fade_from_black")
	
	await ScreenFadePlayer.animation_finished
	# await get_tree().create_timer(1).timeout
	
	get_window().gui_disable_input = false

func quit():
	get_window().gui_disable_input = true
	
	ScreenFadePlayer.play("fade_to_black")
	# await get_tree().create_timer(duration + 1).timeout
	await ScreenFadePlayer.animation_finished
	
	get_tree().quit()


func scale_screen(target: float):
	var level: float = get_tree().root.content_scale_factor
	# print(level, target)
	while true:
		level = snappedf(lerpf(level, target, 0.1), 0.00001);
		await get_tree().create_timer(0.0001).timeout;
		# print(level);
		if snappedf(level, 0.0001) == target: break;
		get_tree().root.content_scale_factor = snappedf(level, 0.001);
	# ProjectSettings.set_setting("display/window/size/viewport_width", w)
