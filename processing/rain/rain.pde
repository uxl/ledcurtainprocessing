OPC opc;

// Purple Rain
// (138, 43, 226)
// (230, 230, 250) // background

Drop[] drops = new Drop[500];

void setup() {
  size(240, 600);
    opc = new OPC(this, "curtain.local", 7890);

 for(int i=0; i<24; i++) {
    opc.ledStrip(i * 60, 60, i * width / 24.0 + width / 48.0,
      height * 0.5, width / 24.0, PI * 0.5, false);
  }
  
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    drops[i].show();
  }
}