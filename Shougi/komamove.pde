class komamove {
  int k, x1, y1, x2, y2 ;
  komamove(int _k, int _x1, int _y1, int _x2, int _y2) {
    k=_k;
    x1=_x1;
    x2=_x2;
    y1=_y1;
    y2=_y2;
  }
}

void komaReset() {
  //盤面リセット
  for (int x=0; x<7; x=x+1)
  {
    for (int y=0; y<7; y=y+1)
    {
      koma[x][y]=0;
      flag[x][y]=0;
      if (x==0||x==6||y==0||y==6)
      {
        flag[x][y]=-1;
      }
    }
  }
  //持ち駒クリア
  for (int x=0; x<2; x++)
  {
    for (int y=0; y<5; y++)
    {
      motigoma1[x][y]=0;
      motigoma2[x][y]=0;
    }
  }

  // 初期配列
  flag[1][4]=1;
  flag[2][5]=3;
  flag[3][5]=2;
  flag[4][5]=4;
  flag[5][5]=5;
  flag[1][5]=6;

  flag[5][2]=11;
  flag[4][1]=13;
  flag[3][1]=12;
  flag[2][1]=14;
  flag[1][1]=15;
  flag[5][1]=16;
}

void clickMyKoma() {
  makeKOMAmovelist();//動かせるコマのリストをこのタイミングで作っておく。
  for (int x=0; x<7; x=x+1) {
    for (int y=0; y<7; y=y+1) {
      if (mouseX>(x-1)*160+100&&mouseX<(x-1)*160+260&&mouseY>(y-1)*160+100&&mouseY<(y-1)*160+260) {
        if (flag[x][y]<11&&flag[x][y]>0) {//自分の駒をクリックした場合
          komaflag=flag[x][y];//クリックした駒を指す駒を指定する
          komaXflag=x;
          komaYflag=y;
          komacatchflag=0;
          phase=PHASE.Player1Sasu;
        }
      }
    }
  }
}

void clickMyKomadai() {
  makeKOMAmovelist();//動かせるコマのリストをこのタイミングで作っておく。
  //指し手が完了するまで、motigoma1はいじらないほうがいいのでは？（→対応した）
  if (mouseX>1030&&mouseX<1130&&mouseY>630&&mouseY<730&&komacatchflag==0)//歩を使う
  {
    if (motigoma1[0][0]==1) {
      motikomaflag=1;
      komaXflag=0;
      komaYflag=0;
      komacatchflag=1;
      phase=PHASE.Player1Sasu;
    }
  }
  if (mouseX>1030&&mouseX<1130&&mouseY>790&&mouseY<890&&komacatchflag==0)//歩を使う
  {
    if (motigoma1[1][0]==1) {
      motikomaflag=1;
      komaXflag=1;
      komaYflag=0;
      komacatchflag=1;
      phase=PHASE.Player1Sasu;
    }
  }
  if (mouseX>1130&&mouseX<1230&&mouseY>630&&mouseY<730&&komacatchflag==0)//銀を使う
  {
    if (motigoma1[0][1]==1) {
      motikomaflag=2;
      komaXflag=0;
      komaYflag=1;
      komacatchflag=1;
      phase=PHASE.Player1Sasu;
    }
  }
  if (mouseX>1130&&mouseX<1230&&mouseY>790&&mouseY<890&&komacatchflag==0)//銀を使う
  {
    if (motigoma1[1][1]==1) {
      motikomaflag=2;
      komaXflag=1;
      komaYflag=1;
      komacatchflag=1;
      phase=PHASE.Player1Sasu;
    }
  }
  if (mouseX>1230&&mouseX<1330&&mouseY>630&&mouseY<730&&komacatchflag==0)//金を使う
  {
    if (motigoma1[0][2]==1) {
      motikomaflag=3;
      komaXflag=0;
      komaYflag=2;
      komacatchflag=1;
      phase=PHASE.Player1Sasu;
    }
  }
  if (mouseX>1230&&mouseX<1330&&mouseY>790&&mouseY<890&&komacatchflag==0)//金を使う
  {
    if (motigoma1[1][2]==1) {
      motikomaflag=3;
      komaXflag=1;
      komaYflag=2;
      komacatchflag=1;
      phase=PHASE.Player1Sasu;
    }
  }
  if (mouseX>1330&&mouseX<1430&&mouseY>630&&mouseY<730&&komacatchflag==0)//角を使う
  {
    if (motigoma1[0][3]==1) {
      motikomaflag=4;
      komaXflag=0;
      komaYflag=3;
      komacatchflag=1;
      phase=PHASE.Player1Sasu;
    }
  }
  if (mouseX>1330&&mouseX<1430&&mouseY>790&&mouseY<890&&komacatchflag==0)//角を使う
  {
    if (motigoma1[1][3]==1) {
      motikomaflag=4;
      komaXflag=1;
      komaYflag=3;
      komacatchflag=1;
      phase=PHASE.Player1Sasu;
    }
  }
  if (mouseX>1430&&mouseX<1530&&mouseY>630&&mouseY<730&&komacatchflag==0)//飛を使う
  {
    if (motigoma1[0][4]==1) {
      motikomaflag=5;
      komaXflag=0;
      komaYflag=4;
      komacatchflag=1;
      phase=PHASE.Player1Sasu;
    }
  }
  if (mouseX>1430&&mouseX<1530&&mouseY>790&&mouseY<890&&komacatchflag==0)//飛を使う                          　ここまで
  {
    if (motigoma1[1][4]==1) {
      motikomaflag=5;
      komaXflag=1;
      komaYflag=4;
      komacatchflag=1;
      phase=PHASE.Player1Sasu;
    }
  }
}

