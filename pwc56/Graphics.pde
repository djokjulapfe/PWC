PImage[] invader_img;
PImage player_img;
PImage stars_img;

void loadGraphics() {
  invader_img = new PImage[4];
  for (int i = 0; i < invader_img.length; i++) {
    invader_img[i] = createInvadorGraphics(16);
  }
  player_img = createPlayerGraphics();
  stars_img = createStarsGraphics();
}

PImage createBulletGraphics(int c) {
  PImage ret = createImage(8, 8, ARGB);
  ret.loadPixels();
  for(int k = 0; k < 50; k++) {
    int r = (int) (randomGaussian()*2);
    if(abs(r) > 7) r = 0;
    ret.pixels[abs(r)*8 + 4] = color(brightness(ret.pixels[abs(r)*8 + 4]) + 50);
    r = (int) (randomGaussian()*2);
    if(abs(r) > 7) r = 0;
    ret.pixels[abs(r)*8 + 3] = color(brightness(ret.pixels[abs(r)*8 + 3]) + 50);
  }
  ret.updatePixels();
  for (int i = 0; i < ret.pixels.length; i++) {
    ret.pixels[i] = color(c, 255, 255, brightness(ret.pixels[i]));
  }
  return ret;
}

PImage createPlayerGraphics() {
  PImage ret = createImage(8, 8, ARGB);
  ret.loadPixels();
  for(int i = 0; i < 8; i++) {
    ret.pixels[7*8+i] = color(255 - 10*i);
    ret.pixels[6*8+i] = color(255 - 10*i);
  }
  for(int i = 0; i < 3; i++) {
    ret.pixels[i*16 + 2 + 8] = color(192 + 10*1);
    ret.pixels[i*16 + 3 + 8] = color(192 - 10*1);
    ret.pixels[i*16 + 4 + 8] = color(192 - 10*4);
    ret.pixels[i*16 + 5 + 8] = color(192 - 10*7);
    ret.pixels[i*16 + 3] = color(255);
    ret.pixels[i*16 + 4] = color(255 - 10*7);
  }
  ret.updatePixels();
  return ret;
}

PImage createInvadorGraphics(int kmax) {
  int d = 8;
  PImage ret = createImage(d, d, ARGB);
  ret.loadPixels();
  for (int i = 0; i < ret.pixels.length; i++) ret.pixels[i] = color(0, 0);
  for (int k = 0; k < kmax; k++) {
    int r = (int)random(ret.pixels.length);
    while (ret.pixels[r] == color(255)) r = (int)random(ret.pixels.length);
    ret.pixels[r] = color(255);
    ret.pixels[r/d*d + d - 1 - r%d] = color(255);
  }
  ret.updatePixels();
  colorMode(HSB);
  int hue = (int) random(255);
  for (int i = 0; i < ret.pixels.length; i++) if (ret.pixels[i] == color(255)) ret.pixels[i] = color(hue, 255 - random(50), 255 - random(50));
  return ret;
}

PImage createHearth() {
  PImage ret = createImage(5, 4, ARGB);
  color red = color(0, 255, 255);
  ret.loadPixels();
  ret.pixels[0] = redc();
  ret.pixels[1] = redc();
  ret.pixels[3] = redc();
  ret.pixels[4] = redc();
  ret.pixels[5] = redc();
  ret.pixels[6] = redc();
  ret.pixels[7] = redc();
  ret.pixels[8] = redc();
  ret.pixels[9] = redc();
  ret.pixels[11] = redc();
  ret.pixels[12] = redc();
  ret.pixels[13] = redc();
  ret.pixels[17] = redc();
  ret.updatePixels();
  return ret;
}

PImage createStarsGraphics() {
  PImage ret = createImage(width/scale, height/scale, ARGB);
  ret.loadPixels();
  for(int i = 0; i < 100; i++) {
    ret.pixels[(int)random(ret.pixels.length)] = color(255);
  }
  ret.updatePixels();
  return ret;
}

color redc() {
  return color(0, 255 - random(50), 255 - random(50));
}