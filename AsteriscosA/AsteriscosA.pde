
int n = 10;
float s;

float r1;
float r2;

void setup () {
  size(600, 600);
  smooth();

  s = width / n;
  
  r1 = s * 0.1;
  r2 = s * 0.4;
} 

void draw () {
  background(0);

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      drawTile(i, j);
    }
  }
}

void drawTile (int i, int j) {
  float x = (i * s) + (s * 0.5);
  float y = (j * s) + (s * 0.5);

  float incr = (TWO_PI / 10);
  for (float beta = 0; beta <= TWO_PI; beta += incr) {
    drawAngularLine(beta, x, y, r1, r2);
  }
}

void drawAngularLine (float angle, float cx, float cy, float r1, float r2) {
  stroke(255);

  beginShape();

  float x = 0, y = 0;
  for (float t = 0; t <= 1.0; t += 0.25) {
    float r = ((1.0 - t) * r1) + (t * r2);
    
    float freq = (0.01 * cx) + (0.02 * cy);

    float alpha = angle + oscByFreq(frameCount, freq, t * 0.2);

    x = (cos(alpha) * r) + cx;
    y = (sin(alpha) * r) + cy;

    vertex(x, y);

    if (t == 0.0) {
      fill(255);
      ellipse(x, y, 1, 1);
    }
  }

  noFill();
  endShape();

  fill(255);
  ellipse(x, y, 4, 4);
}

float oscByFreq (float t, float freq, float amp) {
  return sin(t * freq * (TWO_PI / 60)) * amp;
}
