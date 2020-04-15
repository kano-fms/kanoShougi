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

void koma_nari(){
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
