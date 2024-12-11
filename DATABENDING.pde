import processing.video.*;
Capture cam;

void setup() {
  size(800, 600);
  cam = new Capture(this, 640, 480);
  cam.start();
}

void draw() {
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
    
    // Apply the color swapping effect
    for (int i = 0; i < cam.pixels.length; i++) {
      color c = cam.pixels[i];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      
      // Swap Red and Blue channels
      cam.pixels[i] = color(r, r, r);
    }
    
    cam.updatePixels();
  }
  image(cam, 0, 0, width, height);
}