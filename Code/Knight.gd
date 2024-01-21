extends CharacterBody2D


func _ready():
	pass # Replace with function body.

var health = 60
var speed = 40

func _physics_process(_delta):
	if health <= 0: SceneManager.change_scene("res://Scenes/CharacterSelect.tscn"); Global.room_survived.wizard = false;
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down");
	$Characters.visible = direction.y >= 0;
	$CharactersBack.visible = direction.y < 0;
	velocity = speed * direction;
	move_and_slide();
	queue_redraw();
	$AttackFX.modulate.a = lerp($AttackFX.modulate.a, ($ManualAttackArea.monitoring as float), 0.25)



func _unhandled_input(event):
	if event.is_action_pressed("a_attack") && !$ManualAttackArea.monitoring:
		$ManualAttackArea.monitoring = true
		
		$AttackFX.modulate = Color.WHITE
		$AttackFX.modulate.a = 0
		await get_tree().create_timer(0.2).timeout
		AP.play_sound("wizard_area")
		await get_tree().create_timer(0.8).timeout
		$AttackFX.modulate = Color.BLACK

		$ManualAttackArea.monitoring = false


func _draw():
	draw_line(Vector2(-10,-33), Vector2(10,-33), Color.BLACK, 1, false);
	draw_line(Vector2(-10,-33), Vector2((health/3.0) - 10, -33), Color.WHITE, 1, false);

