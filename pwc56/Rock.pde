class Rock {
  PImage img;
  int x;

  Rock(int x) {
    this.x = x;
    img = createImage(8, 8, ARGB);
    img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) img.pixels[i] = color(255 - random(100));
    img.updatePixels();
  }

  void draw() {
    image(img, x, height/scale - 3*8);
  }

  boolean removePixels() {
    img.loadPixels();
    int k = 0;
    for (int i = 0; i < img.pixels.length; i++) if(brightness(img.pixels[i]) > 155) k++;
    if (k < 5) return true;
    for (int i = 0; i < 5; i++) {
      int x = (int)random(8);
      int y = (int)random(8);
      while (brightness(img.pixels[x + y*8]) < 155) {
        x = (int)random(8);
        y = (int)random(8);
      }
      img.pixels[x + y*8] = color(0, 0);
    }
    img.updatePixels();
    return false;
  }
}