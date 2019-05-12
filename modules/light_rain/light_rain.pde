import java.util.ArrayList;

ArrayList<Drop> drops = new ArrayList<Drop>();

void setup() {
  size(640, 360);
  for (int i = 0; i < 100; i++) {
    drops.add(new Drop());
  }
}

void draw() {
  background(230, 230, 250);
  for (int i = 0; i < drops.size(); i++) {
    drops.get(i).fall();
    drops.get(i).show();
  }
}
