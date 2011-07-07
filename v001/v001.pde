/**
 * Create Image. 
 * 
 * The createImage() function provides a fresh buffer of pixels to play with.
 * This example creates an image gradient.
 */

PImage img;

void setup() 
{
  size(200, 200);  
  img = createImage(120, 120, RGB);
  for(int i=0; i < img.pixels.length; i++) {
    img.pixels[i] = color(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  }
}

void draw() 
{
  background(204);
  image(img, 33, 33);
  //  print("Hello");
  //  print(img.pixels[0].color());
  float r = red(img.pixels[0]);
  println(r);
}

