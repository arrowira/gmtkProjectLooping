extends Node2D
@export var idleTexture: Texture2D
@export var danceTexture: Texture2D
@export var dancertype: String = "8bit"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$boredDancer.texture = idleTexture
	$excitedDancer.texture = danceTexture
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
