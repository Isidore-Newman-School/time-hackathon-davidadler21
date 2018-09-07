int s = second();  // Values from 0 - 59
int m = minute();  // Values from 0 - 59
int h = hour();    // Values from 0 - 23
int count;
int count2;
int rate;
int index = 0;
boolean death = true;
boolean displayRate = false;
boolean pulseTime = false;
PImage bookShelf;
PImage hourglass;
PImage clock;
PImage surgery; 
Clock shelfClock;

void setup () {
  size(500, 500);
  bookShelf = loadImage("Shelf.png");
  hourglass = loadImage("Hourglass.png");
  clock = loadImage("Clock.png");
  surgery = loadImage("Surgery.png");
  shelfClock = new Clock(290, 110);
}

void draw() {
  background(0, 155, 155);
  timeKeep();
  image(bookShelf, -75, 200, 700, 350);
  hourglasses();
  shelfClock.display();
  demon();
  pulsometer();
  heartRate();
}

void timeKeep() {
  s = second();
  m = minute();
  h = hour();
}

void hourglasses() {
  int[] time;
  time = new int[3];
  time[0] = h;
  time[1] = m;
  time[2] = s;
  float[] timeFactor;
  timeFactor = new float[3];
  timeFactor[0] = 0.6;
  timeFactor[1] = 0.25;
  timeFactor[2] = 0.25;
  for (int x = 0; x < 3; x++) {
    fill(255);
    noStroke();
    rect(125 + 95*x, 340 + timeFactor[x]*time[x], 35, 15 - timeFactor[x]*time[x]);
    rect(125 + 95*x, 377 - timeFactor[x]*time[x], 35, 5 + timeFactor[x]*time[x]);
    image(hourglass, 95*x +95, 310, 150, 110);
    rect(144 + 95*x, 355, 1, 23);
  }
}

void demon() {
  if (s == 30) {
    death = true;
  }
  while (death) {
    image(surgery, 0, 0, 500, 500);
    death = false;
  }
}

void mouseClicked() {
  if (pulseTime == false && mouseX > 50 && mouseX < 150 && mouseY > 200 && mouseY < 250) {
    pulseTime = true;
    displayRate = false;
  }
  else if (mouseX > 50 && mouseX < 150 && mouseY > 200 && mouseY < 250) {
    pulseTime = false;
    displayRate = true;
  }
}

void pulsometer() {
  fill(0);
  rect(50, 200, 100, 50);
  if (pulseTime == false) {
    fill(255);
    textSize(12);
    text("Start pulsometer \n(click again to \n      stop)", 50, 210);
    count = s;
  }
  else {
    if (s == 59) {
      pulseTime = false;
    }
    else {
      count2 = s - count;
      fill(255);
      text("        " + count2 + "\ncount to 30 \nheartbeats", 60, 210);
    }
  }
}

void heartRate() {
  int[] convert;
  convert = new int[33];
  convert[0] = 200;
  convert[1] = 180;
  convert[2] = 165;
  convert[3] = 150;
  convert[4] = 140;
  convert[5] = 130;
  convert[6] = 120;
  convert[7] = 112;
  convert[8] = 106;
  convert[9] = 100;
  convert[10] = 95;
  convert[11] = 90;
  convert[12] = 85;
  convert[13] = 82;
  convert[14] = 78;
  convert[15] = 75;
  convert[16] = 72;
  convert[17] = 69;
  convert[18] = 67;
  convert[19] = 64;
  convert[20] = 62;
  convert[21] = 60;
  convert[22] = 58;
  convert[23] = 56;
  convert[24] = 54;
  convert[25] = 53;
  convert[26] = 52;
  convert[27] = 50;
  convert[28] = 49;
  convert[29] = 47;
  convert[30] = 46;
  convert[31] = 45;
  convert[32] = 44;
  if (displayRate) {
    for (int x = 0; x < 32; x++) {
      if (count2 == 9 + x) {
        rate = convert[x];
      }
    }
  fill(0);
  text("Heartrate: " + rate + "\nbeats per minute", 170, 225);
  }
}
