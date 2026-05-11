int slitSize = 12;
int animFrames = 6;
PImage [] img = new PImage[animFrames];

void setup() {
  size(3508,2480);
  noSmooth();
for(int i = 0; i < animFrames; i++){
  img[i] = loadImage("face/frame" + i + ".png");
  }
}

void draw() {
  background(255);
  //drawSlit(slitSize, animFrames);
  //exportFrames(slitSize,animFrames);
  combineFrames(slitSize,animFrames);
}

void drawSlit (int slitSize, int animFrames){
  strokeWeight(slitSize *(animFrames - 1));
  for(int i = 0; i < width; i+=slitSize * animFrames){
     line (i,0,i, height); 
  }
  save("data/slit.png");
  exit();
  
  
}

void exportFrames(int slitSize, int animFrames){
  fill(0);
  noStroke();
  int circleNum = 12;
  push();
  translate(width/2, height/2);
  rotate(radians(frameCount * 360 /(circleNum * animFrames)));
  for(int i = 0; i < circleNum; i++){
    rotate(radians(360 / circleNum));
     circle(1000,0,200);
    
  }
  pop();
  
  save("data/frame" + (frameCount - 1)+ ".png");
  if (frameCount == animFrames){
    exit();
  }
}

void combineFrames(int slitSize, int animFrames){
  for(int y = 0; y < img[0].height; y++){
    for(int x = 0; x < img[0].width; x++){
       int frame = x / slitSize % animFrames;
       color c = img[frame]. get(x,y);
      stroke(c);
      point(x,y);
    }
  }
  save("face/out2.png");
  exit();
}
