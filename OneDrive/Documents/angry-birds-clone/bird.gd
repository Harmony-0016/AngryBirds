extends RigidBody2D

var dragging = false
var start_pos = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		start_pos = global_position # Remember where the slingshot is

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
		else:
			dragging = false
			launch_bird()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if dragging:
		# Move the bird to follow the mouse while dragging
		global_position = get_global_mouse_position()

func launch_bird():
	freeze = false #enable physics
	
	#calculating the launch vector
	var launch_vector = start_pos - global_position
	
	#calculating the launch power and applying it
	apply_central_impulse(launch_vector*5)
