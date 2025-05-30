package syobon.stages;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxTimer;

using StringTools;

class RageBaitStage extends FlxTypedGroup<Dynamic>
{
	var luckyblocks:FlxTypedGroup<FlxSprite>;
	var currentLuckyBlockID:Int = 0;
	var bf:FlxSprite;
	var star:FlxSprite;
	var molalla:FlxSprite;
	// JAJAJ XD
	var Conductor:Dynamic = {crochet: 244.5};
	public function new(){
		super();

		var solid = new FlxSprite(0,0).makeGraphic(910, 720, 0xFF000203);
		solid.setGraphicSize(0,FlxG.height);
		solid.screenCenter();
		solid.scrollFactor.set();
		add(solid);

		var bg = new FlxSprite(0,0,Paths.image("stages/rage-bait/Blocks", "shared"));
		bg.setGraphicSize(0,FlxG.height);
		// bg.setGraphicSize(Std.int(bg.width*SyobonActions.SYOBON_GLOBAL_SCALE));
		bg.screenCenter();
		add(bg);

		luckyblocks = new FlxTypedGroup<FlxSprite>();
		add(luckyblocks);

		for (i in 0...3){
		var luckyblock = new FlxSprite(217.371428571452, 228.514285714302).loadGraphic(Paths.image("stages/rage-bait/luckyblock", "shared"), true, 27, 26);
		// var luckyblock = new FlxSprite(217.371428571452, 228.514285714302);
		// luckyblock.frames = FlxAtlasFrames.fromSparrow("assets/images/luckBlockJsonTest.png","assets/images/luckBlockJsonTest.xml");
		luckyblock.animation.add("bump", [0, 1, 2, 3, 4, 5], 12, false);
		// luckyblock.animation.addByPrefix("start", "luckyblock", 0, false);
		// luckyblock.animation.addByPrefix("bump", "luckyblock", 12, false);
		// luckyblock.animation.play("start");
		luckyblock.ID = i;
		luckyblock.antialiasing = false;
		luckyblock.setGraphicSize(Std.int(luckyblock.width*SyobonActions.SYOBON_GLOBAL_SCALE));
		luckyblock.updateHitbox();
		// luckyblock.x += (luckyblock.width)*i;
		// luckyblock.x *= SyobonActions.SYOBON_GLOBAL_SCALE;
		// luckyblock.y *= SyobonActions.SYOBON_GLOBAL_SCALE;
		// luckyblock.x += (27*SyobonActions.SYOBON_GLOBAL_SCALE)*i;
		// luckyblock.x -=(luckyblock.width/SyobonActions.SYOBON_GLOBAL_SCALE);
		
		switch (i){
			case 1:
				luckyblock.setPosition(258.371428571452, 228.514285714302);
			case 2:	
				luckyblock.setPosition(299.371428571452, 228.514285714302);
			// case 1,2:	
			// Adjusted, because otherwise the double pixel effect will not be seen :v
			// luckyblock.x-=1*SyobonActions.SYOBON_GLOBAL_SCALE; 
		}
		luckyblocks.add(luckyblock);
		}

		// new FlxTimer().start((Conductor.crochet/1000)*4, function(tmr) {
		// 	currentLuckyBlockID+=1;
		// 	// currentLuckyBlockID = (currentLuckyBlockID)%(luckyblocks.members.length-1);
		// 	// min + (value - min) % range;
		// 	// currentLuckyBlockID = 0 + (currentLuckyBlockID+1-0) % ((luckyblocks.members.length-1)-0+1);
		// 	currentLuckyBlockID = FlxMath.wrap(currentLuckyBlockID+1, 0, luckyblocks.members.length-1);
		// 	trace(currentLuckyBlockID%luckyblocks.members.length);
        //     // currentLuckyBlockID = Std.int(Math.abs(currentLuckyBlockID - (luckyblocks.members.length-1))); 

		// 	var currentLuckyBlock = luckyblocks.members[currentLuckyBlockID];
		// 	// fixing the behind trouble!
		// 	luckyblocks.remove(currentLuckyBlock,true);
		// 	luckyblocks.add(currentLuckyBlock);
		// 	currentLuckyBlock.animation.play("bump");
		// }, 0);

		// // first step. get the graphic
		// // bf = new FlxSprite(0,0,"assets/images/fernan_cat_mario_bf-Sheet.png");
		// // bf = new FlxSprite(525, 310.166666666667);
		// bf = new FlxSprite(525, 310.166666666667,"assets/images/fernan_cat_mario_bf-Sheet.png");
		// // now get the frame size
		// // bf.loadGraphic("assets/images/fernan_cat_mario_bf-Sheet.png",true,Std.int(bf.width/5),Std.int(bf.width/5));
		// bf.loadGraphic("assets/images/fernan_cat_mario_bf-Sheet.png",true,Std.int(bf.width/5),Std.int(bf.height/4));
		// // bf.loadGraphic("assets/images/fernan_cat_mario_bf-Sheet.png",true,Std.int(8*6),Std.int(8*6));
		// // bf.loadGraphic("assets/images/fernan_cat_mario_bf-Sheet.png",true,48,40);
		// trace(bf.width+", "+bf.height);
		// bf.animation.add("idle", [0, 1, 2, 3], 12, false);
		// bf.animation.add("singLEFT", [4, 5, 6], 12, false);
		// bf.animation.add("singDOWN", [7, 8, 9], 12, false);
		// bf.animation.add("singUP", [10, 11, 12], 12, false);
		// bf.animation.add("singRIGHT", [13, 14, 15], 12, false);
		// bf.animation.add("singRIGHTmiss", [13, 19], 12, false);
		// bf.animation.add("singLEFTmiss", [4, 16], 12, false);
		// bf.animation.add("singDOWNmiss", [7, 17], 12, false);
		// bf.animation.add("singUPmiss", [11, 18], 12, false);
		// bf.setGraphicSize(Std.int(bf.width*SyobonActions.SYOBON_GLOBAL_SCALE));
		// bf.updateHitbox();
		// bf.antialiasing = false;
		// // bf.screenCenter();
		// add(bf);
		// bf.animation.onFinish.add(function(animName:String){
        //    if (animName.startsWith("sing")){
		// 	   new FlxTimer().start((Conductor.crochet/1000)*8, function(tmr){
		// 		   bf.animation.play("idle");
		// 	   });
		// 	}
		// });

		// new FlxTimer().start((Conductor.crochet/1000)*2, function(tmr) {
		// 	if (bf.animation.curAnim == null)return;
		// 	if (!bf.animation.curAnim.name.startsWith("sing")){
		// 		bf.animation.play("idle");
		// 	}
		// }, 0);

		// star = new FlxSprite(307, 299).loadGraphic("assets/images/zzzstarcatmario-Sheet.png", true, 8*6, 8*6);
		// star.animation.add("idle", [0, 1, 2], 12, false);
		// star.animation.add("singLEFT", [3, 4, 5], 12, false);
		// star.animation.add("singDOWN", [6, 7, 8], 12, false);
		// star.animation.add("singUP", [9, 10, 11], 12, false);
		// star.animation.add("singRIGHT", [12, 13, 14], 12, false);
		// star.setGraphicSize(Std.int(star.width*SyobonActions.SYOBON_GLOBAL_SCALE));
		// star.updateHitbox();
		// star.antialiasing = false;
		// // bf.screenCenter();
		// add(star);
		// star.animation.onFinish.add(function(animName:String){
        //    if (animName.startsWith("sing")){
		// 	   new FlxTimer().start((Conductor.crochet/1000)*8, function(tmr){
		// 		star.animation.play("idle");
		// 	   });
		// 	}
		// });

		// new FlxTimer().start((Conductor.crochet/1000)*2, function(tmr) {
		// 	if (star.animation.curAnim == null)return;
		// 	if (!star.animation.curAnim.name.startsWith("sing")){
		// 		star.animation.play("idle");
		// 	}
		// }, 0);

		// molalla = new FlxSprite(0,0).loadGraphic("assets/images/JisakuJien.png");
		// molalla.loadGraphic("assets/images/JisakuJien.png", true, Std.int(molalla.width/4),Std.int(molalla.width/4));
		// // molalla.animation.add("idle", [0, 1, 2, 3], 12, false);
		// // molalla.animation.add("singLEFT", [8, 9], 12, false);
		// // molalla.animation.add("singDOWN", [4, 5], 12, false);
		// // molalla.animation.add("singUP", [6, 7], 12, false);
		// // molalla.animation.add("singRIGHT", [10, 11], 12, false);
		// var anims = ["idle", "singLEFT", "singDOWN", "singUP", "singRIGHT"];
		// for (i in 0...5){
		// 	trace("waa: "+[(i%4) - (anims[i] == "idle" ? 0:1)]);
		// 	var farmes = [];
		// 	farmes.push((i) - (anims[i] == "idle" ? 0:1));
		// 	for (fram in farmes){
		// 		trace(fram);
		// 		 molalla.animation.add(anims[i], [fram], 12, false); 
		// 	}
		// }
		// molalla.setGraphicSize(Std.int(molalla.width*SyobonActions.SYOBON_GLOBAL_SCALE));
		// molalla.updateHitbox();
		// molalla.antialiasing = false;
		// // bf.screenCenter();
		// add(molalla);
		// molalla.animation.onFinish.add(function(animName:String){
        //    if (animName.startsWith("sing")){
		// 	   new FlxTimer().start((Conductor.crochet/1000)*8, function(tmr){
		// 		molalla.animation.play("idle");
		// 	   });
		// 	}
		// });

		// new FlxTimer().start((Conductor.crochet/1000)*2, function(tmr) {
		// 	if (molalla.animation.curAnim == null)return;
		// 	if (!molalla.animation.curAnim.name.startsWith("sing")){
		// 		molalla.animation.play("idle");
		// 	}
		// }, 0);
	}