void clickHisKomadai() {//多分不要
  if (komaflag>=0) {//駒台から駒をつまむ
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
  }
}

ArrayList<komamove> komamovelist;
boolean makeKOMAmovelist()
{
  komamovelist=new ArrayList<komamove>();
  int tb=teban;//自分は0,相手は1
  for (int x=1; x<=5; x++) {
    for (int y=1; y<=5; y++) {
      if ((flag[x][y]<=10&&tb==0)||(flag[x][y]>10&&tb==1)) {                                                    
        for (int s=1; s<=5; s++) {
          for (int t=1; t<=5; t++) {//(x,y)から(s,t)へ駒を動かせるかどうか
            if (komacheck(flag[x][y], x, y, s, t)) {
              //println(flag[x][y], x, y, s, t);//相手がどれを指したか
              komamovelist.add(new komamove(flag[x][y], x, y, s, t));
            }
          }
        }
      }
    }
  }
  //駒台から打つ
  if (tb==1) {
    if (motigoma2[0][0]==1||motigoma2[1][0]==1) {//持ち駒歩1
      for (int x=1; x<=5; x++) {
        for (int y=1; y<=4; y++) {//歩は最上段に打てない
          if (flag[x][y]==0&&((6-x)==dice2||dice2==6||dice2musidekiru)&&compsengo==0) {
            if (flag[x][1]!=11&&flag[x][2]!=11&&flag[x][3]!=11&&flag[x][4]!=11&&flag[x][5]!=11) {//二歩対策
              komamovelist.add(new komamove(11, 0, 0, x, y));
            }
          }
        }
      }
      for (int x=1; x<=5; x++) {
        for (int y=1; y<=4; y++) {//1から4
          if (flag[x][y]==0&&(x==dice2||dice2==6||dice2musidekiru)&&compsengo==1) {
            if (flag[x][1]!=11&&flag[x][2]!=11&&flag[x][3]!=11&&flag[x][4]!=11&&flag[x][5]!=11) {//二歩対策
              komamovelist.add(new komamove(11, 0, 0, x, y));
            }
          }
        }
      }
    }
    if (motigoma2[0][1]==1||motigoma2[1][1]==1) {//持ち駒銀1
      for (int x=1; x<=5; x++) {
        for (int y=1; y<=5; y++) {
          if (flag[x][y]==0&&((6-x)==dice2||dice2==6||dice2musidekiru)&&compsengo==0) {
            komamovelist.add(new komamove(12, 0, 0, x, y));
          } else if (flag[x][y]==0&&(x==dice2||dice2==6||dice2musidekiru)&&compsengo==1) {
            komamovelist.add(new komamove(12, 0, 0, x, y));
          }
        }
      }
    }
    if (motigoma2[0][2]==1||motigoma2[1][2]==1) {//持ち駒金1
      for (int x=1; x<=5; x++) {
        for (int y=1; y<=5; y++) {
          if (flag[x][y]==0&&((6-x)==dice2||dice2==6||dice2musidekiru)&&compsengo==0) {
            komamovelist.add(new komamove(13, 0, 0, x, y));
          } else if (flag[x][y]==0&&(x==dice2||dice2==6||dice2musidekiru)&&compsengo==1) {
            komamovelist.add(new komamove(13, 0, 0, x, y));
          }
        }
      }
    }
    if (motigoma2[0][3]==1||motigoma2[1][3]==1) {//持ち駒角1
      for (int x=1; x<=5; x++) {
        for (int y=1; y<=5; y++) {
          if (flag[x][y]==0&&((6-x)==dice2||dice2==6||dice2musidekiru)&&compsengo==0) {
            komamovelist.add(new komamove(14, 0, 0, x, y));
          } else if (flag[x][y]==0&&(x==dice2||dice2==6||dice2musidekiru)&&compsengo==1) {
            komamovelist.add(new komamove(14, 0, 0, x, y));
          }
        }
      }
    }
    if (motigoma2[0][4]==1||motigoma2[1][4]==1) {//持ち駒飛1
      for (int x=1; x<=5; x++) {
        for (int y=1; y<=5; y++) {
          if (flag[x][y]==0&&((6-x)==dice2||dice2==6||dice2musidekiru)&&compsengo==0) {
            komamovelist.add(new komamove(15, 0, 0, x, y));
          } else if (flag[x][y]==0&&(x==dice2||dice2==6||dice2musidekiru)&&compsengo==1) {
            komamovelist.add(new komamove(15, 0, 0, x, y));
          }
        }
      }
    }
  } else if (tb==0) {
    if (motigoma1[0][0]==1||motigoma1[1][0]==1) {//持ち駒歩1
      for (int x=1; x<=5; x++) {
        for (int y=2; y<=5; y++) {//歩は最上段に打てない
          if (flag[x][y]==0&&((6-x)==dice1||dice1==6||dice1musidekiru)&&compsengo==0) {
            if (flag[x][1]!=1&&flag[x][2]!=1&&flag[x][3]!=1&&flag[x][4]!=1&&flag[x][5]!=1) {//二歩対策
              komamovelist.add(new komamove(1, 0, 0, x, y));
            }
          }
        }
      }
      for (int x=1; x<=5; x++) {
        for (int y=2; y<=5; y++) {// 2から5
          if (flag[x][y]==0&&(x==dice1||dice1==6||dice1musidekiru)&&compsengo==1) {
            if (flag[x][1]!=1&&flag[x][2]!=1&&flag[x][3]!=1&&flag[x][4]!=1&&flag[x][5]!=1) {//二歩対策
              komamovelist.add(new komamove(1, 0, 0, x, y));
            }
          }
        }
      }
    }
    if (motigoma1[0][1]==1||motigoma1[1][1]==1) {//持ち駒銀1
      for (int x=1; x<=5; x++) {
        for (int y=1; y<=5; y++) {
          if (flag[x][y]==0&&((6-x)==dice1||dice1==6||dice1musidekiru)&&compsengo==0) {
            komamovelist.add(new komamove(2, 0, 0, x, y));
          } else if (flag[x][y]==0&&(x==dice1||dice1==6||dice1musidekiru)&&compsengo==1) {
            komamovelist.add(new komamove(2, 0, 0, x, y));
          }
        }
      }
    }
    if (motigoma1[0][2]==1||motigoma1[1][2]==1) {//持ち駒金1
      for (int x=1; x<=5; x++) {
        for (int y=1; y<=5; y++) {
          if (flag[x][y]==0&&((6-x)==dice1||dice1==6||dice1musidekiru)&&compsengo==0) {
            komamovelist.add(new komamove(3, 0, 0, x, y));
          } else if (flag[x][y]==0&&(x==dice1||dice1==6||dice1musidekiru)&&compsengo==1) {
            komamovelist.add(new komamove(3, 0, 0, x, y));
          }
        }
      }
    }
    if (motigoma1[0][3]==1||motigoma1[1][3]==1) {//持ち駒角1
      for (int x=1; x<=5; x++) {
        for (int y=1; y<=5; y++) {
          if (flag[x][y]==0&&((6-x)==dice1||dice1==6||dice1musidekiru)&&compsengo==0) {
            komamovelist.add(new komamove(4, 0, 0, x, y));
          } else if (flag[x][y]==0&&(x==dice1||dice1==6||dice1musidekiru)&&compsengo==1) {
            komamovelist.add(new komamove(4, 0, 0, x, y));
          }
        }
      }
    }
    if (motigoma1[0][4]==1||motigoma1[1][4]==1) {//持ち駒飛1
      for (int x=1; x<=5; x++) {
        for (int y=1; y<=5; y++) {
          if (flag[x][y]==0&&((6-x)==dice1||dice1==6||dice1musidekiru)&&compsengo==0) {
            komamovelist.add(new komamove(5, 0, 0, x, y));
          } else if (flag[x][y]==0&&(x==dice1||dice1==6||dice1musidekiru)&&compsengo==1) {
            komamovelist.add(new komamove(5, 0, 0, x, y));
          }
        }
      }
    }
  }

  for (int i=0; i<komamovelist.size(); i++ )
  {
    komamove move=komamovelist.get(i);
    println(move.k, move.x1, move.y1, move.x2, move.y2, dice2);
  }
  return false;
}

