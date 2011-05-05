int population = 20; // Number of images in the population.
int mutationCount = 50; // Number of pixels to change each generation.
int imageSize = 300; // We're assuming square images here.
String targetImagePath = "/Users/chrisspurgeon/Documents/genetic_algorithm_experiments/mona_lisa/images/300x300.jpg";

PImage img;
PImage mona;
float changeRate = 0.02;
float diff = 0.0;

ArrayList images;
//PImage[] images = new PImage[mutationCount];


void setup() 
{
  size(400, 400);
  images = new ArrayList();
  initializeImages();
  mona = loadImage(targetImagePath);

  for (int i = 0; i < images.size(); i++) {
    println("image " + i + " has a difference of " + calculateDifference((PImage) images.get(i), mona));
  }
}

void draw() 
{
  background(0);
  PImage workingImage = (PImage) images.get(0);
  workingImage.loadPixels();
  mona.loadPixels();
  for (int i = 0; i < workingImage.pixels.length; i++) {

    float r = red(workingImage.pixels[i]);
    float g = green(workingImage.pixels[i]);
    float b = blue(workingImage.pixels[i]);
    float rMona = red(mona.pixels[i]);
    float gMona = green(mona.pixels[i]);
    float bMona = blue(mona.pixels[i]);
    r = adjust(r, rMona, changeRate);
    g = adjust(g, gMona, changeRate);
    b = adjust(b, bMona, changeRate);

    color c;
    c = color(r,g,b);
    workingImage.pixels[i] = c;
  }
  diff = calculateDifference(workingImage, mona);
  workingImage.updatePixels();
  if (frameCount % 2 == 0) {
    image(workingImage, 50, 50);
  }  
  else {
    image(mona, 50, 50);
  }
  //  images.set(0,workingImage);
  println(frameCount + " has a difference of " + diff);
}

void initializeImages() {
  for (int i = 0; i < population; i++) {
    PImage temp = createImage(imageSize, imageSize, RGB);
    for(int j=0; j < temp.pixels.length; j++) {
      temp.pixels[j] = color(random(0,255),random(0,255), random(0,255));
    }
    images.add(temp);
  }
}



float adjust(float origColor, float targetColor, float changeRate) {
  float adjustedColor = 0.0;
  float diff = 0.0;
  diff = targetColor - origColor;
  adjustedColor = origColor + (diff * changeRate);
  return adjustedColor;
}

float calculateDifference(PImage img1, PImage img2) {
  float totalDiff = 0.0;
  if (img1.pixels.length != img2.pixels.length) {
    return -1.0;
  } 
  else {
    for (int i = 0; i < img1.pixels.length; i++) {

      float r1 = red(img1.pixels[i]);
      float g1 = green(img1.pixels[i]);
      float b1 = blue(img1.pixels[i]);
      float r2 = red(img2.pixels[i]);
      float g2 = green(img2.pixels[i]);
      float b2 = blue(img2.pixels[i]);
      totalDiff += abs(r1 - r2);
      totalDiff += abs(g1 - g2);
      totalDiff += abs(b1 - b2);
    }
    return totalDiff;
  }
}

