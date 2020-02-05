void setup(){
  size(500,500,P3D);
  noLoop();
}

void draw(){
  Koch(6); 
}

final float R3O2 = (float)(Math.sqrt(3)/2);
final float O2 = 0.5;
final float length = 300;

public void Koch (int n){
  side(100,100,100,100+length,n);
  side(100,100+length,100+length*R3O2,100+length/2,n);
  side(100+length*R3O2,100+length/2,100,100,n);
}

private void side (float x1, float y1, float x2, float y2, int depth){
  if (depth == 0){line(x1,y1,x2,y2); 
  } else {
    float tx = (x2 - x1)/3; float ty = (y2 - y1)/3;
    float[] p1 = new float[2]; float[] p2 = new float[2]; float[] p3 = new float[2];
    p1[0] = x1 + tx; p1[1] = y1 + ty; p2[0] = x1 + 2*tx; p2[1] = y1 + 2*ty;
    p3[0] = O2*(p2[0]-p1[0]) + -1*R3O2*(p2[1]-p1[1]) + p1[0];
    p3[1] = R3O2*(p2[0]-p1[0]) + O2*(p2[1]-p1[1]) + p1[1];
    side(x1,y1,p1[0],p1[1],depth-1);
    side(p1[0],p1[1],p3[0],p3[1],depth-1);
    side(p3[0],p3[1],p2[0],p2[1],depth-1);
    side(p2[0],p2[1],x2,y2,depth-1);
  }
}