	// var count:Int = 0;
	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		// if (FlxG.keys.pressed.A){
		// 	FlxG.camera.scroll.x -= 100*elapsed;
		// }if (FlxG.keys.pressed.D){
		// 	FlxG.camera.scroll.x += 100*elapsed;
		// }

		// // if (FlxG.keys.justPressed.LEFT){
		// // 	luckyblocks.members[currentLuckyBlockID].x -= 1;
		// // 	trace("X: "+luckyblocks.members[currentLuckyBlockID].x+", Y: "+luckyblocks.members[currentLuckyBlockID].y);
		// // }if (FlxG.keys.justPressed.RIGHT){
		// // 	luckyblocks.members[currentLuckyBlockID].x += 1;
		// // 	trace("X: "+luckyblocks.members[currentLuckyBlockID].x+", Y: "+luckyblocks.members[currentLuckyBlockID].y);
		// // }if (FlxG.keys.justPressed.UP){
		// // 	luckyblocks.members[currentLuckyBlockID].y -= 1;
		// // 	trace("X: "+luckyblocks.members[currentLuckyBlockID].x+", Y: "+luckyblocks.members[currentLuckyBlockID].y);
		// // }if (FlxG.keys.justPressed.DOWN){
		// // 	luckyblocks.members[currentLuckyBlockID].y += 1;
		// // 	trace("X: "+luckyblocks.members[currentLuckyBlockID].x+", Y: "+luckyblocks.members[currentLuckyBlockID].y);
		// // }
		// if (FlxG.keys.justPressed.ONE){
		// 	count = FlxMath.wrap(count+1, 0, 3);
		// }
		// var charselected = switch (count){
        //     case 0: bf;
		// 	case 1: star;
		// 	case 2: molalla;
		// 	case _: bf;
		// }

