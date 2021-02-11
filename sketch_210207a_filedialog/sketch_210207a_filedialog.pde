//JavaのSwingを取り込む
import javax.swing.*;

//画像インスタンスを用意 
PImage pimage;

//選択ファイルを用意し
//ファイルを空にしておく
String getFile = null;

void setup() {
  //とりあえず表示画面を400角に設定 
  size(400, 400);
}

void draw() {
  //選択ファイル名が空でないとき
  if (getFile != null) {
    //ファイルを取り込む
    fileLoader();
  }
}

//マウスを押したら
void mousePressed() {
  //選択ファイル取得処理 
  getFile = getFileName();
}

//ファイルを取り込むファンクション 
void fileLoader() {
  //選択ファイルパスのドット以降の文字列を取得
  String ext = getFile.substring(getFile.lastIndexOf('.') + 1);
  //その文字列を小文字にする
  ext.toLowerCase();
  //文字列末尾がjpg,png,gif,tgaのいずれかであれば 
  if (ext.equals("jpg") || ext.equals("png") ||  ext.equals("gif") || ext.equals("tga")) {
    //選択ファイルパスの画像を取り込む
    pimage = loadImage(getFile);
    //イメージ表示 
    image(pimage, 0, 0, pimage.width, pimage.height);
  }
  //選択ファイルパスを空に戻す
  getFile = null;
}

String getFileName() {
  SwingUtilities.invokeLater(
  @[
  new Runnable() { 
    public void run() {
      try {
        JFileChooser fc = new JFileChooser(); 
        int returnVal = fc.showOpenDialog(null);
        if (returnVal == JFileChooser.APPROVE_OPTION) {
          File file = fc.getSelectedFile();
          getFile = file.getPath();
        }
      }

      catch (Exception e) {
        e.printStackTrace();
      }
    }
  } 
  );
  return getFile;
}
