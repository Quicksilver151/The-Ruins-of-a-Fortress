extends CharacterBody2D

@export var speed = 50;
@export var acceleration = 4
# func _integrate_forces(state):
#   var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized();
#   state.linear_velocity.x = clamp(state.linear_velocity.x + acceleration * direction.x, -20, 20);
#   state.linear_velocity.y = clamp(state.linear_velocity.y + acceleration * direction.y, -20, 20);



func _physics_process(_delta):
  var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized();
  
  velocity = lerp(velocity, direction*speed, 0.1);
  $GPUParticles2D.skew = lerp($GPUParticles2D.skew, velocity.normalized().x / -2, 0.1)

  move_and_slide()

