OPC opc;
PImage dot1, dot2;

void setup()
{
  size(240, 600, P2D);
  frameRate(30);

  dot1 = loadImage("rainbow.png");

  // Connect to the local instance of fcserver. You can change this line to connect to another computer's fcserver
   // Connect to the local instance of fcserver. You can change this line to connect to another computer's fcserver
  opc = new OPC(this, "curtain.local", 7890);

 for(int i=0; i<24; i++) {
    opc.ledStrip(i * 60, 60, i * width / 24.0 + width / 48.0,
      height * 0.5, width / 24.0, PI * 0.5, false);
  }
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

  float dx = 0;
  float dy = 0;
  
  // Draw it centered at the mouse location
  image(dot1, 0, 0, dotSize, dotSize);
}