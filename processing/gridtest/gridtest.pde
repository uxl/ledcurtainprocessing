OPC opc;
PImage dot1, dot2;

void setup()
{
  size(240, 600, P2D);
  frameRate(30);

  dot1 = loadImage("greenDot.png");
  dot2 = loadImage("purpleDot.png");

  // Connect to the local instance of fcserver. You can change this line to connect to another computer's fcserver
   // Connect to the local instance of fcserver. You can change this line to connect to another computer's fcserver
  opc = new OPC(this, "curtain.local", 7890);

  opc.ledGrid(0, 60, 24, 30.0, 12.0, 2.0, 2.0, 3.14159, false);
  //index, stripLength, numStrips, x (center location x), (center location y), ledSpacing, stripSpacing, angle, zigzag
}

float px, py;

void draw()
{
  background(0);
  blendMode(ADD);
  
  // Smooth out the mouse location
  px += (mouseX - px) * 0.1;
  py += (mouseY - py) * 0.1;

  float a = millis() * 0.001;
  float r = py * 0.5;
  float dotSize = r * 4;  

  float dx = width/2 + cos(a) * r;
  float dy = height/2 + sin(a) * r;
  
  // Draw it centered at the mouse location
  image(dot1, dx - dotSize/2, dy - dotSize/2, dotSize, dotSize);

  // Another dot, mirrored around the center
  image(dot2, width - dx - dotSize/2, height - dy - dotSize/2, dotSize, dotSize);
}