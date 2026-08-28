extends RichTextLabel

var news_report = ["Hello! Thanks for tuning in to Channel 3 News-", "I'm your Weather Report 3NA!", "Today's weather is sunny, with temperatures in the high 60s!", "Tonight's temperature will drop to the high 50s, with some light fog.", "Stay tuned for our sports report!", ""]
var news_index = -1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Blab"):
		text = ""
		news_index = news_index + 1
		text = news_report[news_index]
		if news_index == 5:
			get_tree().change_scene_to_file("res://Scenes/Main Room/main_room.tscn")
			
		
