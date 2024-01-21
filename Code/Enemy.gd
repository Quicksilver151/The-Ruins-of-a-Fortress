extends CharacterBody2D

enum EnemyType {Rougue, Knight}
var current_type: EnemyType

@export var sprite: Sprite2D;

var health = 10;

func _ready():
	current_type = EnemyType.values()[randi() % 2];
	sprite.frame = current_type
	var lh = $LHWeapon
	var rh = $RHWeapon
	
	lh.frame = randi() % 2 + 1
	rh.frame = randi() % 2 + 1
	
	lh.visible = randi()%2 as bool
	if lh.visible:
		rh.visible = randi()%2 as bool
	else:
		rh.visible = true
	

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group(&"player")

var speed = 30;
func _physics_process(_delta):
	if health <= 0:
		# AP.play_sound("enemy_hurt");
		await get_tree().process_frame
		queue_free();
	queue_redraw()
	# health -= delta;
	if player == null: return;
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()


func _draw():
	draw_line(Vector2(-5,-32), Vector2(5,-32), Color.BLACK, 1, false)
	draw_line(Vector2(-5,-32), Vector2(health-5, -32), Color.WHITE, 1, false)

