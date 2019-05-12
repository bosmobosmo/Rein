import java.util.ArrayList;
import processing.sound.*;
import controlP5.*;

ControlP5 cp5;
ArrayList<Drop> drops = new ArrayList<Drop>();
boolean playing = false;
boolean storm = false;
SoundFile rain;
SoundFile heavyRain;
SoundFile thunder;
String state;
Textarea rainState;
Textarea background;

int lastTimeCheck;
int timeIntervalFlag = 4000;
PImage img;

void setup() {
  size(960, 540);
  
  img = loadImage("forest.jpg");
  lastTimeCheck = millis();
  thunder = new SoundFile(this, "thunder.wav");
  rain = new SoundFile(this, "rain.wav");
  heavyRain = new SoundFile(this, "heavy-rain.wav");
  
  cp5 = new ControlP5(this);
  
  cp5.addTextarea("rain").setPosition(10, 25).setText("How heavy the rain is and is there any thunder").setFont(createFont("Roboto", 15)).setSize(500,50).setColor(0);
  cp5.addTextarea("bg").setPosition(10, 125).setText("Select backgrond").setFont(createFont("Roboto", 15)).setSize(500,50).setColor(0);
  
  cp5.addButton("Light").setPosition(10,75);
  cp5.addButton("Medium").setPosition(110, 75);
  cp5.addButton("Heavy").setPosition(210, 75);
  cp5.addButton("Thunder").setPosition(10, 100);
  cp5.addButton("NoThunder").setLabel("No Thunder").setPosition(110,100);
  cp5.addButton("Forest").setPosition(10, 175);
  cp5.addButton("Junction").setPosition(110, 175);
  cp5.addButton("City").setPosition(210, 175);
  cp5.addButton("Play").setPosition(10, 200);
}

void draw() {
  if (playing == true){
    cp5.remove(this);
    background(img);
    if (storm == true){
      if( millis() > lastTimeCheck + timeIntervalFlag){
      lastTimeCheck = millis();
       fill(255);
       rect(0, 0, width, height);
       thunder.play();
      }
    }
    for (int i = 0; i < drops.size(); i++) {
      drops.get(i).fall();
      drops.get(i).show();
    }
  }
}

public void Light() {
  state = "rain";
  drops.clear();
  for (int i = 0; i < 100; i++){
    drops.add(new Drop());
  }
  rain.rate(0.5);
  rain.amp(1.5);
}

public void Medium() {
  drops.clear();
  for (int i = 0; i < 500; i++){
    drops.add(new Drop());
  }
}

public void Heavy() {
  state = "storm";
  drops.clear();
  for (int i = 0; i < 1000; i++){
    drops.add(new Drop());
  }
}

public void Thunder(){
  storm = true;
}

public void NoThunder(){
  storm = false;
}

public void Forest(){
  img =loadImage("forest.jpg");
}

public void Junction(){
  img = loadImage("junction.jpg");
}

public void City(){
  img = loadImage("city.jpg");
}

public void Play(){
  playing = true;
  if (state == "rain") rain.loop();
  else if (state == "storm") heavyRain.loop();
}


class Drop {
  float x;
  float y;
  float z;
  float len;
  float yspeed;

  Drop() {
    x  = random(width);
    y  = random(-500, -50);
    z  = random(0, 20);
    len = map(z, 0, 20, 10, 20);
    yspeed  = map(z, 0, 20, 1, 20);
  }

  void fall() {
    y = y + yspeed;
    float grav = map(z, 0, 20, 0, 0.2);
    yspeed = yspeed + grav;

    if (y > height) {
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 4, 10);
    }
  }

  void show() {
    float thick = map(z, 0, 20, 1, 3);
    strokeWeight(thick);
    stroke(161,198,204);
    line(x, y, x, y+len);
  }
}
