extends Node2D
@export var Texture1: Texture2D
@export var Texture2: Texture2D
var mainTexture: Texture2D
@export var dancertype: String = "8bit"
@export var midDanceName: String = "normalDance"
var walkingIn = true
var distFromCenter: float
var leaving = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	distFromCenter = int(randf_range(-700,700))
	$AnimationPlayer.play(midDanceName)
	if randf_range(0,2)>1:
		mainTexture = Texture1
	else:
		mainTexture=Texture2
	$boredDancer.texture = mainTexture
	$excitedDancer.texture = mainTexture
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if walkingIn:
		var posDif =get_parent().global_position.x-global_position.x
		if posDif >distFromCenter+2:
			position.x+=2
		elif posDif <distFromCenter-2:
			position.x-=2
		else:
			walkingIn=false
	if leaving:
		position.x-=2


func _on_timer_timeout() -> void:
	if !leaving:
		var danceStrength = get_parent().get_parent().get_node("DjStation").getGenreAmount(dancertype)
		if danceStrength == 0:
			$excitedDancer.visible=false
			$boredDancer.visible=true
			pass
		if danceStrength > 0:
			$excitedDancer.visible=true
			$boredDancer.visible=false
			
			#dance
			pass
		$Timer.start()


func _on_exit_timer_timeout() -> void:
	print(dancertype)
	$expirationTimer.start()
	leaving = true


func _on_expiration_timer_timeout() -> void:
	queue_free()
