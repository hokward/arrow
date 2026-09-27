extends Node2D

@onready var start_screen = $StartScreen
@onready var timer = $Timer 


var monster_scene = preload("res://Monster.tscn") 

func _ready():
	get_tree().paused = true 
	start_screen.show()
	timer.timeout.connect(_on_monster_respawn)

var score = 0
@onready var score_label = $UI/Label  

func add_score():
	score += 1
	score_label.text = "Score: " + str(score)
	
	
	timer.start()

func _on_monster_respawn():
	
	var new_monster = monster_scene.instantiate()
	
	
	new_monster.position = Vector2(randf_range(200, 900), randf_range(200, 500))
	
	add_child(new_monster)

func _on_button_pressed() -> void:
	start_screen.hide()     
	get_tree().paused = false 
