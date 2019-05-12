import java.util.ArrayList;
import controlP5.*;

ControlP5 cp5;
ArrayList<Drop> drops = new ArrayList<Drop>();
boolean playing = false;

void setup() {
  size(960, 540);
  cp5 = new ControlP5(this);
  cp5.addButton("Light");
  cp5.addButton("Medium");
  cp5.addButton("Heavy");
  cp5.addButton("Play");
}

void draw() {
  if (playing == true){
    cp5.remove(this);
    background(230, 230, 250);
    for (int i = 0; i < drops.size(); i++) {
      drops.get(i).fall();
      drops.get(i).show();
    }
  }
}

public void Light() {
  drops.clear();
  for (int i = 0; i < 100; i++){
    drops.add(new Drop());
  }
}

public void Medium() {
  drops.clear();
  for (int i = 0; i < 500; i++){
    drops.add(new Drop());
  }
}

public void Heavy() {
  drops.clear();
  for (int i = 0; i < 1000; i++){
    drops.add(new Drop());
  }
}

public void Play(){
  playing = true;
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
