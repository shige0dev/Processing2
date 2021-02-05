PShape watch,hour,minute,second;
PFont text;

void setup(){

size(400,400);
background(0);

watch = createShape(GROUP);

// Make two shapes
hour = createShape(LINE, 0, 0, 0, -50);
hour.setFill(color(255));
minute = createShape(LINE, 0, 0, 0, -100);
second = createShape(LINE, 0, 0, 0, -150);
text = createFont("test",100);

// Add the two "child" shapes to the parent group
watch.addChild(hour);
watch.addChild(minute);
watch.addChild(second);

// Draw the group
translate(width/2, height/2);
shape(watch);

//noLoop();
frameRate(1);
}

void draw(){
 background(0);
 translate(width/2, height/2);
 hour.rotate(radians( 0.00166666 ));
 minute.rotate(radians(.1));
 second.rotate(radians(6));
 shape(watch);
}