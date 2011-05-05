PImage img;
PImage mona;
float changeRate = 0.05;

void setup() 
{
  size(400, 400);
  frameRate(3);


  mona = loadImage("/Users/chrisspurgeon/Documents/genetic_algorithm_experiments/mona_lisa/images/300x300.jpg");  
  img = createImage(300, 300, RGB);
  for(int i=0; i < img.pixels.length; i++) {
    img.pixels[i] = color(random(0,255),random(0,255), random(0,255));
  }
}

void draw() 
{
  background(0);
  img.loadPixels();
  mona.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {

    float r = red(img.pixels[i]);
    float g = green(img.pixels[i]);
    float b = blue(img.pixels[i]);
    float rMona = red(mona.pixels[i]);
    float gMona = green(mona.pixels[i]);
    float bMona = blue(mona.pixels[i]);
    r = adjust(r, rMona, changeRate);
    g = adjust(g, gMona, changeRate);
    b = adjust(b, bMona, changeRate);



    color c;
    c = color(r,g,b);
    img.pixels[i] = c;
  }
  img.updatePixels();
  if (frameCount % 2 == 0) {
    image(img, 50, 50);
  } 
  else {
    image(mona, 50, 50);
  }
  println(frameCount);
}

float adjust(float origColor, float targetColor, float changeRate) {
  float adjustedColor = 0.0;
  float diff = 0.0;
  diff = targetColor - origColor;
  adjustedColor = origColor + (diff * changeRate);
  return adjustedColor;
}

