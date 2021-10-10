extends Node

var score = 0
var camera = null

signal changed
var scores = {
	0:0,
	1:0,
	2:0,
	3:10,
	4:20,
	5:50,
	6:100,
	7:200,
	8:300,
	9:1000
}

func _unhandled_input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

func change_score(s):
	score += s
	emit_signal("changed")
	if camera == null:
		camera = get_node_or_null("/root/Game/Camera")
	if camera != null:
		camera.add_trauma(s/20.0)
