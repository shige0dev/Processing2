int count = 0;
ArrayList<Integer> al;

void setup(){
 al = new ArrayList();
}

void draw(){
  println(al);
}

void keyPressed(KeyEvent e){
  if(al.indexOf(int(key)) == -1){ 
    al.add(int(key));
  }
}

void keyReleased(KeyEvent e){
    al.remove(al.indexOf(int(key)));
}
