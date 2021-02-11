PShader shader;

void setup() {
  size(640, 360, OPENGL);                              //Open_GL対応した横640px * 縦360pxのカンバスを生成
  noStroke();                                            
}

void draw() {
 
  shader = loadShader("shader.frag");             //shader.frag（シェーダーファイル）を読み込む。
  shader.set("resolution", float(width), float(height));
  shader.set("mouse", float(mouseX), float(mouseY));
  shader.set("time", millis() / 10000.0);                    //shaderの速度
  shader(shader);
  rect(0,0,width,height);                                 
}
