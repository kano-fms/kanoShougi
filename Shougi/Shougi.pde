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

  teban=0;//先手後手の入れ替え、０：プレーヤー１、１：プレーヤー２
  compsengo=teban;
  if(compsengo==0){
    phase = PHASE.Player1Start;
  }
  else {
    phase = PHASE.Player2Start;
  }
  // 棋譜初期化
  kihu= new ArrayList<String>();

  hishaX=new int[]{1, 0, -1, 0};
  hishaY=new int[]{0, 1, 0, -1};
  kakuX=new int[]{1, 1, -1, -1};
  kakuY=new int[]{1, -1, 1, -1};

  komaReset();//コマを初期配列にする
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
  if (syouriflag==1||syouriflag==2)
  {
    if (mouseX>600&&mouseX<850&&mouseY>650&&mouseY<750)//もう一度　押す
    {
      resetboard();
    }

    if (mouseX>850&&mouseX<1100&&mouseY>650&&mouseY<750)//止める　押す
    {
      exit();
    }
  }
  if (phase==PHASE.Player1Dice&&komaflag==-1) {
    if (mouseX>1150&&mouseX<1250&&mouseY>450&&mouseY<550)//自分サイコロを振る                          　ここから
    {
      dice1=(int)random(1, 7);
      if (ootekaketeru()==true) {
        dice1=6;
      }//王手かけられてたらdice1=6

      makeKOMAmovelist();
      if (komamovelist.size()==0) {
        dice1=6;
      }

      komaflag=0;
      phase = PHASE.Player1Strategy;
    }
  } else if (phase==PHASE.Player2Dice&&komaflag==-1) {
    if (mouseX>1350&&mouseX<1450&&mouseY>450&&mouseY<550)//相手サイコロを振る
    {
      dice2musidekiru=false;
      dice2=(int)random(1, 7);
      if (ootekakatteru()) {
        dice2musidekiru=true;
      }
      phase = PHASE.Player2Strategy;
    }
  } else if (komaflag==0&&phase==PHASE.Player1Tenitoru)
  {
    for (int x=0; x<7; x=x+1)
    {
      for (int y=0; y<7; y=y+1)
      {
        if (mouseX>(x-1)*160+100&&mouseX<(x-1)*160+260&&mouseY>(y-1)*160+100&&mouseY<(y-1)*160+260)
        {
          if (flag[x][y]<11&&flag[x][y]>0) {//自分の駒をクリックした場合
            //println(phase);
            komaflag=flag[x][y];//クリックした駒を指す駒を指定する
            //flag[x][y]=0;
            komaXflag=x;
            komaYflag=y;
            phase=PHASE.Player1Sasu;
          }
        }
      }
    }
    //}

    //else if (phase==PHASE.Player1Tenitoru&&komaflag>=0) {

    if (mouseX>1030&&mouseX<1130&&mouseY>630&&mouseY<730&&komacatchflag==0)//歩を使う
    {
      if (motigoma1[0][0]==1) {
        motikomaflag=1;
        motigoma1[0][0]=0;
        komacatchflag=1;
        phase=PHASE.Player1Sasu;
      }
    }
    if (mouseX>1030&&mouseX<1130&&mouseY>790&&mouseY<890&&komacatchflag==0)//歩を使う
    {
      if (motigoma1[1][0]==1) {
        motikomaflag=1;
        motigoma1[1][0]=0;
        komacatchflag=1;
        phase=PHASE.Player1Sasu;
      }
    }
    if (mouseX>1130&&mouseX<1230&&mouseY>630&&mouseY<730&&komacatchflag==0)//銀を使う
    {
      if (motigoma1[0][1]==1) {
        motikomaflag=2;
        motigoma1[0][1]=0;
        komacatchflag=1;
        phase=PHASE.Player1Sasu;
      }
    }
    if (mouseX>1130&&mouseX<1230&&mouseY>790&&mouseY<890&&komacatchflag==0)//銀を使う
    {
      if (motigoma1[1][1]==1) {
        motikomaflag=2;
        motigoma1[1][1]=0;
        komacatchflag=1;
        phase=PHASE.Player1Sasu;
      }
    }
    if (mouseX>1230&&mouseX<1330&&mouseY>630&&mouseY<730&&komacatchflag==0)//金を使う
    {
      if (motigoma1[0][2]==1) {
        motikomaflag=3;
        motigoma1[0][2]=0;
        komacatchflag=1;
        phase=PHASE.Player1Sasu;
      }
    }
    if (mouseX>1230&&mouseX<1330&&mouseY>790&&mouseY<890&&komacatchflag==0)//金を使う
    {
      if (motigoma1[1][2]==1) {
        motikomaflag=3;
        motigoma1[1][2]=0;
        komacatchflag=1;
        phase=PHASE.Player1Sasu;
      }
    }
    if (mouseX>1330&&mouseX<1430&&mouseY>630&&mouseY<730&&komacatchflag==0)//角を使う
    {
      if (motigoma1[0][3]==1) {
        motikomaflag=4;
        motigoma1[0][3]=0;
        komacatchflag=1;
        phase=PHASE.Player1Sasu;
      }
    }
    if (mouseX>1330&&mouseX<1430&&mouseY>790&&mouseY<890&&komacatchflag==0)//角を使う
    {
      if (motigoma1[1][3]==1) {
        motikomaflag=4;
        motigoma1[1][3]=0;
        komacatchflag=1;
        phase=PHASE.Player1Sasu;
      }
    }
    if (mouseX>1430&&mouseX<1530&&mouseY>630&&mouseY<730&&komacatchflag==0)//飛を使う
    {
      if (motigoma1[0][4]==1) {
        motikomaflag=5;
        motigoma1[0][4]=0;
        komacatchflag=1;
        phase=PHASE.Player1Sasu;
      }
    }
    if (mouseX>1430&&mouseX<1530&&mouseY>790&&mouseY<890&&komacatchflag==0)//飛を使う                          　ここまで
    {
      if (motigoma1[1][4]==1) {
        motikomaflag=5;
        motigoma1[1][4]=0;
        komacatchflag=1;
        phase=PHASE.Player1Sasu;
      }
    }
  } else if (phase==PHASE.Player2Tenitoru&&komaflag>=0) {//駒台から駒をつまむ

    if (mouseX>1030&&mouseX<1130&&mouseY>270&&mouseY<370)//歩を使われる
    {
      motikomaflag=11;
      motigoma2[0][0]=0;
      komacatchflag=1;
    }
    if (mouseX>1030&&mouseX<1130&&mouseY>110&&mouseY<210)//歩を使われる
    {
      motikomaflag=11;
      motigoma2[1][0]=0;
      komacatchflag=1;
    }
    if (mouseX>1130&&mouseX<1230&&mouseY>270&&mouseY<370)//銀を使われる
    {
      motikomaflag=12;
      motigoma2[0][1]=0;
      komacatchflag=1;
    }
    if (mouseX>1130&&mouseX<1230&&mouseY>110&&mouseY<210)//銀を使われる
    {
      motikomaflag=12;
      motigoma2[1][1]=0;
      komacatchflag=1;
    }
    if (mouseX>1230&&mouseX<1330&&mouseY>270&&mouseY<370)//金を使われる
    {
      motikomaflag=13;
      motigoma2[0][2]=0;
      komacatchflag=1;
    }
    if (mouseX>1230&&mouseX<1330&&mouseY>110&&mouseY<210)//金を使われる
    {
      motikomaflag=13;
      motigoma2[1][2]=0;
      komacatchflag=1;
    }
    if (mouseX>1330&&mouseX<1430&&mouseY>270&&mouseY<370)//角を使われる
    {
      motikomaflag=14;
      motigoma2[0][3]=0;
      komacatchflag=1;
    }
    if (mouseX>1330&&mouseX<1430&&mouseY>110&&mouseY<210)//角を使われる
    {
      motikomaflag=14;
      motigoma2[1][3]=0;
      komacatchflag=1;
    }
    if (mouseX>1430&&mouseX<1530&&mouseY>270&&mouseY<370)//飛を使われる
    {
      motikomaflag=15;
      motigoma2[0][4]=0;
      komacatchflag=1;
    }
    if (mouseX>1430&&mouseX<1530&&mouseY>110&&mouseY<210)//飛を使われる
    {
      motikomaflag=15;
      motigoma2[1][4]=0;
      komacatchflag=1;
    }
  } else if (phase==PHASE.Player1Sasu&&komaflag>=0) {

    for (int x=0; x<7; x=x+1)
    {
      for (int y=0; y<7; y=y+1)
      {
        if (mouseX>(x-1)*160+100&&mouseX<(x-1)*160+260&&mouseY>(y-1)*160+100&&mouseY<(y-1)*160+260)
        {
          if (komacatchflag==1&&motikomaflag!=0) {//持ち駒を手に取った場合   
            makeKOMAmovelist();
            boolean gohoshu=false;
            for (int n=0; n<komamovelist.size(); n++) {
              komamove move=komamovelist.get(n);
              if (move.x1==0&&move.y1==0&&move.x2==x&&move.y2==y&&move.k==motikomaflag) {
                gohoshu=true;
              }
            }

            if (((motikomaflag==1&&flag[x][y]==0&&(6-x)==dice1&&y>0&&compsengo==0)||(motikomaflag!=1&&flag[x][y]==0&&(6-x)==dice1&&compsengo==0)
              ||(motikomaflag==1&&flag[x][y]==0&&dice1==6&&y>0&&compsengo==0)||(motikomaflag!=1&&flag[x][y]==0&&dice1==6&&compsengo==0)
              ||(motikomaflag==1&&flag[x][y]==0&&x==dice1&&(6-y)>0&&compsengo==1)||(motikomaflag!=1&&flag[x][y]==0&&x==dice1&&compsengo==1)
              
              ||(motikomaflag==1&&flag[x][y]==0&&dice1==6&&(6-y)>0&&compsengo==1)||(motikomaflag!=1&&flag[x][y]==0&&dice1==6&&compsengo==1))&&gohoshu) {                                                              
              if (y>0) {

                flag[x][y]=motikomaflag;
                println("人は"+hitokihuoutput(0, 0, x, y, motikomaflag));
                kihu.add(hitokihuoutput(0, 0, x, y, motikomaflag));

                motikomaflag=0;
                komaflag=-1;
                komacatchflag=0;
                teban=1-teban;
                phase=PHASE.Player2Start;
              }
            } else {
              komaflag=0;
              //gohoshuでなかったら駒台に駒を戻す
              phase=PHASE.Player1Tenitoru;
            }
          } else if (komaflag>0)//盤上の駒をさす場合
          {


            println(komaflag, komaXflag, komaYflag, x, y);
            komaNariX=x;
            komaNariY=y;

            //動かせるかチェック
            flag[komaXflag][komaYflag]=0;
            println(komacheck(komaflag, komaXflag, komaYflag, x, y));
            println(teban);
            if (komacheck(komaflag, komaXflag, komaYflag, x, y)==false)
            {
              flag[komaXflag][komaYflag]=komaflag;
              komaflag=0;//クリックやり直し待ち
              phase=PHASE.Player1Tenitoru;
            } else {//動かす

              //駒とる
              if (teban==1) {
                enemykomamove(x, y);
              } else if (teban==0)                                                    //ここ?
              {


                if (flag[x][y]==11||flag[x][y]==17)//歩とる
                {
                  if (motigoma1[0][0]==0)
                  {
                    motigoma1[0][0]=1;
                  } else if (motigoma1[0][0]==1)
                  {
                    motigoma1[1][0]=1;
                  }
                }
                if (flag[x][y]==12||flag[x][y]==20)//銀とる
                {
                  if (motigoma1[0][1]==0)
                  {
                    motigoma1[0][1]=1;
                  } else if (motigoma1[0][1]==1)
                  {
                    motigoma1[1][1]=1;
                  }
                }
                if (flag[x][y]==13)//金とる
                {
                  if (motigoma1[0][2]==0)
                  {
                    motigoma1[0][2]=1;
                  } else if (motigoma1[0][2]==1)
                  {
                    motigoma1[1][2]=1;
                  }
                }
                if (flag[x][y]==14||flag[x][y]==18)//角とる
                {
                  if (motigoma1[0][3]==0)
                  {
                    motigoma1[0][3]=1;
                  } else if (motigoma1[0][3]==1)
                  {
                    motigoma1[1][3]=1;
                  }
                }
                if (flag[x][y]==15||flag[x][y]==19)//飛とる
                {
                  if (motigoma1[0][4]==0)
                  {
                    motigoma1[0][4]=1;
                  } else if (motigoma1[0][4]==1)
                  {
                    motigoma1[1][4]=1;
                  }
                }
                if (flag[x][y]==16)//玉とる
                {
                  //自分勝ち
                  syouriflag=1;
                }
                //ここで刺す
                flag[x][y]=komaflag;
                if (komacatchflag==0) {

                  //駒成り
                  if (y==1||komaYflag==1) {
                    if (flag[x][y]==1)
                    {
                      flag[x][y]=7;//自分と
                    }
                    if (flag[x][y]==2)
                    {
                      phase=PHASE.Player1Narimachi;//flag[x][y]=10;//自分成銀
                    }
                    if (flag[x][y]==4)
                    {
                      flag[x][y]=8;//自分馬
                    }
                    if (flag[x][y]==5)
                    {
                      flag[x][y]=9;//自分龍
                    }
                  }
                }
                if (phase==PHASE.Player1Sasu) {
                  println("人は"+hitokihuoutput(komaXflag, komaYflag, x, y, komaflag));
                  kihu.add(hitokihuoutput(komaXflag, komaYflag, x, y, komaflag));

                  komaflag=-1;
                  teban=1-teban; 
                  phase=PHASE.Player2Start;
                  //手番変更
                }
              }

              //draw();
              //if (teban==1)
              //{
              //  makeKOMAmovelist();
              //  enemystrategy();

              //  komaflag=-1;
              //}
            }
          }
        }
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

void enemykomamove(int x, int y)
{

  if (flag[x][y]==1||flag[x][y]==7)//歩とられる
  {
    if (motigoma2[0][0]==0)
    {
      motigoma2[0][0]=1;
    } else if (motigoma2[0][0]==1)
    {
      motigoma2[1][0]=1;
    }
  }
  if (flag[x][y]==2||flag[x][y]==10)//銀とられる
  {
    if (motigoma2[0][1]==0)
    {
      motigoma2[0][1]=1;
    } else if (motigoma2[0][1]==1)
    {
      motigoma2[1][1]=1;
    }
  }
  if (flag[x][y]==3)//金とられる
  {
    if (motigoma2[0][2]==0)
    {
      motigoma2[0][2]=1;
    } else if (motigoma2[0][2]==1)
    {
      motigoma2[1][2]=1;
    }
  }
  if (flag[x][y]==4||flag[x][y]==8)//角とられる
  {
    if (motigoma2[0][3]==0)
    {
      motigoma2[0][3]=1;
    } else if (motigoma2[0][3]==1)
    {
      motigoma2[1][3]=1;
    }
  }
  if (flag[x][y]==5||flag[x][y]==9)//飛とられる
  {
    if (motigoma2[0][4]==0)
    {
      motigoma2[0][4]=1;
    } else if (motigoma2[0][4]==1)
    {
      motigoma2[1][4]=1;
    }
  }
  if (flag[x][y]==6)//王とられる
  {
    //相手勝ち
    syouriflag=2;
  }

  flag[x][y]=komaflag;
  komaflag=0;
  teban=1-teban;      
  //dice2=(int)random(1, 7);
  //手番変更
}

boolean komacheck(int k, int x1, int y1, int x2, int y2 ) {
  if (syouriflag==1)return false;//勝敗結果後
  if (syouriflag==2)return false;//勝敗結果後
  if (flag[x2][y2]==-1)return false;

  if (teban==0&&(6-x2)!=dice1&&dice1!=6&&compsengo==0)return false;                       //&&dice1musidekiru==false追加予定
  if (teban==1&&(6-x2)!=dice2&&dice2!=6&&dice2musidekiru==false&&compsengo==0)return false;

  if (teban==0&&x2!=dice1&&dice1!=6&&compsengo==1)return false;                       //&&dice1musidekiru==false追加予定
  if (teban==1&&x2!=dice2&&dice2!=6&&dice2musidekiru==false&&compsengo==1)return false;

  if (teban==0&&k>10)
  {
    return false;
  }
  if (teban==1&&k<=10)
  {
    return false;
  }
  if (teban==0&&flag[x2][y2]>0&&flag[x2][y2]<=10)
  {
    return false;
  }
  if (teban==1&&flag[x2][y2]>10)
  {
    return false;
  }

  if (k==1)//歩
  {
    if (x1==x2&&y2==y1-1)
    {
      return true;
    }
  }
  if (k==2)//銀
  {
    if (x1==x2&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1+1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1+1)
    {
      return true;
    }
  }
  if (k==7||k==3||k==10)//金
  {
    if (x1==x2&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1)
    {
      return true;
    }
    if (x2==x1&&y2==y1+1)
    {
      return true;
    }
  }
  if (k==4)//角
  {
    for (int n=1; n<7; n=n+1)
    {

      if (x2==n+x1&&y2==n+y1)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1+m][y1+m]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1-n&&y2==y1-n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1-m][y1-m]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1+n&&y2==y1-n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1+m][y1-m]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1-n&&y2==y1+n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1-m][y1+m]!=0)
          {
            return false;
          }
        }
        return true;
      }
    }
  }
  if (k==5)//飛
  {
    for (int n=1; n<7; n=n+1)
    {
      if (x2==x1+n&&y2==y1)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1+m][y1]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1-n&&y2==y1)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1-m][y1]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1&&y2==y1+n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1][y1+m]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1&&y2==y1-n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1][y1-m]!=0)
          {
            return false;
          }
        }
        return true;
      }
    }
  }
  if (k==6)//王
  {
    if (x1==x2&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1)
    {
      return true;
    }
    if (x2==x1&&y2==y1+1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1+1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1+1)
    {
      return true;
    }
  }
  if (k==8)//馬
  {
    for (int n=1; n<7; n=n+1)
    {
      if (x2==n+x1&&y2==n+y1)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1+m][y1+m]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1-n&&y2==y1-n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1-m][y1-m]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1+n&&y2==y1-n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1+m][y1-m]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1-n&&y2==y1+n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1-m][y1+m]!=0)
          {
            return false;
          }
        }
        return true;
      }
    }
    if (x1==x2&&y2==y1-1)
    {
      return true;
    }
    if (x1==x2&&y2==y1+1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1)
    {
      return true;
    }
  }
  if (k==9)//龍
  {
    for (int n=1; n<7; n=n+1)
    {
      if (x2==x1+n&&y2==y1)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1+m][y1]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1-n&&y2==y1)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1-m][y1]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1&&y2==y1+n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1][y1+m]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1&&y2==y1-n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1][y1-m]!=0)
          {
            return false;
          }
        }
        return true;
      }
    }
    if (x2==x1-1&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1+1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1+1)
    {
      return true;
    }
  }

  if (k==11)//相手歩
  {
    if (x1==x2&&y2==y1+1)
    {
      return true;
    }
  }
  if (k==12)//相手銀
  {
    if (x1==x2&&y2==y1+1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1+1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1+1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1-1)
    {
      return true;
    }
  }
  if (k==17||k==13||k==20)//相手金
  {
    if (x1==x2&&y2==y1+1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1+1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1+1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1)
    {
      return true;
    }
    if (x2==x1&&y2==y1-1)
    {
      return true;
    }
  }
  if (k==14)//相手角
  {
    for (int n=1; n<7; n=n+1)
    {

      if (x2==n+x1&&y2==n+y1)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1+m][y1+m]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1-n&&y2==y1-n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1-m][y1-m]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1+n&&y2==y1-n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1+m][y1-m]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1-n&&y2==y1+n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1-m][y1+m]!=0)
          {
            return false;
          }
        }
        return true;
      }
    }
  }
  if (k==15)//相手飛
  {
    for (int n=1; n<7; n=n+1)
    {
      if (x2==x1+n&&y2==y1)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1+m][y1]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1-n&&y2==y1)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1+m][y1]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1&&y2==y1+n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1][y1+m]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1&&y2==y1-n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1][y1-m]!=0)
          {
            return false;
          }
        }
        return true;
      }
    }
  }
  if (k==16)//相手王
  {
    if (x1==x2&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1)
    {
      return true;
    }
    if (x2==x1&&y2==y1+1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1+1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1+1)
    {
      return true;
    }
  }
  if (k==18)//相手馬
  {
    for (int n=1; n<7; n=n+1)
    {
      if (x2==n+x1&&y2==n+y1)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1+m][y1+m]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1-n&&y2==y1-n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1-m][y1-m]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1+n&&y2==y1-n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1+m][y1-m]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1-n&&y2==y1+n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1-m][y1+m]!=0)
          {
            return false;
          }
        }
        return true;
      }
    }
    if (x1==x2&&y2==y1-1)
    {
      return true;
    }
    if (x1==x2&&y2==y1+1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1)
    {
      return true;
    }
  }
  if (k==19)//相手龍
  {
    for (int n=1; n<7; n=n+1)
    {
      if (x2==x1+n&&y2==y1)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1+m][y1]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1-n&&y2==y1)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1-m][y1]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1&&y2==y1+n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1][y1+m]!=0)
          {
            return false;
          }
        }
        return true;
      }
      if (x2==x1&&y2==y1-n)
      {
        for (int m=1; m<n; m++)
        {
          if (flag[x1][y1-m]!=0)
          {
            return false;
          }
        }
        return true;
      }
    }
    if (x2==x1-1&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1-1)
    {
      return true;
    }
    if (x2==x1-1&&y2==y1+1)
    {
      return true;
    }
    if (x2==x1+1&&y2==y1+1)
    {
      return true;
    }
  }

  return false;
}