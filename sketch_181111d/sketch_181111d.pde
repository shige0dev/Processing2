import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup()
{
size( 640, 480, P2D);
minim=new Minim(this);
player=minim.loadFile("sample.mp3");
player.loop();
}

void draw()
{
background(0);
fill(0,127,255,200);
float radiusL=player.left.level() * width;
float radiusR=player.right.level() * width;
ellipse(width/3, height/2,radiusL,radiusL);
ellipse(width/3*2,height/2,radiusR,radiusR);
}
