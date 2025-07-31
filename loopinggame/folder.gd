extends Node2D

var height = -10
var inFront = false
var inMid = false
var inBack = false
@export var genre = "null"

func _ready() -> void:
	pass # Replace with function body.



func _process(delta: float) -> void:
	if inFront and Input.is_action_just_pressed("click"):
		get_parent().get_node("DjStation").switchDrums(genre)
	if inMid and Input.is_action_just_pressed("click"):
		get_parent().get_node("DjStation").switchBass(genre)
	if inBack and Input.is_action_just_pressed("click"):
		get_parent().get_node("DjStation").switchLead(genre)
		
func _on_front_area_mouse_entered() -> void:
	$FrontRecDrums.position.y+=height
	$Drums.visible=true
	inFront = true
func _on_front_area_mouse_exited() -> void:
	$FrontRecDrums.position.y-=height
	$Drums.visible=false
	inFront = false
func _on_mid_area_mouse_entered() -> void:
	$MidRecBass.position.y+=height
	$Bass.visible=true
	inMid=true
func _on_mid_area_mouse_exited() -> void:
	$MidRecBass.position.y-=height
	$Bass.visible=false
	inMid = false
func _on_back_area_mouse_entered() -> void:
	$BackRecLead.position.y+=height
	$Lead.visible=true
	inBack=true
func _on_back_area_mouse_exited() -> void:
	$BackRecLead.position.y-=height
	$Lead.visible=false
	inBack=false
