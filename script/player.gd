extends KinematicBody2D


var velocite = Vector2()
var speed = 250
var impulsion = -500
var jumping = false
var gravite = 1000


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	get_input()
	gravite = 1000
	
	if jumping and is_on_floor():
		jumping = false
		
	if is_on_floor():
		gravite =0
		
	velocite.y += gravite * delta
	velocite = move_and_slide(velocite,Vector2(0,-1))
	for i in get_slide_count():
		var collision = get_slide_collision(i)
	
	
	
func get_input():
	if Input.is_action_pressed('ui_jump') and is_on_floor():
		jumping = true
		velocite.y = impulsion
	elif Input.is_action_pressed("ui_droite"):
		velocite.x = speed
	
	elif Input.is_action_pressed("ui_gauche"):
		velocite.x = -speed
	else:
		velocite.x = 0
	
		
	

		
