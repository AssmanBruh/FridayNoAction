// PixelPerfectShader.hx
package shaders;

import flixel.system.FlxAssets.FlxShader;

class PixelSnapShader extends FlxShader
{
    @:glFragmentSource('
        #pragma header

        uniform float uScale; // Ej: 2.0, 3.0...

        void main()
        {
             vec2 pixelCoord = floor(openfl_TextureCoordv * openfl_TextureSize / uScale) * uScale / openfl_TextureSize;
            gl_FragColor = texture2D(bitmap, pixelCoord);
        }
    ')

    public function new(scale:Float = 1.0)
    {
        super();
        this.uScale.value = [scale];
    }
}