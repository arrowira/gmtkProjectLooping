extends Node2D
@export var spawnPercentage = 10
static var hippieDancer := preload("res://hippie.tscn")
static var bitDancer := preload("res://8bitDancer.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var spawnChance = randi_range(0,100)
	if spawnChance<spawnPercentage:
		var newDancer
		var dancerType = randi_range(1,2)
		match dancerType:
			1:
				newDancer = hippieDancer.instantiate()
			2:
				newDancer = bitDancer.instantiate()
			
		
		newDancer.position = Vector2(position.x,randf_range(-200,200))
		get_parent().add_child(newDancer)
	
	
