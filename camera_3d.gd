extends Camera3D

@export var offset = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	global_position.z = $"../Player".global_position.z + offset
	
	
	
	
	
	pass
