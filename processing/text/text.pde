OPC opc;
PFont f;
PShader blur;

void setup()
{
  size(240, 600, P2D);

  // Horizontal blur, from the SepBlur Processing example
  blur = loadShader("blur.glsl");
  blur.set("blurSize", 50);
  blur.set("sigma", 8.0f);
  blur.set("horizontalPass", 1);

  // Connect to the local instance of fcserver. You can change this line to connect to another computer's fcserver
  opc = new OPC(this, "curtain.local", 7890);

 for(int i=0; i<24; i++) {
    opc.ledStrip(i * 60, 60, i * width / 24.0 + width / 48.0,
      height * 0.5, width / 24.0, PI * 0.5, false);
  }
  
  // Create the font
  f = createFont("Futura", 200);
  textFont(f);
}

void scrollMessage(String s, float speed)
{
  int x = int( width + (millis() * -speed) % (textWidth(s) + width+200) );
  text(s, x, 170);  //s, x, y (offset from top)
}

void draw()
{
  background(0);
  scale(1.5,1);
  
  fill(57, 182, 231);
  scrollMessage("Cantina", 0.4); //speed
  
  filter(blur);
}