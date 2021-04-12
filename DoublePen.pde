float r1 = 200;
float r2 = 200;
float m1 = 50;
float m2 = 50;
float a1Dis = PI/2;
float a2Dis = PI/2;
float a1Vel = 0;
float a2Vel = 0;
float a1Acc, a2Acc, px2, py2;

float g = 1;


PGraphics canvas;
void setup()
{
  size(900, 900);
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
}

void draw()
{
  a1Acc = ((-g * (2 * m1 + m2) * sin(a1Dis)) - (m2 * g * sin(a1Dis - 2 * a2Dis)) - (2 * sin(a1Dis - a2Dis) * m2 * (a2Vel*a2Vel * r2 + a1Vel*a1Vel * r1 * cos(a1Dis - a2Dis)))) / (r1 * (2 * m1 + m2 - m2 * cos(2 * a1Dis - 2 * a2Dis)));
  a2Acc = (2 * sin(a1Dis - a2Dis) * (a1Vel*a1Vel * r1 * (m1 + m2) + g * (m1 + m2) * cos(a1Dis) + a2Vel*a2Vel * r2 * m2 * cos(a1Dis - a2Dis)))/ (r2 * (2 * m1 + m2 - m2 * cos(2 * a1Dis - 2 * a2Dis)));
  
  image(canvas, 0, 0);
  stroke(0);
  strokeWeight(2);
  float c = width/2;
  translate(c, c);
    
  float x1 = r1 * sin(a1Dis);
  float y1 = r1 * cos(a1Dis);
  line(0, 0, x1, y1);
  fill(0);
  ellipse(x1, y1, m1, m1);
  
  float x2 = r2 * sin(a2Dis) + x1;
  float y2 = r2 * cos(a2Dis) + y1;
  line(x1, y1, x2, y2);
  fill(0);
  ellipse(x2, y2, m2, m2);
  
  
  a1Vel += a1Acc;
  a2Vel += a2Acc;
  
  a1Dis += a1Vel;
  a2Dis += a2Vel;
  
  //a1Vel *= 0.999;
  //a2Vel *= 0.999;
  
  canvas.beginDraw();
  canvas.translate(c, c);
  canvas.strokeWeight(2);
  canvas.stroke(156, 31, 234);
  if(frameCount > 1)
  {
    canvas.line(px2, py2, x2, y2);
  }
  canvas.endDraw();
  px2 = x2;
  py2 = y2;
}
