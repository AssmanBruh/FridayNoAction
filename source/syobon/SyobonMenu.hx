package syobon;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class SyobonMenu extends MusicBeatState{
    var bg:FlxSprite;
    override function create(){
        super.create();

        bg = new FlxSprite(0,0);
        bg.loadGraphic(Paths.image("menu/Menu", "syobon"));
        bg.setGraphicSize(0,FlxG.height);
        bg.updateHitbox();
        bg.scrollFactor.set();
        bg.screenCenter();
        bg.antialiasing = false;
        add(bg);
    }

    override function update(elapsed:Float){
        super.update(elapsed);
    }
}