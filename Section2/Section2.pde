int levels,old;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 0;
  old=1;
}

/*Create Pascal's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/
void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
  while (levels>0){//base case
fill(255);
    triangle((v1x+v2x)/2, (v1y+v2y)/2, (v1x+v3x)/2, (v1y+v3y)/2, (v2x+v3x)/2, (v2y+v3y)/2);
    levels--;
    if (levels != 0) {
      gasket(levels, v1x, v1y, (v1x+v2x)/2, (v1y+v2y)/2, (v1x+v3x)/2, (v1y+v3y)/2);
      gasket(levels, v2x, v2y, (v1x+v2x)/2, (v1y+v2y)/2, (v2x+v3x)/2, (v2y+v3y)/2);
      gasket(levels, v3x, v3y, (v2x+v3x)/2, (v2y+v3y)/2, (v1x+v3x)/2, (v1y+v3y)/2);}
}
}
void draw() { 
  background(50);  
  
  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levels",20,20);
  triangle(0,height-10,width,height-10,width/2,10);
  fill(255,0,0);
  gasket(levels,0, height-10, width, height-10, width/2, 10);
/*line(width/2,height-120,width/2-60,height-10);
line(width/2-60,height-10,width/2+60,height-10);
line(width/2+60,height-10,width/2,height-120);
fill(0,255,0);
 koch(levels,width/2, height-120,width/2-60, height-10, width/2+60,height-10); 
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.*/
}

void mouseClicked(){ 
 levels ++;  
}

void keyPressed(){
 levels --; 
}
