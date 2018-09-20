OPC opc;
PImage dot1, dot2;

void setup()
{
  size(240, 600, P2D);
  frameRate(30);

  ellipseMode(CENTER);
  stroke(200, 255, 255, 255);
  smooth();
  num = 2;
  count = 0;
  paths = new pathfinder[num];
  for(int i = 0; i < num; i++) paths[i] = new pathfinder();

  // Connect to the local instance of fcserver. You can change this line to connect to another computer's fcserver
   // Connect to the local instance of fcserver. You can change this line to connect to another computer's fcserver
  opc = new OPC(this, "curtain.local", 7890);

 for(int i=0; i<24; i++) {
    opc.ledStrip(i * 60, 60, i * width / 24.0 + width / 48.0,
      height * 0.5, width / 24.0, PI * 0.5, false);
  }
}

float px, py;



  
  
  
 /////
pathfinder[] paths;
int num;
static int count;


void draw() {
   background(0);
  blendMode(ADD);
//  println(count);
//  println(paths.length);
  for (int i = 0; i < paths.length; i++) {
    PVector loc = paths[i].location;
    PVector lastLoc = paths[i].lastLocation;
    strokeWeight(paths[i].diameter);
    line(lastLoc.x, lastLoc.y, loc.x, loc.y);
    paths[i].update();
  }
}
void mousePressed() {
  background(0);
  count = 0;
  paths = new pathfinder[num];
  for(int i = 0; i < num; i++) paths[i] = new pathfinder();

}