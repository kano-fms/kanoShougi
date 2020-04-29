void resetboard(){
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
