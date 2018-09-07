class Clock {
  
  int x, y;
  
  Clock(int x, int y) {
    this.x = x;
    this.y = y;
  }
  void display() {
    clockTime();
    clockQuestions();
  }
  
  void clockTime() {
    fill(0);
    image(clock, this.x, this.y, 200, 200);
    int[] time;
    time = new int[2];
    time[0] = s;
    time[1] = m;
    for (int x = 0; x < 2; x++) {
      pushMatrix();
      translate(this.x+84, this.y+88);
      rotate(radians(6*time[x]));
      rect(0, 0, 2, 40 + 10*x);
      popMatrix();
    }
  }
  
  void clockQuestions() {
    String[] speech = {"Why can't I move? \nWhy? Oh! Why?", "What's the worst \nthing about Canada? \nCanadoans!", "Did you know \nI engineered human \ncentipede?"};
    if (s < 45) {
      index = int(random(speech.length));
    }
    else {
      textSize(12);
      fill(255);
      rect(this.x-150, this.y-30, 150, 80);
      triangle(this.x-30, this.y+50, this.x-2, this.y+10, this.x+26, this.y+65);
      fill(0);
      text(speech[index], this.x-140, this.y-10);
    }
  }
}
