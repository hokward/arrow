extends Area2D

func _ready():
	monitoring = false 

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		swing()

func swing():
	monitoring = true
	rotation += deg_to_rad(90)
	await get_tree().create_timer(0.1).timeout 
	rotation -= deg_to_rad(90)
	monitoring = false


func _on_body_entered(body):
	if body.is_in_group("monsters") or body.name == "Monster":
		
		get_tree().get_root().get_node("Main").add_score()
		body.queue_free() 