void clickMyKomaUtu() {
  for (int x=0; x<7; x++) {// 1~5でよいのでは？
    for (int y=0; y<7; y++) {// 1~5でよいのでは？
      if (mouseX>(x-1)*160+100&&mouseX<(x-1)*160+260&&mouseY>(y-1)*160+100&&mouseY<(y-1)*160+260) {
        //合法手かどうかを判定する。
        //makeKOMAmovelist();//動かせるコマのリストをこのタイミングで作っておく。
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
          if (y>0) {//謎のフラグ条件（？？？）
            //このタイミングでコマ台を空にするという考え方もある。（→対応しました）
            motigoma1[komaXflag][komaYflag]=0;
            //ここで打つ
            flag[x][y]=motikomaflag;
            println("人は"+hitokihuoutput(0, 0, x, y, motikomaflag));
            kihu.add(hitokihuoutput(0, 0, x, y, motikomaflag));

            motikomaflag=0;
            komaflag=-1;
            komacatchflag=0;
            komaXflag=-1;
            komaYflag=-1;
            teban=1-teban;
            phase=PHASE.Player2Start;
            return;
          }
        } else {
          komaflag=0;
          //gohoshuでなかったら駒台に駒を戻す
          komacatchflag=0;
          motikomaflag=0;
          komaXflag=-1;
          komaYflag=-1;
          phase=PHASE.Player1Tenitoru;
          return;
        }
      }
    }
  }
}

