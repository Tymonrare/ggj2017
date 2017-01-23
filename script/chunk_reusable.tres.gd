extends Node
var bubbleref = preload("res://bubble.tscn");

func _process(delta):
	if(randi()%1000>990):
		var bubble = bubbleref.instance();
		bubble.set_rot(randf(360));
		bubble.set_pos(Vector2(rand_range(-100,100),rand_range(-100,100)));
		bubble.apply_impulse(Vector2(0,0), Vector2(rand_range(-5000, 5000), rand_range(-5000, 5000)));
		add_child(bubble);

func _ready():
	set_process(true);
	pass;