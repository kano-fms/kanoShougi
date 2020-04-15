int [][] koma=new int [7][7];
int [][] flag=new int [7][7];
int [][] motigoma1=new int[2][6];
int [][] motigoma2=new int[2][6];
int komaflag=-1;
int motikomaflag=0;
int komacatchflag=0;
int komaXflag=0;
int komaYflag=0;
int h1=0;
int teban=0;//0は自分、1は相手
int syouriflag=0;
int [] hishaX;
int [] hishaY;
int [] kakuX;
int [] kakuY;
int dice1=1;
int dice2=1;
boolean autodice=true;

enum PHASE{
  Player1Start,
  Player1Dice,
  Player1Strategy,
  Player1Move,
  Player1Procedure,
  Player2Start,
  Player2Dice,
  Player2Strategy,
  Player2Move,
  Player2Procedure
} 

PHASE phase = PHASE.Player1Start;

void setup()
{
  size(1700, 1000);

  hishaX=new int[]{1, 0, -1, 0};
  hishaY=new int[]{0, 1, 0, -1};
  kakuX=new int[]{1, 1, -1, -1};
  kakuY=new int[]{1, -1, 1, -1};

  koma_reset();
}

void draw()
{
  background(255);

  //将棋盤
  draw_shougiban();
  //動かせる位置
  draw_ugokaseru_ichi();
  //手番
  draw_teban();
  //持ち駒
  draw_mochigoma();  
  //サイコロ描画
  draw_dice();
  //駒描画
  draw_koma();
  //勝敗結果
  draw_gameover();

  //駒成り
  koma_nari();
}

void mousePressed()
{
  new_game();
  if (komaflag==-1) {
    throw_dice1();
  } else if (komaflag>=0) {
    //駒台のコマをクリックして手にとる
    take_koma_komadai();



    //盤をクリックするとき
    for (int x=0; x<7; x=x+1)
    {
      for (int y=0; y<7; y=y+1)
      {
        if (mouseX>(x-1)*160+100&&mouseX<(x-1)*160+260&&mouseY>(y-1)*160+100&&mouseY<(y-1)*160+260)
        {
          if (komacatchflag==1&&motikomaflag!=0) {         
            if (motikomaflag==1&&flag[x][y]==0&&x==dice1) {                                                              
              if (y>0) {
                flag[x][y]=motikomaflag;
                motikomaflag=0;
                komaflag=-1;
                komacatchflag=0;
                teban=1-teban;
                if (autodice==true) {
                  dice2=(int)random(1, 7);
                } else {
                  while (!keyPressed) {
                    if (key=='1') {
                      dice2=1;
                      break;
                    } else if (key=='2') {
                      dice2=2;
                      break;
                    } else if (key=='3') {
                      dice2=3;
                      break;
                    } else if (key=='4') {
                      dice2=4;
                      break;
                    } else if (key=='5') {
                      dice2=5;
                      break;
                    } else if (key=='6') {
                      dice2=6;
                      break;
                    } else {
                    }
                  }
                }
                makeKOMAmovelist();
                enemystrategy();
              }
            } else if (motikomaflag!=1&&flag[x][y]==0&&x==dice1)
            {
              flag[x][y]=motikomaflag;
              motikomaflag=0;
              komaflag=-1;
              komacatchflag=0;
              teban=1-teban;
              if (autodice==true) {
                dice2=(int)random(1, 7);
              } else {
                while (!keyPressed) {
                  if (key=='1') {
                    dice2=1;
                    break;
                  } else if (key=='2') {
                    dice2=2;
                    break;
                  } else if (key=='3') {
                    dice2=3;
                    break;
                  } else if (key=='4') {
                    dice2=4;
                    break;
                  } else if (key=='5') {
                    dice2=5;
                    break;
                  } else if (key=='6') {
                    dice2=6;
                    break;
                  } else {
                  }
                }
              }
              makeKOMAmovelist();
              enemystrategy();
            } else {
              komaflag=0;
            }
          }//ここまで

          else if (komaflag>0)
          {



            //動かせるかチェック
            flag[komaXflag][komaYflag]=0;
            println(komacheck(komaflag, komaXflag, komaYflag, x, y));
            println(teban);
            if (komacheck(komaflag, komaXflag, komaYflag, x, y)==false)
            {
              flag[komaXflag][komaYflag]=komaflag;
              komaflag=0;//クリックやり直し待ち
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

                flag[x][y]=komaflag;
                komaflag=-1;
                teban=1-teban;  
                if (autodice==true) {
                  dice2=(int)random(1, 7);
                } else {
                  while (!keyPressed) {
                    if (key=='1') {
                      dice2=1;
                      break;
                    } else if (key=='2') {
                      dice2=2;
                      break;
                    } else if (key=='3') {
                      dice2=3;
                      break;
                    } else if (key=='4') {
                      dice2=4;
                      break;
                    } else if (key=='5') {
                      dice2=5;
                      break;
                    } else if (key=='6') {
                      dice2=6;
                      break;
                    } else {
                    }
                  }
                }//手番変更
              }

              draw();
              if (teban==1)
              {
                makeKOMAmovelist();
                enemystrategy();
                komaflag=-1;
              }
            }
          } else if (komaflag==0)
          {
            komaflag=flag[x][y];//クリックした駒を指す駒を指定する
            //flag[x][y]=0;
            komaXflag=x;
            komaYflag=y;
          }
        }
      }
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

  if (teban==0&&x2!=dice1&&dice1!=6)return false;
  if (teban==1&&x2!=dice2&&dice2!=6)return false;

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
