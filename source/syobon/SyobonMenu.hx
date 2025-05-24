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

        var snapFilter = new ShaderFilter(new PixelSnapShader(2));
        FlxG.camera.setFilters([snapFilter]);
    }

    override function update(elapsed:Float){
        super.update(elapsed);
    }
}