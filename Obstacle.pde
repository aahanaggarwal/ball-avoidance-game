class Obstacle{
  PVector pos;
  PVector vel;
  Obstacle(){
    int chance=(int)(floor(random(4)));
    PVector dir;
    switch(chance){
      case 0: pos=new PVector(0, random(height));
        dir=new PVector(width, random(height));
        vel=dir.sub(pos);
        vel.setMag(random(minSpeed,maxSpeed));
        break;
      case 1: pos=new PVector(width, random(height));
        dir=new PVector(0, random(height));
        vel=dir.sub(pos);
        vel.setMag(random(minSpeed,maxSpeed));
        break;
      case 2: pos=new PVector(random(width), 0);
        dir=new PVector(random(width), height);
        vel=dir.sub(pos);
        vel.setMag(random(minSpeed,maxSpeed));
        break;
      case 3: pos=new PVector(random(width), height);
        dir=new PVector(random(width), 0);
        vel=dir.sub(pos);
        vel.setMag(random(minSpeed,maxSpeed));
        break;
    }
  }
  void update(){
    pos.add(vel);
  }
  void show(){
    fill(255,40,40);
    ellipse(pos.x, pos.y, 20,20);
  }
}