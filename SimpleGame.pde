PVector mA=new PVector(300,300);
int minSpeed=5;
int maxSpeed=20;
int noOfObs=5;

boolean paused=false;
Obstacle[] obs;
int lifeSpan;
int permLifeSpan;
int score=0;
int hiscore=score;
PVector mousePos;
PVector pausePos;

void setup(){
  size(1600, 900);
  frameRate(60);
  noCursor();
  lifeSpan=floor((float)(Math.sqrt((width*width)+(height*height)))/((maxSpeed+minSpeed)/2));
  permLifeSpan=lifeSpan;
  obs=new Obstacle[100];
  for(int i=0; i<noOfObs; i++){
    obs[i]=new Obstacle();
  }
}
void draw(){
  background(51);
  noFill();
  stroke(2);
  rect((width/2)-mA.x, (height/2)-mA.y, mA.x*2, mA.y*2);
  noStroke();
  fill(255, 100);
  if(!paused){
    noCursor();
    fill(255);
    float mapXPos=map(mouseX, 0, width, (width/2)-mA.x, (width/2)+mA.x);
    float mapYPos=map(mouseY, 0, height, (height/2)-mA.y, (height/2)+mA.y);
    mousePos=new PVector(mapXPos, mapYPos);
    ellipse(mousePos.x, mousePos.y, 60, 60);
    for(int i=0; i<noOfObs; i++){
      obs[i].update();
      obs[i].show();
    }
    if(checkCollide(mousePos)){
      if(score>hiscore)
        hiscore=score;
      score=0;
      noOfObs=5;
      lifeSpan=permLifeSpan;
      newWave();
    }
    if(lifeSpan<=0){
      lifeSpan=permLifeSpan;
      score++;
      noOfObs++;
      newWave();
    }
    lifeSpan--;
  }
  else{
    fill(40,255,40);
    ellipse(pausePos.x, pausePos.y, 20,20);
    paused=true;
    cursor();
    strokeWeight(4);
    fill(255);
    ellipse(mousePos.x, mousePos.y, 60, 60);
    noFill();
    for(int i=0; i<noOfObs; i++){
      obs[i].show();
    }
  }
  fill(255,100);
  textSize(50);
  text("Score: "+score, 0,50);
  text("Highscore: "+hiscore, 0, 100);
}
void newWave(){
  for(int i=0; i<noOfObs; i++){
    obs[i]=new Obstacle();
  }
}
boolean checkCollide(PVector mousePos){
  for(int i=0; i<noOfObs; i++){
    if(dist(mousePos.x, mousePos.y, obs[i].pos.x, obs[i].pos.y)<=50)
      return true;
  }
  return false;
}

void keyPressed(){
  if(key==' '){
    if(!paused){
      fill(40,255,40);
      pausePos=new PVector(mouseX, mouseY);
      paused=true;
    }
    else{
      if(dist(mouseX, mouseY, pausePos.x, pausePos.y)<10)
        paused=false;
    }
  }
}