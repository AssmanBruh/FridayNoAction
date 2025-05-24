package syobon;

import flixel.FlxState;
import flixel.FlxG;

class SyobonActions{
    public static function goTo(state:FlxState){
        if (state == null) state = FlxG.state;

        FlxG.switchState(state);
    }

    public function resetState(){
        FlxG.switchState(FlxG.state);
    }
    
    public function closeGame(){
        #if desktop
        Sys.exit(0);
        #end
    }

    public function setTitle(title:String, force:Bool = false){
        var gameTitle = "Friday No Action!";
        if (force){
            gameTitle = title;
        }else{
            gameTitle += title;
        }

        // lime.window.Window.current.title = gameTitle;
    }
}