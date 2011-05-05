PImage img;

void setup() 
{
  frameRate(20);
  size(200, 200);  
  img = createImage(100, 100, RGB);
  for(int i=0; i < img.pixels.length; i++) {
    img.pixels[i] = color(random(0,255),random(0,255), random(0,255));
  }
}

void draw() 
{
  background(204);
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {

    float r = red(img.pixels[i]);
    float g = green(img.pixels[i]);
    float b = blue(img.pixels[i]);


    if (r < 254.0) {
      r = r + 1.0;
    }
    color c;
    c = color(r,g,b);
    img.pixels[i] = c;
  }
  img.updatePixels();
  image(img, 50, 50);
  println(frameCount);
}

