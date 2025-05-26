package syobon;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import openfl.filters.ShaderFilter;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import shaders.PixelSnapShader;

class SyobonMenu extends MusicBeatState{
    var bg:FlxSprite;
	var SYOBON_BG_GLOBAL_SCALE:Float = 2.057142857143;
    var a:Character;
    override function create(){
        super.create();

        bg = new FlxSprite(0,0);
        bg.loadGraphic(Paths.image("menu/Menu", "syobon"));
        bg.setGraphicSize(0,FlxG.height);
        bg.updateHitbox();
        bg.scrollFactor.set();
        bg.screenCenter();
        bg.antialiasing = false;
        // bg.shader =new PixelSnapShader();
        add(bg);

        a = new Character(0,0,"syobon");
        a.screenCenter(X);
        a.y = FlxG.height-a.height-60;
        add(a);

        // var snapFilter = new ShaderFilter(new PixelSnapShader(SYOBON_BG_GLOBAL_SCALE));
        // FlxG.camera.setFilters([snapFilter]);
    }

    override function update(elapsed:Float){
        super.update(elapsed);
        if (FlxG.keys.pressed.Q){
            FlxG.camera.zoom += 0.1*elapsed;
            FlxG.camera.scroll.y -= 10*elapsed;
        }else if (FlxG.keys.pressed.E){
            FlxG.camera.zoom -= 0.1*elapsed;
            FlxG.camera.scroll.y += 10*elapsed;
        }
        if (FlxG.keys.pressed.DOWN){
            a.y += 100*elapsed;
        }if (FlxG.keys.pressed.UP){
            a.y -= 100*elapsed;
        }if  (FlxG.keys.pressed.LEFT){
            a.x -= 100*elapsed;
        }if (FlxG.keys.pressed.RIGHT){
            a.x += 100*elapsed;
        }

        if (FlxG.keys.justPressed.A){
            a.playAnim("singLEFT",true);
        }if (FlxG.keys.justPressed.D){
            a.playAnim("singRIGHT",true);
        }if (FlxG.keys.justPressed.S){
            a.playAnim("singDOWN",true);
        }if (FlxG.keys.justPressed.W){
            a.playAnim("singUP",true);
        }
    }
}