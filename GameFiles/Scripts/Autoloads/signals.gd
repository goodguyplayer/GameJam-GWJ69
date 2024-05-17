extends Node

signal player_health_changed(old, new)
signal player_died()
signal player_fell()
signal dash_available()
signal dash_used()
signal score_increase(val_increase)
signal score_changed(current, highscore)
signal score_final(current, highscore, is_new_highscore)
