extends Node3D
@export var buildings : Array 
@export var orientation := "left"
@export var building_container : Node3D
var player : CharacterBody3D
var offset : float

var previous_z = 0
var next_building = preload("res://buildings/mcdonalds.tres")
var travel_length = 0
@onready var start_pos = abs(global_position.z)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent().find_child("Player")
	offset = abs(player.global_position.z - global_position.z)
	choose_building()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(abs (player.global_position.z), " ", previous_z + travel_length," ",previous_z)
	if abs (player.global_position.z) >= previous_z + travel_length - start_pos:
		spawnbuilding()
	global_position.z = player.global_position.z - offset
	pass


func spawnbuilding():
	
	var new_building = next_building.mesh.instantiate()
	if orientation == "left":
		new_building.global_position = global_position - Vector3(next_building.width, 0, 0)
	building_container.add_child(new_building)
	
	previous_z = abs(new_building.global_position.z)
	var old_building = next_building
	choose_building()
	travel_length = abs(old_building.length/2) + abs(next_building.length/2)
	
	print("spawn building")

#  0  1  2  3  4  5  6
# [0, 1, 2, 3, 4, 5]
# [trout, matheny, ohtani, judge, chisolm]
func choose_building():
	var index = randi_range(0,len(buildings)- 1) 
	var building = buildings[index]

func _on_timer_timeout() -> void:
	
	for n in building_container.get_children():
		if n.global_position.z - 10 > player.global_position.z:
			n.queue_free()
		pass
	pass # Replace with function body.
