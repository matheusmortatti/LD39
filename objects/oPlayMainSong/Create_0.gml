/// @description Insert description here
// You can write your code in this editor

if(!audio_is_playing(sndMain))
	audio_play_sound(sndMain, 1, true);
instance_destroy();