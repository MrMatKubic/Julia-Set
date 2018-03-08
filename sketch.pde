float maxiterations = 120;
float ca = -0.75;
float cb = 0;
float nexta, nextb;
float i;
float angle = 0;

void setup()
{
  size(800, 800);
  loadPixels();
  
  colorMode(HSB);
  
  for(int y = 0; y < height; y++)
  {
    for(int x = 0; x < width; x++)
    {
      int index = x + y * width;
      
      nexta = map(x, 0, width, -2, 2);
      nextb = map(y, 0, height, 2, -2);
      
      for(i = 0; i < maxiterations; i++)
      {
        float norme = sqrt(sq(nexta) + sq(nextb));
        float alpha = atan(nextb/nexta);
        
        float nextnorme = sq(norme);
        float nextalpha = alpha * 2;
        
        nexta = nextnorme * cos(nextalpha);
        nextb = nextnorme * sin(nextalpha);
        
        nexta += ca;
        nextb += cb;
        
        if(nexta > 20) break;
      }
      if(i == maxiterations) pixels[index] = color(0);
      else pixels[index] = color(map(i, 0, maxiterations, 0, 255), 255, 255);
    }
  }  
  updatePixels();  
}

void draw()
{  
}