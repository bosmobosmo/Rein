import processing.sound.*;
SoundFile thunder;

int lastTimeCheck;
int timeIntervalFlag = 4000;

void setup() {
  lastTimeCheck = millis();
  size(640, 360);
  background(0);
  noStroke();
  thunder = new SoundFile(this, "thunder.wav");
}

void draw() {
  fill(0,7);
  rect(0, 0, width, height);
  if( millis() > lastTimeCheck + timeIntervalFlag){
    lastTimeCheck = millis();
     fill(255);
     rect(0, 0, width, height);
     thunder.play();
  }
}
