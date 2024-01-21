@tool
extends Polygon2D
class_name StaticPolygon2D

@export var visible_on_run: bool = false;
@export var enabled: bool = true


func _ready():
	modulate.a = 0.3;
	modulate.b = 0.5;
	modulate.g = 0.5;

	if Engine.is_editor_hint():
		return;

	await get_tree().process_frame
	
	if !visible:
		return
	
	
	var new_static_body: StaticBody2D = StaticBody2D.new();
	new_static_body.position = position
	var new_collision_polygon: CollisionPolygon2D = CollisionPolygon2D.new();
	new_collision_polygon.polygon = polygon;
	new_collision_polygon.disabled = !enabled
	
	add_sibling(new_static_body);
	new_static_body.add_child(new_collision_polygon);
	
	if visible_on_run:
		reparent(new_static_body);
	else:
		queue_free();




