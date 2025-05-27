package syobon;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import openfl.filters.ShaderFilter;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import shaders.PixelSnapShader;

class SyobonCharacterEditor extends MusicBeatState{
    var bg:FlxSprite;
	var SYOBON_BG_GLOBAL_SCALE:Float = 2.057142857143;
    var a:Character;
    public var charName:String = "bf-cat";
    var infoTexts:FlxTypedGroup<FlxText>; 
    public function new(char:String = "bf-cat"){
        super();
        charName = char;
    }
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

        // g = ghost :v
        var ga = new Character(0,0,charName);
        ga.debugMode = true;
        ga.color = FlxColor.GRAY;
        ga.alpha = 0.5;
        ga.screenCenter(X);
        add(ga);

        a = new Character(0,0,charName);
        a.debugMode = true;
        a.screenCenter(X);
        add(a);

        // var snapFilter = new ShaderFilter(new PixelSnapShader(SYOBON_BG_GLOBAL_SCALE));
        // FlxG.camera.setFilters([snapFilter]);
        infoTexts = new FlxTypedGroup<FlxText>();
        add(infoTexts);

        // trace(a.animation.getAnimationList());
        var animNames:Array<String> = [];
        @:privateAccess
        for (name in a.animation._animations.keys()){
             animNames.push(name);
        }
        for (i in 0...animNames.length){
            //  var info = new FlxText(100, 100, 0, a.animation.getAnimationNames()[i], 24);
             var info = new FlxText(100, 100, 0, animNames[i], 24);
             info.setFormat(Paths.font("vcr.ttf"), 24, 0xFFFFFFFF, LEFT, OUTLINE, 0xFF000000);
             info.ID = i;
             info.y += 26*i;
             info.borderSize = 1.23;
             info.scrollFactor.set();
             infoTexts.add(info);
        }
    }

    override function update(elapsed:Float){
        super.update(elapsed);
        if (FlxG.keys.pressed.Q){
            FlxG.camera.zoom += 0.2*elapsed;
        }else if (FlxG.keys.pressed.E){
            FlxG.camera.zoom -= 0.2*elapsed;
        }

        if (FlxG.keys.pressed.K){
            FlxG.camera.scroll.y -= 14*elapsed;
        }if (FlxG.keys.pressed.I){
            FlxG.camera.scroll.y += 14*elapsed;
        }if  (FlxG.keys.pressed.J){
            FlxG.camera.scroll.x += 14*elapsed;
        }if (FlxG.keys.pressed.L){
            FlxG.camera.scroll.x -= 14*elapsed;
        }

        if (FlxG.keys.justPressed.DOWN){
            updateOffset();
        }if (FlxG.keys.justPressed.UP){
            updateOffset();
        }if  (FlxG.keys.justPressed.LEFT){
            updateOffset();
        }if (FlxG.keys.justPressed.RIGHT){
            updateOffset();
        }

        var missSuffix = (FlxG.keys.pressed.SHIFT) ? "miss" : "";

        if (FlxG.keys.justPressed.A){
            a.playAnim("singLEFT"+missSuffix,true);
        }if (FlxG.keys.justPressed.D){
            a.playAnim("singRIGHT"+missSuffix,true);
        }if (FlxG.keys.justPressed.S){
            a.playAnim("singDOWN"+missSuffix,true);
        }if (FlxG.keys.justPressed.W){
            a.playAnim("singUP"+missSuffix,true);
        }if (FlxG.keys.justPressed.SPACE){
            a.playAnim("idle",true);
        }

        if (FlxG.keys.justPressed.NINE){
            a.scale.x=a.scale.y=a.scale.x+0.05;
            trace(a.scale.x);
        }if (FlxG.keys.justPressed.EIGHT){
            a.scale.x = a.scale.y=a.scale.x-0.05;
            trace(a.scale.x);
        }

        if (FlxG.keys.justPressed.ESCAPE){
            FlxG.switchState(new SyobonMenu());
        }

        for (te in infoTexts.members){
            // var zoomed = 1+(FlxG.camera.zoom*-1);
            // te.scale.set(zoomed,zoomed);
            if (a.animation.curAnim != null){
                if (te.text == a.animation.curAnim.name){
                    te.color = FlxColor.CYAN;
                }else{
                    te.color = FlxColor.WHITE;
                }
            }
        }
    }

    function updateOffset(){
        var multi = (FlxG.keys.pressed.CONTROL ? 10 : 1);
        var isXorY = (FlxG.keys.justPressed.LEFT || FlxG.keys.justPressed.RIGHT);
        var positiveOrNegative = ((FlxG.keys.justPressed.LEFT || FlxG.keys.justPressed.UP) ? 1 : -1);
        if (a.animation.curAnim == null) return;
        a.animOffsets.get(a.animation.curAnim.name)[(isXorY ? 0 : 1)] += positiveOrNegative * multi;
        a.addOffset(a.animation.curAnim.name, a.animOffsets.get(a.animation.curAnim.name)[0], a.animOffsets.get(a.animation.curAnim.name)[1]);
		a.playAnim(a.animation.curAnim.name, false);
    }
}