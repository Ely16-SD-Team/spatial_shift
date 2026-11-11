global.ScreenManager = new Transleet(0, 0.07); 
PrevCamX = 0;
shake_intensity = 0;
tim = 0;
global.DescriptionText = "";
global.ActiveInteractID = noone; 

global.RoomSpawnPos = [196,267];
global.RoomSpawnDir = 0;
global.RoomSkip = false;

global.SoundVolume = 1;

audio_play_sound(rain_SN,1,1,global.SoundVolume);

global.PlayerStop = false;


global.Catarsis = 0