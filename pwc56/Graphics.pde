PImage[] invader_img;
PImage player_img;
PImage light_img;

void loadGraphics() {
  invader_img = new PImage[4];
  for (int i = 0; i < invader_img.length; i++) {
    invader_img[i] = createInvadorGraphics(16);
  }
  player_img = createPlayerGraphics();
  light_img = createLightGraphics();
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

PImage createLightGraphics() {
  PImage ret = createImage(32, 32, ARGB);
  ret.loadPixels();
  for (int i = 0; i < 5*32*32; i++) {
    int x = 16 + (int)(randomGaussian()*3);
    int y = 16 + (int)(randomGaussian()*3);
    while (x < 0 || x >= 32) x = (int)randomGaussian()*32;
    while (y < 0 || y >= 32) y = (int)randomGaussian()*32;
    int r = x + y * 32;
    ret.pixels[r] = color(random(255), 50, brightness(ret.pixels[r]) + 2);
  }
  for (int i = 0; i < ret.pixels.length; i++) {
    ret.pixels[i] = color(random(255), 50, 255, brightness(ret.pixels[i]));
  }
  ret.updatePixels();
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
  color c = color(random(255), 255, 255);
  for (int i = 0; i < ret.pixels.length; i++) if (ret.pixels[i] == color(255)) ret.pixels[i] = c;
  return ret;
}

PImage createHearth() {
  PImage ret = createImage(5, 4, ARGB);
  color red = color(0, 255, 255);
  ret.loadPixels();
  ret.pixels[0] = red;
  ret.pixels[1] = red;
  ret.pixels[3] = red;
  ret.pixels[4] = red;
  ret.pixels[5] = red;
  ret.pixels[6] = red;
  ret.pixels[7] = red;
  ret.pixels[8] = red;
  ret.pixels[9] = red;
  ret.pixels[11] = red;
  ret.pixels[12] = red;
  ret.pixels[13] = red;
  ret.pixels[17] = red;
  ret.updatePixels();
  return ret;
}