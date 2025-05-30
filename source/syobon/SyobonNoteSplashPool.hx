package syobon;

import flixel.group.FlxGroup.FlxTypedGroup;

class SyobonNoteSplashPool
{
    private static var _pool:FlxTypedGroup<SyobonNoteSplash> = new FlxTypedGroup<SyobonNoteSplash>();
    private static var _maxSize:Int = 6; // Max Pool Size

    public static function preload(isPixel:Bool = true, splashPath:String = "syobonNoteSplashes"):Void
    {
        // Fetching instances!
        for (i in 0..._maxSize)
        {
            var splash:SyobonNoteSplash = new SyobonNoteSplash(isPixel, splashPath);
            // splash.x = strum.x + ((strum.width-splash.width)/2);
            // splash.y = strum.y + ((strum.height-splash.height)/2);
            splash.cameras = [PlayState.instance.camHUD];
            splash.kill(); // de'active the splasj
            _pool.add(splash);
        }
    }

    public static function get(x:Float, y:Float, note:Note, isPixel:Bool = true, noteSplashes:String="syobonNoteSplashes"):SyobonNoteSplash
    {
        // recycle and create new one 
        var splash:SyobonNoteSplash = _pool.recycle(SyobonNoteSplash);
        if (splash == null)
        {
            splash = new SyobonNoteSplash(isPixel, noteSplashes, note.noteData);
            _pool.add(splash);
        }

        splash.revive(); // Activade one!
        splash.setPosition(x, y);
        // splash.x -= splash.width/2;
        // splash.y += splash.height/4;
        splash.playSplash();
        return splash;
    }

    public static function clear():Void
    {
        _pool.clear(); // Clean the pool~
    }
}