		// if (FlxG.keys.pressed.LEFT){
		// 	charselected.x -= 1;
		// 	trace("X: "+charselected.x+", Y: "+charselected.y);
		// }if (FlxG.keys.pressed.RIGHT){
		// 	charselected.x += 1;
		// 	trace("X: "+charselected.x+", Y: "+charselected.y);
		// }if (FlxG.keys.pressed.UP){
		// 	charselected.y -= 1;
		// 	trace("X: "+charselected.x+", Y: "+charselected.y);
		// }if (FlxG.keys.pressed.DOWN){
		// 	charselected.y += 1;
		// 	trace("X: "+charselected.x+", Y: "+charselected.y);
		// }

		// var missSuffix = (FlxG.keys.pressed.SHIFT) ? "miss" : "";
		// if (FlxG.keys.justPressed.A){
		// 	charselected.animation.play("singLEFT"+missSuffix, true);
		// 	charselected.centerOrigin();
		// 	charselected.centerOffsets();
		// }if (FlxG.keys.justPressed.D){
		// 	charselected.animation.play("singRIGHT"+missSuffix, true);
		// 	charselected.centerOrigin();
		// 	charselected.centerOffsets();
		// }if (FlxG.keys.justPressed.W){
		// 	charselected.animation.play("singUP"+missSuffix, true);
		// 	charselected.centerOrigin();
		// 	charselected.centerOffsets();
		// }if (FlxG.keys.justPressed.S){
		// 	charselected.animation.play("singDOWN"+missSuffix, true);
		// 	charselected.centerOrigin();
		// 	charselected.centerOffsets();
		// }

		// if (FlxG.keys.justPressed.ESCAPE){
		// 	FlxG.switchState(new MenuState());
		// }
	}

	public function beatHit(curBeat:Int = 0){
		if (curBeat % 4 == 0){
			currentLuckyBlockID+=1;
			// currentLuckyBlockID = (currentLuckyBlockID)%(luckyblocks.members.length-1);
			// min + (value - min) % range;
			// currentLuckyBlockID = 0 + (currentLuckyBlockID+1-0) % ((luckyblocks.members.length-1)-0+1);
			currentLuckyBlockID = FlxMath.wrap(currentLuckyBlockID+1, 0, luckyblocks.members.length-1);
			trace(currentLuckyBlockID%luckyblocks.members.length);
            // currentLuckyBlockID = Std.int(Math.abs(currentLuckyBlockID - (luckyblocks.members.length-1))); 

			var currentLuckyBlock = luckyblocks.members[currentLuckyBlockID];
			// fixing the behind trouble!
			luckyblocks.remove(currentLuckyBlock,true);
			luckyblocks.add(currentLuckyBlock);
			currentLuckyBlock.animation.play("bump");
		}
	}
}
