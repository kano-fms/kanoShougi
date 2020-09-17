int [][] koma=new int [7][7];//盤面、コマの利きを調べる。
int [][] flag=new int [7][7];//盤面
int [][] motigoma1=new int[2][6];//プレーヤー１の持ち駒
int [][] motigoma2=new int[2][6];//プレーヤー２の持ち駒
int komaflag=-1;//指すために手にしたコマ
int motikomaflag=0;//駒台から手にしたコマ
int komacatchflag=0;//駒大の駒を打とうとしているかどうかのフラグ
int komaXflag=0;//コマを指すX座標
int komaYflag=0;//コマを指すY座標
int komaNariX;//
int komaNariY;//
int h1=0;//何だろう？
int teban=0;//0：手前側（人間）、1：向こう側（コンピュータ）
int compsengo=0;//0：コンピューターが後手、1：人が後手
int syouriflag=0;//勝負がついたかどうかのフラグ
int [] hishaX;//飛車の利きを調べるための配列
int [] hishaY;
int [] kakuX;//角の利きを調べるための配列
int [] kakuY;
int dice1=1;//プレーヤー１用のさいころ
int dice2=1;//プレーヤー２用のさいころ
boolean dice1musidekiru;//プレーヤー１がさいころの目を無視できる状況かどうか
boolean dice2musidekiru;//プレーヤー２がさいころの目を無視できる状況かどうか
boolean autodice=true;//自動でさいころを振るかどうか
int ownoute=0;//プレーヤー２が王手をかけているかどうか（？）
int player1kiki[][] =new int [7][7];//盤面、コマの利きを調べる。プレーヤー１用
int player2kiki[][] =new int [7][7];//盤面、コマの利きを調べる。プレーヤー２用
ArrayList<String> kihu;//棋譜を取るための配列
PrintWriter file;//棋譜を保存するためのファイル
agentHabu Habu;// エージェント第1号「はぶさん」

enum PHASE {
  Player1Start, 
    Player1Dice, 
    Player1Strategy, 
    Player1Tenitoru, 
    Player1Sasu, 
    Player1Narimachi, 
    Player2Start, 
    Player2Dice, 
    Player2Strategy, 
    Player2Tenitoru, 
    Player2Sasu
} 

float byou=millis();

PHASE phase = PHASE.Player1Start;

void setup()
{
  size(1700, 1000);
  //はぶさん
  Habu=new agentHabu();

  resetboard(1);//０：人が先手、１：コンピュータが先手

  // 配列の初期化
  hishaX=new int[]{1, 0, -1, 0};
  hishaY=new int[]{0, 1, 0, -1};
  kakuX=new int[]{1, 1, -1, -1};
  kakuY=new int[]{1, -1, 1, -1};
}

void keyPressed() {
  if (key=='t'||key=='T') {//棋譜保存
    kihuHozon();
  }

  if (phase==PHASE.Player1Dice) {//プレイヤー1がダイスを振る、
    //ダイスのオートモードと関係なくここは使える？
    shakeDice1();
  }

  if (phase==PHASE.Player2Dice) {//プレイヤー２がダイスを振る
    shakeDice2();
  }
}

void mousePressed()
{
  //新規ゲーム開始
  if (syouriflag==1||syouriflag==2) {
    newGameDialog();
  }
  if (phase==PHASE.Player1Dice) {
    if (komaflag==-1) {//これはどういうフラグか（？）
      shakeDice1Auto();
    }
  } else if (phase==PHASE.Player2Dice) {
    if (komaflag==-1) {//これはどういうフラグか（？）
      shakeDice2Auto();
    }
  } else if (phase==PHASE.Player1Tenitoru) {
    if (komaflag==0) {//これはどういうフラグか（？）
      clickMyKoma();
    }
    clickMyKomadai();//駒台から駒をつまむ
  } else if (phase==PHASE.Player2Tenitoru) {
    //多分不要
    //clickHisKomadai();
  } else if (phase==PHASE.Player1Sasu) {
    if (komaflag>=0) {
      if (komacatchflag==1&&motikomaflag!=0) {//持ち駒を手に取った場合   
        clickMyKomaUtu();
      } else {
        clickMyKomaSasu();
      }
    }
  } else if (phase==PHASE.Player1Narimachi) {
    if (mouseX<=1300&&mouseX>=1100&&mouseY<=600&&mouseY>=500) {                                                              //成り待ちのときのクリック処理 ダイアログのxとyの範囲
      flag[komaNariX][komaNariY]=10;//自分成銀

      komaflag=-1;
      teban=1-teban; 
      phase=PHASE.Player2Start;
      //手番変更
    } else if (mouseX<=1500&&mouseX>1300&&mouseY<=600&&mouseY>=500) { 

      komaflag=-1;
      teban=1-teban; 
      phase=PHASE.Player2Start;
      //手番変更
    }
  }
}