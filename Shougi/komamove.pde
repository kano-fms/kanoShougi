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
            komamovelist.add(new komamove(11, 0, 0, x, y));
          }
        }
      }
      for (int x=1; x<=5; x++) {
        for (int y=2; y<=5; y++) {
          if (flag[x][y]==0&&(x==dice2||dice2==6||dice2musidekiru)&&compsengo==1) {
            komamovelist.add(new komamove(11, 0, 0, x, y));
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
  }
  
  else if (tb==0) {
    if (motigoma1[0][0]==1||motigoma1[1][0]==1) {//持ち駒歩1
      for (int x=1; x<=5; x++) {
        for (int y=2; y<=5; y++) {//歩は最上段に打てない
          if (flag[x][y]==0&&((6-x)==dice1||dice1==6||dice1musidekiru)&&compsengo==0) {
            komamovelist.add(new komamove(1, 0, 0, x, y));
          }
        }
      }
      for (int x=1; x<=5; x++) {
        for (int y=1; y<=4; y++) {
          if (flag[x][y]==0&&(x==dice1||dice1==6||dice1musidekiru)&&compsengo==1) {
            komamovelist.add(new komamove(1, 0, 0, x, y));
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
