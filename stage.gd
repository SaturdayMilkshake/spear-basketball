extends Node2D

@export var game_time: int = 24

@onready var score_label: Node = $CanvasLayer/ScoreLabel
@onready var time_label: Node = $CanvasLayer/TimeLabel
@onready var timer: Node = $Timer
@onready var start_timer: Node = $StartTimer

@onready var texture_rect: Node = $CanvasLayer/TextureRect

@onready var animation_player: Node = $AnimationPlayer

#Audio
@onready var finish_sound: Node = $FinishSound

var high_score: int = 0

var game_score: int = 0

var game_active: bool = false

#shaders
var alpha_value: float = 0.0
var point_color: Color = Color.WHITE

func _ready() -> void:
	start_timer.start(6)

func _physics_process(delta: float) -> void:
	set_stoplight_visuals()
	if game_active:
		if Input.is_action_just_pressed("ui_accept"):
			add_2_points()
		elif Input.is_action_just_pressed("ui_select"):
			add_3_points()
		score_label.text = str(game_score)
	time_label.text = "%1.1f" % timer.time_left
	
	alpha_value -= 0.025
	alpha_value = max(alpha_value, 0)
	texture_rect.material.set_shader_parameter("point_color", Color(point_color, alpha_value))
	
func _on_timer_timeout() -> void:
	game_active = false
	finish_sound.play()
	process_game_end()
	
func add_score(amount: int) -> void:
	game_score += amount

func process_game_end() -> void:
	if game_score > high_score:
		high_score = game_score

func add_2_points() -> void:
	game_score += 2
	alpha_value = 0.7
	point_color = Color.RED
	
func add_3_points() -> void:
	game_score += 3
	alpha_value = 0.7
	point_color = Color.MAGENTA

func _on_start_timer_timeout() -> void:
	game_active = true
	$Stoplights.visible = false
	timer.start(game_time)

func set_stoplight_visuals() -> void:
	if start_timer.time_left <= 0:
		$Stoplights.visible = false
	else:
		if start_timer.time_left < 5:
			$Stoplights/TextureRect.visible = true
		if start_timer.time_left < 4:
			$Stoplights/TextureRect2.visible = true
		if start_timer.time_left < 3:
			$Stoplights/TextureRect3.visible = true
		if start_timer.time_left < 2:
			$Stoplights/TextureRect4.visible = true
		if start_timer.time_left < 1:
			$Stoplights/TextureRect5.visible = true
