extends RigidBody3D

@export var throw_x_force: float = -10.0
@export var throw_y_force: float = 23.0

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		self.linear_velocity.y = throw_y_force
		self.linear_velocity.x = throw_x_force
		
	self.linear_velocity.y -= gravity_scale

func _on_visible_on_screen_notifier_3d_screen_exited() -> void:
	queue_free()