void clickMyKomaSasu() {
  if (komaflag>0) {//盤上の駒をさす場合
    for (int x=0; x<7; x++) {
      for (int y=0; y<7; y++) {
        if (mouseX>(x-1)*160+100&&mouseX<(x-1)*160+260&&mouseY>(y-1)*160+100&&mouseY<(y-1)*160+260) {
          komaNariX=x;//これは何？
          komaNariY=y;
          //動かせるかチェック
          //println("人は"+komaflag, komaXflag, komaYflag, x, y);
          //println("komacheck=", komacheck(komaflag, komaXflag, komaYflag, x, y));
          //println("teban=", teban);
          if (komacheck(komaflag, komaXflag, komaYflag, x, y)==false)
          {//不正な動きならばやり直す。
            komaflag=0;//クリックやり直し待ち
            komaXflag=-1;
            komaYflag=-1;
            phase=PHASE.Player1Tenitoru;
            return;
          }
          //駒を持ち上げる
          flag[komaXflag][komaYflag]=0;
          //相手の駒をとる
          //if (teban==1) {//これはない
          //  enemykomamove(x, y);//これはない
          //} else if (teban==0)//ここ?
          //{
          komaToru(x, y);
          //}
          //ここで指す
          flag[x][y]=komaflag;

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
          println("人は"+hitokihuoutput(komaXflag, komaYflag, x, y, komaflag));
          kihu.add(hitokihuoutput(komaXflag, komaYflag, x, y, komaflag));

          komaflag=-1;
          teban=1-teban; 
          phase=PHASE.Player2Start;
        }
      }
    }
  }
}

void komaToru(int x, int y) {
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