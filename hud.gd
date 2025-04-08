extends Node3D

# Declare variables for the HUD elements
@onready var health_bar : ProgressBar = $CanvasLayer/HealthBar
@onready var score_label : Label = $CanvasLayer/ScoreLabel

var health : float = 60
var score : int = 0

func _ready():
	# Initialize the HUD elements
	health_bar.value = health
	score_label.text = "Score: " + str(score)

func _process(delta: float) -> void:
	# Example logic: Health decreases over time
	if health > 0:
		health -= 0.1 * delta  # Decrease health over time (for demo purposes)
	health_bar.value = health
	#health needs to be able to go from 100 to 0
	
	# Example logic: Score increases over time
	score += int(1 * delta)
	score_label.text = "Score: " + str(score)
