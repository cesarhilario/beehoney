extends Node

const new_spider = preload("res://scenes/spider.tscn")
const new_flower = preload("res://scenes/flower.tscn")

var score = 0;
var life = 3;
var gameover = false

func _ready():
	pass


func spawn_spider():
	var spider= new_spider.instance()
	spider.position.x = int(rand_range(0, 720))
	spider.position.y = 0
	get_node("container").add_child(spider)
	pass
	
	
func spawn_flower(): 
	var flower = new_flower.instance()
	flower.position.x = int(rand_range(0, 720))
	flower.position.y = 0
	get_node("container").add_child(flower)
	pass


func _on_timerspiderspawn_timeout():
	if gameover == false :
		spawn_spider()
	pass
	
func _on_timerflowerspawn_timeout():
	if gameover == false:
		spawn_flower()
	pass 

func _on_bee_area_entered(area):
	if(area.name == "flower"):
		score +=1
		get_node("hud/score").text = str(score)
		area.get_parent().queue_free()
	if(area.name == "spider"):
		if(life == 3): 
			life -= 1
			get_node("hud/life3").hide()
		elif(life == 2): 
			life -= 1
			get_node("hud/life2").hide()
		elif(life == 1): 
			life -= 1
			get_node("hud/life1").hide()
			gameover = true;
			get_node("bee").queue_free()
			get_node("gameover/gemeover-text").show()
			get_node("gameover/restart").start()
	pass 


func _on_restart_timeout():
	get_tree().reload_current_scene()
	
	pass # Replace with function body.
