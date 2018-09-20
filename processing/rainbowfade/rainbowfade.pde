OPC opc;
PImage dot1, dot2;

void setup()
{
  size(240, 600, P2D);
  frameRate(30);

  // Connect to the local instance of fcserver. You can change this line to connect to another computer's fcserver
   // Connect to the local instance of fcserver. You can change this line to connect to another computer's fcserver
  opc = new OPC(this, "curtain.local", 7890);

 for(int i=0; i<24; i++) {
    opc.ledStrip(i * 60, 60, i * width / 24.0 + width / 48.0,
      height * 0.5, width / 24.0, PI * 0.5, false);
  }
}

float px, py;

void draw() {

  // RAINBOW FADE!!!!!
  for (int i = 0; i < 64; i++) {
    float hue = (millis() * 0.01 + i * 2.0) % 100; 
    opc.setPixel(i, color(hue, 20, 80));
  }

  // When you haven't assigned any LEDs to pixels, you have to explicitly
  // write them to the server. Otherwise, this happens automatically after draw().
  opc.writePixels();

}
void mousePressed() {
  background(0);

}