class Particle {
  float x;
  float y;
  
  float vx;
  float vy;
  
  /**/
  float vxStart, vyStart;
  int diameter;
  int diameterStart = 12;
  /**/

  Particle() {
    x = width/2;
    y = height/2;
    float a = random(TWO_PI);
    float speed = random(1,2) * 2;
    vxStart = cos(a)*speed;
    vyStart = sin(a)*speed;
    
    /**/diameter = diameterStart;/**/
  }

  void display(/*PGraphics canvas*/) {
    /////////////canvas.beginDraw();
    noStroke();
    color c = movie.get(int(x),int(y));
    fill(c,25);
    ellipse(x, y, diameter, diameter);
    ////////////canvas.endDraw();
  }

  /**/
  float dSqr = 0;
  //float dvx2 = 0;
  //float dvy2 = 0;
  float dv = 0;
  /**/

  void move() {
    dSqr = sq(mouseX - x) + sq(mouseY - y);
    if(dSqr < 10000) {
      vx = vxStart;
      vy = vyStart;
      x = x + vx;//random(-5, 5);
      y = y + vy;//random(-5, 5);
      /*dv = 400/dSqr;
      constrain(dv, 0, 100);
      x = x + dv;
      y = y + dv;*/
      diameter = diameterStart;
    }
    else/**/
    {
       //vx = vxStart * 0.2;
       //vy = vyStart * 0.2;
       x = x + vx;
       y = y + vy;
       diameter = diameterStart / 5;
    }/**/
    
    if (y < 0) {
      y = height;
    } 

    if (y > height) {
      y = 0;
    }
    if (x < 0) {
      x = width;
    } 

    if (x > width) {
      x = 0;
    }
  }

}