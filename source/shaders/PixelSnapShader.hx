package shaders;

import flixel.system.FlxAssets.FlxShader;

class PixelSnapShader extends FlxShader
{
    @:glFragmentSource('
        #pragma header

        uniform float uPixelSize; // Escala del juego (ej: 2x, 3x...)
        
        void main()
        {
            // Calcula la posición del píxel en la textura original
            vec2 pixelCoord = openfl_TextureCoordv * openfl_TextureSize;
            
            // Ajusta al grid más cercano (snap to pixel)
            pixelCoord = floor(pixelCoord / uPixelSize) * uPixelSize;
            
            // Normaliza las coordenadas
            pixelCoord /= openfl_TextureSize;
            
            // Muestra el color del píxel snapped
            gl_FragColor = flixel_texture2D(bitmap, pixelCoord);
        }
    ')

    public function new(pixelSize:Float = 1.0)
    {
        super();
        this.uPixelSize.value = [pixelSize];
    }
}