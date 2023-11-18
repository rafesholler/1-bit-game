extends Node2D

const MAX_MOUSE_SPEED = 25
var i
var read = false

# Called when the node enters the scene tree for the first time.
func _ready():
	i = 0
	print(Global.players)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Cursor.selected == true and $Cursor2.selected == true:
		read = true
		$PressStart.visible = true
	else:
		$PressStart.visible = false

func _unhandled_input(event):
	#if Input.is_action_just_pressed("p1_jump"):
		#$RayCast2D.get_collider()
	if Input.is_action_just_pressed("Start") and read == true:
		var game = load("res://Scenes/game.tscn").instantiate();
		var p1;
		var p2;
		match Global.playerOneChar:
			"RIN":
				p1 = load("res://Characters/Rin/rin.tscn").instantiate();
			"CAELUM":
				p1 = load("res://Characters/Machamp/machamp.tscn").instantiate();
				
		match Global.playerTwoChar:
			"RIN":
				p2 = load("res://Characters/Rin/rin.tscn").instantiate();
			"CAELUM":
				p2 = load("res://Characters/Machamp/machamp.tscn").instantiate();
		p1.id = 0;
		p2.id = 1;
		
		game.get_node("Players").call_deferred("add_child", p1);
		game.get_node("Players").call_deferred("add_child", p1);
		get_parent().call_deferred("add_child", game);
		call_deferred("queue_free");
	if Input.is_action_pressed("bumper_L") and Input.is_action_pressed("bumper_R") and i < 2:
		if i == 1:
			if event.device == Global.players[0]:
				pass
			else:
				Global.players[i] = event.device
				print(Global.players[i])
				i += 1
		else:
			Global.players[i] = event.device
			print(Global.players[i])
			i += 1
	
