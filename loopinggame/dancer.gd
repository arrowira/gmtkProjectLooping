extends Node2D
@export var Texture1: Texture2D
@export var Texture2: Texture2D
var mainTexture: Texture2D
@export var dancertype: String = "8bit"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if randf_range(0,2)>1:
		mainTexture = Texture1
	else:
		mainTexture=Texture2
	$boredDancer.texture = mainTexture
	$excitedDancer.texture = mainTexture
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print()


func _on_timer_timeout() -> void:
	var danceStrength = get_parent().get_parent().get_node("DjStation").getGenreAmount(dancertype)
	if danceStrength == 0:
		$excitedDancer.visible=false
		$boredDancer.visible=true
		pass
	if danceStrength > 0:
		$excitedDancer.visible=true
		$boredDancer.visible=false
		$AnimationPlayer.play("normalDance")
		#dance
		pass
	$Timer.start()
