extends Polygon2D


@export var enemy_packed_scene: PackedScene;

var timer_start = 5;
var timer = timer_start;


func _physics_process(delta):
	timer_start -= delta / 10;
	timer_start = max(timer_start, 0.1);
	
	timer -= delta;
	if timer < 0:
		spawn_enemies();
		timer = timer_start;
	
	var enemies = get_children()
	enemies.sort_custom(sort_y)
	$AudioScatter2D/Marker2D.position.y = enemies[0].position.y
	# print($AudioScatter2D/Marker2D.position)


func sort_y(a, b) -> bool:
	return a.global_position.y < b.global_position.y


func spawn_enemies():
	if get_child_count() > 300:
		return;
	var amount = 1;
	for i in range(amount):
		var enemy_instance = enemy_packed_scene.instantiate();
		enemy_instance.position = Array(polygon).pick_random();
		add_child(enemy_instance);
