extends Control

var total = 0.0;
var infected = 0.0;
var combo = 0;

func _enter_tree():
	Globals.set("bubbles_counter", self);
	
func add():
	total += 1;
	get_node("total").set_text("total bubbles: %d" % total);
	updatePercent();
	
func decrease():
	total -= 1;
	get_node("total").set_text("total bubbles: %d" % total);
	updatePercent();
	
func addInfected():
	infected += 1;
	combo += 1;
	var saver = Globals.get("game_saver");
	saver.savedict.money += log(combo)*10;
	get_node("infected").set_text("infected bubbles: %d" % infected);
	get_node("combo").set_text("combo: %dx" % combo);
	updatePercent();

func discardCombo():
	var saver = Globals.get("game_saver");
	saver.savedict.money += combo*2;
	combo = 0;
	get_node("combo").set_text("combo: %dx" % combo);
	pass;

var appearOnce = false;

func updatePercent():
	if(total == 0): return;
	get_node("percent").set_text("%d%%" % (infected/total*100.0));
	
	if(infected/total*100.0 > 80 && !appearOnce):
		appearOnce = true;
		get_node("nextlevelButton").set_hidden(false);
		get_node("../restartButton").set_hidden(false);
		var appearText = load("res://objs/AppearLabel.tscn").instance();
		get_node("nextlevelButton").add_child(appearText);
		appearText.set_text("Target reached!");
		appearText.set_pos(Vector2(0,-30));