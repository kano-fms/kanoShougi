void koma_reset() {
  //駒リセット
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
  for (int x=0; x<2; x=x+1)
  {
    for (int y=0; y<5; y=y+1)
    {
      motigoma1[x][y]=0;
      motigoma2[x][y]=0;
    }
  }

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

void new_game() {
  if (syouriflag==1||syouriflag==2)
  {
    if (mouseX>600&&mouseX<850&&mouseY>650&&mouseY<750)//もう一度　押す
    {
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

      for (int x=0; x<2; x=x+1)
      {
        for (int y=0; y<5; y=y+1)
        {
          motigoma1[x][y]=0;
          motigoma2[x][y]=0;
        }
      }

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

      syouriflag=0;
      teban=0;
    }

    if (mouseX>850&&mouseX<1100&&mouseY>650&&mouseY<750)//止める　押す
    {
      exit();
    }
  }
}

void koma_nari() {
  for (int n=0; n<7; n=n+1)
  {
    if (flag[n][1]==1)
    {
      flag[n][1]=7;//自分と
    }
    if (flag[n][1]==2)
    {
      flag[n][1]=10;//自分成銀
    }
    if (flag[n][1]==4)
    {
      flag[n][1]=8;//自分馬
    }
    if (flag[n][1]==5)
    {
      flag[n][1]=9;//自分龍
    }

    if (flag[n][5]==11)
    {
      flag[n][5]=17;//相手と
    }
    if (flag[n][5]==12)
    {
      flag[n][5]=20;//相手成銀
    }
    if (flag[n][5]==14)
    {
      flag[n][5]=18;//相手馬
    }
    if (flag[n][5]==15)
    {
      flag[n][5]=19;//相手龍
    }
  }
}

void take_koma_komadai() {
  if (mouseX>1030&&mouseX<1130&&mouseY>630&&mouseY<730&&komacatchflag==0)//歩を使う
  {
    if (motigoma1[0][0]==1) {
      motikomaflag=1;
      motigoma1[0][0]=0;
      komacatchflag=1;
    }
  }
  if (mouseX>1030&&mouseX<1130&&mouseY>790&&mouseY<890&&komacatchflag==0)//歩を使う
  {
    if (motigoma1[1][0]==1) {
      motikomaflag=1;
      motigoma1[1][0]=0;
      komacatchflag=1;
    }
  }
  if (mouseX>1130&&mouseX<1230&&mouseY>630&&mouseY<730&&komacatchflag==0)//銀を使う
  {
    if (motigoma1[0][1]==1) {
      motikomaflag=2;
      motigoma1[0][1]=0;
      komacatchflag=1;
    }
  }
  if (mouseX>1130&&mouseX<1230&&mouseY>790&&mouseY<890&&komacatchflag==0)//銀を使う
  {
    if (motigoma1[1][1]==1) {
      motikomaflag=2;
      motigoma1[1][1]=0;
      komacatchflag=1;
    }
  }
  if (mouseX>1230&&mouseX<1330&&mouseY>630&&mouseY<730&&komacatchflag==0)//金を使う
  {
    if (motigoma1[0][2]==1) {
      motikomaflag=3;
      motigoma1[0][2]=0;
      komacatchflag=1;
    }
  }
  if (mouseX>1230&&mouseX<1330&&mouseY>790&&mouseY<890&&komacatchflag==0)//金を使う
  {
    if (motigoma1[1][2]==1) {
      motikomaflag=3;
      motigoma1[1][2]=0;
      komacatchflag=1;
    }
  }
  if (mouseX>1330&&mouseX<1430&&mouseY>630&&mouseY<730&&komacatchflag==0)//角を使う
  {
    if (motigoma1[0][3]==1) {
      motikomaflag=4;
      motigoma1[0][3]=0;
      komacatchflag=1;
    }
  }
  if (mouseX>1330&&mouseX<1430&&mouseY>790&&mouseY<890&&komacatchflag==0)//角を使う
  {
    if (motigoma1[1][3]==1) {
      motikomaflag=4;
      motigoma1[1][3]=0;
      komacatchflag=1;
    }
  }
  if (mouseX>1430&&mouseX<1530&&mouseY>630&&mouseY<730&&komacatchflag==0)//飛を使う
  {
    if (motigoma1[0][4]==1) {
      motikomaflag=5;
      motigoma1[0][4]=0;
      komacatchflag=1;
    }
  }
  if (mouseX>1430&&mouseX<1530&&mouseY>790&&mouseY<890&&komacatchflag==0)//飛を使う                          　ここまで
  {
    if (motigoma1[1][4]==1) {
      motikomaflag=5;
      motigoma1[1][4]=0;
      komacatchflag=1;
    }
  }

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
