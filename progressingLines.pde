
boolean m1, m2, m3;

void setup() {
  size(300, 500);
  pixelDensity(displayDensity());
  strokeWeight(0.8);
  stroke(0, 75);
  background(255);
  noiseDetail(8, 0.2);
  m1 = true;
  m2 = false;
  m3 = false;
}

float len = 5;

float x1 = 0;
float x2 = len;
float y1 = 0;
float y2 = 0;

float swi1, swi2;

float deg = 0.0;
float fdeg;

void draw() {
  strokeWeight(noise((x1+x2)/2, (y1+y2)/2));
  if (m1) {
    stroke(0);
    if ((x1+x2)/2 < (width/2)) {
      line(x1, y1, x2, y2);
      float r = random(1, 3);
      y1 += r+deg;
      y2 += r*2+deg;
      deg += 0.005;
      if (min(y1, y2) > height) {
        y1 = 0;
        y2 = 0;
        x1 += len + 3 + 0.03*randomGaussian();
        x2 += len + 3 +  0.03*randomGaussian();
      }
    } else {
      fdeg = deg;
      m1 = !m1;
      m2 = !m2;
      x2 = x1;
      swi1 = x1;
      y1 = 0;
      y2 = len;
      deg = 0;
    }
  } else if (m2) {
    stroke(0);
    if (y2 < height/2) {
      line(x1, y1, x2, y2);
      float r = random(1, 3);
      x1 += r*2+deg;
      x2 += r*1+deg;
      deg += 0.005;
      if (min(x1, x2) > width) {
        x1 = swi1;
        x2 = swi1;
        y1 += len + 3 + 0.03*randomGaussian();
        y2 += len + 3 + 0.03*randomGaussian();
      }
    } else {
      m2 = !m2;
      m3 = !m3;
      x1 = swi1;
      x2 = swi1 + len;
      swi2 = y1;
      y2 = y1;
      deg = fdeg;
    }
  } else if (m3) {
    stroke(0);
    if (x1 > width) { 
      m3 = !m3;
      //m1 = !m1;
      x1 = 0;
      x2 = len;
      y1 = 0;
      y2 = 0;
    } else { 
      line(x1, y1, x2, y2);
      float r = random(1, 3);
      y1 += r*2+deg;
      y2 += r*1+deg;
      deg -= 0.009;
      if (min(y1, y2) > height) {
        y1 = swi2;
        y2 = swi2;
        x1 += len + 3 + 0.03*randomGaussian();
        x2 += len + 3 + 0.03*randomGaussian();
      }
    }
  }
}