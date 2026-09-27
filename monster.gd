extends CharacterBody2D

@onready var player = get_parent().get_node("Player")
const SPEED = 100.0

func _physics_process(delta):
	if player:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * SPEED
		move_and_slide()
		
	
		if global_position.distance_to(player.global_position) < 40.0:
			get_tree().reload_current_scene()
