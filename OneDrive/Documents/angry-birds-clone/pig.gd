extends RigidBody2D

var damage_threshold = 150

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _on_body_entered(body: Node) -> void:
	
	if body.is_in_group("birds"):
		var impact_velocity = body.linear_velocity.length()
		
		if impact_velocity > damage_threshold:
			pop_pig()


	if body.is_in_group("blocks"):
		var impact_velocity = body.linear_velocity.length() 
		print("Impact velocity was:", impact_velocity)
		
		if impact_velocity > damage_threshold:
			pop_pig()

func pop_pig():
	$AudioStreamPlayer2D.play()
	# Update the global count 
	GameManager.pigs_remaining -= 1
	
	visible = false 
	await $AudioStreamPlayer2D.finished
	queue_free()
