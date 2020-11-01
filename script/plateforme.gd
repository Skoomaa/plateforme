extends KinematicBody2D

export (NodePath) var patrol_path

var speed = 100
var velocite = Vector2()
var patrol_points
var patrol_points_index = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	if patrol_path:
		patrol_points  = get_node(patrol_path).curve.get_baked_points()

func _physics_process(delta):
	if !patrol_path:
		return
		
	var target = patrol_points[patrol_points_index]
	if position.distance_to(target)<1:
		patrol_points_index = wrapi(patrol_points_index +1,0,patrol_points.size())
		target = patrol_points[patrol_points_index]
		
	velocite = (target-position).normalized() * speed
	velocite = move_and_slide(velocite)
	
	
