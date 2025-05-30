package syobon;

import flixel.FlxG;
import flixel.FlxSprite;

class SyobonNoteSplash extends FlxSprite {
    public var isPixel:Bool = true;
    public function new(pixel:Bool = true, noteSplashStyle:String, dir:Int = 0) {
        this.isPixel = pixel;
        super();

        build(noteSplashStyle, dir);
    }

    public function build(style:String ="syobonNoteSplashes",dir:Int=0) {
        // frames = AssetPaths.spriteXML(style);
        // // for (color in ["purple", "blue", "red", "green"]){
        // for (i in 0...4){
        //     var color = StrumData.noteColors[i].toLowerCase();
        //     var why = (color == "blue" ? " " : "");
        //     animation.addByPrefix("splash0"+color, "note impact 1 "+why+color,24,false);
        //     animation.addByPrefix("splash1"+color, "note impact 2 "+color,24,false);
        // }
        loadGraphic(Paths.image("ui/"+style, "syobon"));
        loadGraphic(Paths.image("ui/"+style, "syobon"), true, Std.int(width/8), Std.int(height/2));
        // var frame = dir+(1*dir);
        // var frame_row = dir+9;
        // var variant_frame = dir+(4*2);

        // animation.add("splash-0", [frame, frame+1, frame_row,frame_row+1]);
        // animation.add("splash-1", [variant_frame, variant_frame+1, variant_frame,variant_frame+1]);
        // animation.add("splash-purple", [0, 4, 8, 12]);
        animation.add("splash-0", [dir, dir+4, dir+8, dir+12], 12, false);
        //                                                                flipX, flipY  
        // whay flipX and flipY? its for create an variant effect :3
        animation.add("splash-1", [dir, dir+4, dir+8, dir+12], 12, false, true, true);
        var splashScale = 1.0 * (isPixel?6:1);
        scale.set(6,6);
        antialiasing = !isPixel;
        updateHitbox();
        animation.finishCallback = function(animName) {
            kill();
        }
    }

    public function playSplash() {
        animation.play("splash-"+FlxG.random.int(0,1), true);
        if (animation.curAnim == null) return;
        
        animation.curAnim.frameRate = 24 + (FlxG.random.int(-2,2));

        // offset.set(width*0.3,height*0.3);
    }
}