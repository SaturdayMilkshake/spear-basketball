extends Node3D

@onready var chicane_board: Node = $Chicane/Board

@export var movement_modifier: float = 0.3
@export var max_degrees: int = 5

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		chicane_board.rotation_degrees.x -= movement_modifier
	elif Input.is_action_pressed("ui_down"):
		chicane_board.rotation_degrees.x += movement_modifier
		
	if chicane_board.rotation_degrees.x >= max_degrees:
		chicane_board.rotation_degrees.x = max_degrees
	elif chicane_board.rotation_degrees.x <= -max_degrees:
		chicane_board.rotation_degrees.x = -max_degrees

	if Input.is_action_pressed("ui_left"):
		chicane_board.rotation_degrees.z += movement_modifier
	elif Input.is_action_pressed("ui_right"):
		chicane_board.rotation_degrees.z -= movement_modifier

	if chicane_board.rotation_degrees.z >= max_degrees:
		chicane_board.rotation_degrees.z = max_degrees
	elif chicane_board.rotation_degrees.z <= -max_degrees:
		chicane_board.rotation_degrees.z = -max_degrees

	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
