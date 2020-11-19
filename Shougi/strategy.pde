boolean enemystrategy() //<>// //<>// //<>// //<>// //<>//
{
  Habu.strategy();

  ////ランダムに選ぶ
  //int count=komamovelist.size();
  //if (count==0)
  //{
  //  return false;
  //}
  //int number=0;

  ////number=enemykomause();
  ////if(number==-2){
  ////return false;
  ////}
  ////if (number==-1) {
  //number=ootorarerunigeru();//王手をかけられてたら逃げる
  ////}

  //if (number==-1) {
  //  number=ootoru();//王が取れたら取る
  //}

  //while (number==-1)
  //{
  //  number=(int)random(0, count);//ランダムに動かす
  //  number=ouzibakuyoke(number);//王が自爆してたら-1を返してループ
  //}
  ////if(number!=-2){
  //komamove move=komamovelist.get(number);
  //println("相手は,", move.k, move.x1, move.y1, move.x2, move.y2);

  //println("コンピューターは"+computerkihuoutput(move));
  //kihu.add(computerkihuoutput(move));

  //if (move.x1>=1&&move.x1<=5) {//指す手
  //  flag[move.x1][move.y1]=0;
  //  komaflag=move.k;                    //駒を手に取る
  //  enemykomamove(move.x2, move.y2); //駒指す
  //  //駒成り
  //  if (move.y1==5||move.y2==5) {

  //    if (flag[move.x2][move.y2]==11)
  //    {
  //      flag[move.x2][move.y2]=17;//相手と
  //    }
  //    if (flag[move.x2][move.y2]==12)
  //    {
  //      flag[move.x2][move.y2]=20;//相手成銀phase==PHASE.Player1Move
  //    }
  //    if (flag[move.x2][move.y2]==14)
  //    {  
  //      flag[move.x2][move.y2]=18;//相手馬
  //    }
  //    if (flag[move.x2][move.y2]==15)
  //    {
  //      flag[move.x2][move.y2]=19;//相手龍
  //    }
  //  }
  //} else {//打つ手
  //  if (move.k==11) {
  //    if (motigoma2[1][0]==1) {
  //      motigoma2[1][0]=0;
  //    } else {
  //      motigoma2[0][0]=0;
  //    }
  //  }
  //  if (move.k==12) {
  //    if (motigoma2[1][1]==1) {
  //      motigoma2[1][1]=0;
  //    } else {
  //      motigoma2[0][1]=0;
  //    }
  //  }
  //  if (move.k==13) {
  //    if (motigoma2[1][2]==1) {
  //      motigoma2[1][2]=0;
  //    } else {
  //      motigoma2[0][2]=0;
  //    }
  //  }
  //  if (move.k==14) {
  //    if (motigoma2[1][3]==1) {
  //      motigoma2[1][3]=0;
  //    } else {
  //      motigoma2[0][3]=0;
  //    }
  //  }
  //  if (move.k==15) {
  //    if (motigoma2[1][4]==1) {
  //      motigoma2[1][4]=0;
  //    } else {
  //      motigoma2[0][4]=0;
  //    }
  //  }
  //  komaflag=move.k;
  //  enemykomamove(move.x2, move.y2);
  //}

  ////}
  return false;
}

int ootoru()
{
  for (int i=0; i<komamovelist2.size(); i++ )
  {
    komamove move=komamovelist2.get(i);
    if (flag[move.x2][move.y2]==6)
    {
      ownoute=1;
      return i;
    } else if (flag[move.x2][move.y2]==5)
    {
      ownoute=0;
      return i;
    } else if (flag[move.x2][move.y2]==4)
    {
      ownoute=0;
      return i;
    } else if (flag[move.x2][move.y2]==3)
    {
      ownoute=0;
      return i;
    } else if (flag[move.x2][move.y2]==2)
    {
      ownoute=0;
      return i;
    } else if (flag[move.x2][move.y2]==1)
    {
      ownoute=0;
      return i;
    }
  }
  ownoute=0;
  return -1;
}

boolean ootekaketeru() {//プレイヤー2がプレイヤー1に王手をかけてる
  make_player2kiki(player2kiki, flag);

  for (int y=0; y<7; y++)
  {
    for (int x=0; x<7; x++)
    {
      if (player2kiki[x][y]==1&&flag[x][y]==6)
      {
        return true;
      }
    }
  }

  return false;
}

int ootekaketerunigerareru() {
  make_player2kiki(player2kiki, flag);

  for (int y=0; y<7; y++)
  {
    for (int x=0; x<7; x++)
    {
      if (player2kiki[x][y]==1&&flag[x][y]==6)//プレイヤー2がプレイヤー1に王手をかけてる
      {
        makeKOMAmovelist(0, komamovelist1);
        for (int n=0; n<komamovelist1.size(); n++) {
          komamove move=komamovelist1.get(n);

          //プレイヤー1が試しに動かしてみる
          int [][] flagtameshi=new int[7][7];
          for (int xx=0; xx<7; xx++)
          {
            for (int yy=0; yy<7; yy++)
            {
              flagtameshi[xx][yy]=flag[xx][yy];
            }
          }
          flagtameshi[move.x1][move.y1]=0;//駒台からだとばぐる
          flagtameshi[move.x2][move.y2]=move.k;


          //その後のplayer2kikiを調べる 
          int[][]player2kikitameshi=new int[7][7];

          make_player2kiki(player2kikitameshi, flagtameshi);

          //王取りがかかっていなければそのnをreturnする
          if (move.k!=6) {
            if (player2kikitameshi[x][y]==0) {
              return n;
            }
          } else if (player2kikitameshi[move.x2][move.y2]==0) {
            return n;
          }
        }
        return -2;
      }
    }
  }

  return -1;//プレイヤー1の王が詰んでいる
}

int ootorarerunigeru()
{
  make_player1kiki(player1kiki, flag);

  for (int xxx=0; xxx<7; xxx++)
  {
    for (int yyy=0; yyy<7; yyy++)
    {
      if (flag[xxx][yyy]==16&&player1kiki[xxx][yyy]==1)//プレイヤー2に王手がかかっている
      {

        for (int n=0; n<komamovelist2.size(); n++) {
          komamove move=komamovelist2.get(n);

          //プレイヤー2が試しに動かしてみる
          int [][] flagtameshi=new int[7][7];
          for (int xx=0; xx<7; xx++)
          {
            for (int yy=0; yy<7; yy++)
            {
              flagtameshi[xx][yy]=flag[xx][yy];
            }
          }
          flagtameshi[move.x1][move.y1]=0;//駒台からだとばぐる

          flagtameshi[move.x2][move.y2]=move.k;

          //その後のplayer1kikiを調べる 
          int[][]player1kikitameshi=new int[7][7];

          make_player1kiki(player1kikitameshi, flagtameshi);

          //王取りがかかっていなければそのnをreturnする
          if (move.k!=16) {
            if (player1kikitameshi[xxx][yyy]==0) {
              return n;
            }
          } else if (player1kikitameshi[move.x2][move.y2]==0) {
            return n;
          }
        }
      }
    }
  }
  return -1;
}



int ouzibakuyoke(int n) {//王が自爆してたら-1を返す

  komamove move=komamovelist2.get(n);
  //player1kikiのデータはあるものと仮定
  if (move.k==16) {
    if (player1kiki[move.x2][move.y2]==1) {
      return -1;
    }
  }

  return n;
}




//int FindMoveFromMovelist(int x1, int y1, int x2, int y2)
//{
//  for (int i=0; i<komamovelist.size(); i++ )
//  {
//    komamove move=komamovelist.get(i);
//    if (x1==move.x1&&y1==move.y1&&
//      x2==move.x2&&y2==move.y2)
//    {
//      return i;
//    }
//  }

//  return -1;
//}

boolean ootekakatteru() {//プレイヤー1がプレイヤー2に王手をかけてる
  //for (int y=0; y<7; y++)
  //{
  //  for (int x=0; x<7; x++)
  //  {
  //    print(flag[x][y]+" ");
  //  }
  //  println();
  //}

  make_player1kiki(player1kiki, flag);

  //for (int y=1; y<6; y++)
  //{
  //  for (int x=1; x<6; x++)
  //  {
  //    print(player1kiki[x][y] );
  //  }
  //  println();
  //}


  for (int xxx=0; xxx<7; xxx++)
  {
    for (int yyy=0; yyy<7; yyy++)
    {
      if (flag[xxx][yyy]==16&&player1kiki[xxx][yyy]==1)//王手がかかっている
      {
        return true;
      }
    }
  }
  return false;
}

void make_player1kiki(int [][] player1kiki, int[][]_flag) {
  for (int x=0; x<7; x++)
  {
    for (int y=0; y<7; y++)
    {
      player1kiki[x][y]=0;
    }
  }
  for (int x=0; x<7; x++)
  {
    for (int y=0; y<7; y++)
    {
      if (_flag[x][y]==-1) player1kiki[x][y]=-1;

      if (_flag[x][y]==1) {//歩
        player1kiki[x][y-1]=1;
      }

      if (_flag[x][y]==2) {//銀
        player1kiki[x][y-1]=1;
        player1kiki[x-1][y-1]=1;
        player1kiki[x+1][y-1]=1;
        player1kiki[x-1][y+1]=1;
        player1kiki[x+1][y+1]=1;
      }

      //ここから先
      if (_flag[x][y]==3||_flag[x][y]==7||_flag[x][y]==10) {//金
        player1kiki[x][y-1]=1;
        player1kiki[x-1][y-1]=1;
        player1kiki[x+1][y-1]=1;
        player1kiki[x-1][y]=1;
        player1kiki[x+1][y]=1;
        player1kiki[x][y+1]=1;
      }

      if (_flag[x][y]==4) {//角
        for (int s=1; x+s<7&&y+s<7; s++) {
          //for (int t=s; y+t<7; t++) {
          if (_flag[x+s][y+s]>=11) {
            player1kiki[x+s][y+s]=1;
            break;
          } else if (_flag[x+s][y+s]!=0) {
            break;
          }

          player1kiki[x+s][y+s]=1;
          //}
        }
        for (int s=1; x-s>0&&y+s<7; s++) {
          //for (int t=s; y+t<7; t++) {
          if (_flag[x-s][y+s]>=11) {
            player1kiki[x-s][y+s]=1;
            break;
          } else if (_flag[x-s][y+s]!=0) {
            break;
          }

          player1kiki[x-s][y+s]=1;
          //}
        }
        for (int s=1; x+s<7&&y-s>0; s++) {
          //for (int t=s; y-t>0; t++) {
          if (_flag[x+s][y-s]>=11) {
            player1kiki[x+s][y-s]=1;
            break;
          } else if (_flag[x+s][y-s]!=0) {
            break;
          }

          player1kiki[x+s][y-s]=1;
          //}
        }
        for (int s=1; x-s>0&&y-s>0; s++) {
          //for (int t=s; y-t>0; t++) {
          if (_flag[x-s][y-s]>=11) {
            player1kiki[x-s][y-s]=1;
            break;
          } else if (_flag[x-s][y-s]!=0) {
            break;
          }

          player1kiki[x-s][y-s]=1;
          //}
        }
      }

      if (_flag[x][y]==5) {//飛
        for (int s=1; y+s<6; s++) {//下
          //for (int t=s; y+t<7||y-t>0; t++) {                 
          if (_flag[x][y+s]>=11) {
            player1kiki[x][y+s]=1;
            break;
          } else if (_flag[x][y+s]!=0) {
            break;
          }
          player1kiki[x][y+s]=1;

          //}
        }
        for (int s=1; x-s>0; s++) {//左
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (_flag[x-s][y]>=11) {
            player1kiki[x-s][y]=1;
            break;
          } else if (_flag[x-s][y]!=0) {
            break;
          }
          player1kiki[x-s][y]=1;


          //}
        }
        for (int s=1; x+s<6; s++) {//右
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (_flag[x+s][y]>=11) {
            player1kiki[x+s][y]=1;
            break;
          } else if (_flag[x+s][y]!=0) {
            break;
          }
          player1kiki[x+s][y]=1;

          //}
        }
        for (int s=1; y-s>0; s++) {//上
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (_flag[x][y-s]>=11) {
            player1kiki[x][y-s]=1;
            break;
          } else if (_flag[x][y-s]!=0) {
            break;
          }
          player1kiki[x][y-s]=1;
          //}
        }
      }

      if (_flag[x][y]==6) {//王
        player1kiki[x][y-1]=1;
        player1kiki[x-1][y-1]=1;
        player1kiki[x+1][y-1]=1;
        player1kiki[x-1][y]=1;
        player1kiki[x+1][y]=1;
        player1kiki[x][y+1]=1;
        player1kiki[x-1][y+1]=1;
        player1kiki[x+1][y+1]=1;
      }

      if (_flag[x][y]==8) {//馬
        for (int s=1; x+s<7&&y+s<7; s++) {
          //for (int t=s; y+t<7; t++) {
          if (_flag[x+s][y+s]>=11) {
            player1kiki[x+s][y+s]=1;
            break;
          } else if (_flag[x+s][y+s]!=0) {
            break;
          }

          player1kiki[x+s][y+s]=1;
          //}
        }
        for (int s=1; x-s>0&&y+s<7; s++) {
          //for (int t=s; y+t<7; t++) {
          if (_flag[x-s][y+s]>=11) {
            player1kiki[x-s][y+s]=1;
            break;
          } else if (_flag[x-s][y+s]!=0) {
            break;
          }

          player1kiki[x-s][y+s]=1;
          //}
        }
        for (int s=1; x+s<7&&y-s>0; s++) {
          //for (int t=s; y-t>0; t++) {
          if (_flag[x+s][y-s]>=11) {
            player1kiki[x+s][y-s]=1;
            break;
          } else if (_flag[x+s][y-s]!=0) {
            break;
          }

          player1kiki[x+s][y-s]=1;
          //}
        }
        for (int s=1; x-s>0&&y-s>0; s++) {
          //for (int t=s; y-t>0; t++) {
          if (_flag[x-s][y-s]>=11) {
            player1kiki[x-s][y-s]=1;
            break;
          } else if (_flag[x-s][y-s]!=0) {
            break;
          }

          player1kiki[x-s][y-s]=1;
          //}
        }
        player1kiki[x][y-1]=1;
        player1kiki[x-1][y]=1;
        player1kiki[x+1][y]=1;
        player1kiki[x][y+1]=1;
      }

      if (_flag[x][y]==9) {//龍
        for (int s=1; y+s<6; s++) {//下
          //for (int t=s; y+t<7||y-t>0; t++) {                 
          if (_flag[x][y+s]>=11) {
            player1kiki[x][y+s]=1;
            break;
          } else if (_flag[x][y+s]!=0) {
            break;
          }
          player1kiki[x][y+s]=1;

          //}
        }
        for (int s=1; x-s>0; s++) {//左
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (_flag[x-s][y]>=11) {
            player1kiki[x-s][y]=1;
            break;
          } else if (_flag[x-s][y]!=0) {
            break;
          }
          player1kiki[x-s][y]=1;


          //}
        }
        for (int s=1; x+s<6; s++) {//右
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (_flag[x+s][y]>=11) {
            player1kiki[x+s][y]=1;
            break;
          } else if (_flag[x+s][y]!=0) {
            break;
          }
          player1kiki[x+s][y]=1;

          //}
        }
        for (int s=1; y-s>0; s++) {//上
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (_flag[x][y-s]>=11) {
            player1kiki[x][y-s]=1;
            break;
          } else if (_flag[x][y-s]!=0) {
            break;
          }
          player1kiki[x][y-s]=1;
          //}
        }
        player1kiki[x-1][y-1]=1;
        player1kiki[x+1][y-1]=1;
        player1kiki[x-1][y+1]=1;
        player1kiki[x+1][y+1]=1;
      }
    }
  }
}

void make_player2kiki(int [][] player2kiki, int[][]_flag) {
  for (int x=0; x<7; x++)
  {
    for (int y=0; y<7; y++)
    {
      player2kiki[x][y]=0;
    }
  }
  for (int x=0; x<7; x++)
  {
    for (int y=0; y<7; y++)
    {
      if (_flag[x][y]==-1) player2kiki[x][y]=-1;

      if (_flag[x][y]==11) {//歩
        player2kiki[x][y+1]=1;
      }

      if (_flag[x][y]==12) {//銀
        player2kiki[x][y+1]=1;
        player2kiki[x-1][y-1]=1;
        player2kiki[x+1][y-1]=1;
        player2kiki[x-1][y+1]=1;
        player2kiki[x+1][y+1]=1;
      }

      if (_flag[x][y]==13||_flag[x][y]==17||_flag[x][y]==20) {//金
        player2kiki[x][y+1]=1;
        player2kiki[x-1][y+1]=1;
        player2kiki[x+1][y+1]=1;
        player2kiki[x-1][y]=1;
        player2kiki[x+1][y]=1;
        player2kiki[x][y-1]=1;
      }

      if (_flag[x][y]==14) {//角
        for (int s=1; x+s<7&&y+s<7; s++) {
          //for (int t=s; y+t<7; t++) {
          if (_flag[x+s][y+s]>=11) {//player2の駒があれば

            break;
          } else if (_flag[x+s][y+s]!=0) {//player1の駒があれば
            player2kiki[x+s][y+s]=1;
            break;
          }

          player2kiki[x+s][y+s]=1;
          //}
        }
        for (int s=1; x-s>0&&y+s<7; s++) {
          //for (int t=s; y+t<7; t++) {
          if (_flag[x-s][y+s]>=11) {

            break;
          } else if (_flag[x-s][y+s]!=0) {
            player2kiki[x-s][y+s]=1;
            break;
          }

          player2kiki[x-s][y+s]=1;
          //}
        }
        for (int s=1; x+s<7&&y-s>0; s++) {
          //for (int t=s; y-t>0; t++) {
          if (_flag[x+s][y-s]>=11) {

            break;
          } else if (_flag[x+s][y-s]!=0) {
            player2kiki[x+s][y-s]=1;
            break;
          }

          player2kiki[x+s][y-s]=1;
          //}
        }
        for (int s=1; x-s>0&&y-s>0; s++) {
          //for (int t=s; y-t>0; t++) {
          if (_flag[x-s][y-s]>=11) {

            break;
          } else if (_flag[x-s][y-s]!=0) {
            player2kiki[x-s][y-s]=1;
            break;
          }

          player2kiki[x-s][y-s]=1;
          //}
        }
      }

      if (_flag[x][y]==15) {//飛
        for (int s=1; y+s<6; s++) {//下
          //for (int t=s; y+t<7||y-t>0; t++) {                 
          if (_flag[x][y+s]>=11) {

            break;
          } else if (_flag[x][y+s]!=0) {
            player2kiki[x][y+s]=1;
            break;
          }
          player2kiki[x][y+s]=1;

          //}
        }
        for (int s=1; x-s>0; s++) {//左
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (_flag[x-s][y]>=11) {

            break;
          } else if (_flag[x-s][y]!=0) {
            player2kiki[x-s][y]=1;
            break;
          }
          player2kiki[x-s][y]=1;


          //}
        }
        for (int s=1; x+s<6; s++) {//右
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (_flag[x+s][y]>=11) {

            break;
          } else if (_flag[x+s][y]!=0) {
            player2kiki[x+s][y]=1;
            break;
          }
          player2kiki[x+s][y]=1;

          //}
        }
        for (int s=1; y-s>0; s++) {//上
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (_flag[x][y-s]>=11) {

            break;
          } else if (_flag[x][y-s]!=0) {
            player2kiki[x][y-s]=1;
            break;
          }
          player2kiki[x][y-s]=1;
          //}
        }
      }

      if (_flag[x][y]==16) {//王
        player2kiki[x][y-1]=1;
        player2kiki[x-1][y-1]=1;
        player2kiki[x+1][y-1]=1;
        player2kiki[x-1][y]=1;
        player2kiki[x+1][y]=1;
        player2kiki[x][y+1]=1;
        player2kiki[x-1][y+1]=1;
        player2kiki[x+1][y+1]=1;
      }

      if (_flag[x][y]==18) {//馬
        for (int s=1; x+s<7&&y+s<7; s++) {
          //for (int t=s; y+t<7; t++) {
          if (_flag[x+s][y+s]>=11) {

            break;
          } else if (_flag[x+s][y+s]!=0) {
            player2kiki[x+s][y+s]=1;
            break;
          }

          player2kiki[x+s][y+s]=1;
          //}
        }
        for (int s=1; x-s>0&&y+s<7; s++) {
          //for (int t=s; y+t<7; t++) {
          if (_flag[x-s][y+s]>=11) {

            break;
          } else if (_flag[x-s][y+s]!=0) {
            player2kiki[x-s][y+s]=1;
            break;
          }

          player2kiki[x-s][y+s]=1;
          //}
        }
        for (int s=1; x+s<7&&y-s>0; s++) {
          //for (int t=s; y-t>0; t++) {
          if (_flag[x+s][y-s]>=11) {

            break;
          } else if (_flag[x+s][y-s]!=0) {
            player2kiki[x+s][y-s]=1;
            break;
          }

          player2kiki[x+s][y-s]=1;
          //}
        }
        for (int s=1; x-s>0&&y-s>0; s++) {
          //for (int t=s; y-t>0; t++) {
          if (_flag[x-s][y-s]>=11) {

            break;
          } else if (_flag[x-s][y-s]!=0) {
            player2kiki[x-s][y-s]=1;
            break;
          }

          player2kiki[x-s][y-s]=1;
          //}
        }
        player2kiki[x][y-1]=1;
        player2kiki[x-1][y]=1;
        player2kiki[x+1][y]=1;
        player2kiki[x][y+1]=1;
      }

      if (_flag[x][y]==19) {//龍
        for (int s=1; y+s<6; s++) {//下
          //for (int t=s; y+t<7||y-t>0; t++) {                 
          if (_flag[x][y+s]>=11) {

            break;
          } else if (_flag[x][y+s]!=0) {
            player2kiki[x][y+s]=1;
            break;
          }
          player2kiki[x][y+s]=1;

          //}
        }
        for (int s=1; x-s>0; s++) {//左
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (_flag[x-s][y]>=11) {

            break;
          } else if (_flag[x-s][y]!=0) {
            player2kiki[x-s][y]=1;
            break;
          }
          player2kiki[x-s][y]=1;


          //}
        }
        for (int s=1; x+s<6; s++) {//右
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (_flag[x+s][y]>=11) {

            break;
          } else if (_flag[x+s][y]!=0) {
            player2kiki[x+s][y]=1;
            break;
          }
          player2kiki[x+s][y]=1;

          //}
        }
        for (int s=1; y-s>0; s++) {//上
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (_flag[x][y-s]>=11) {

            break;
          } else if (_flag[x][y-s]!=0) {
            player2kiki[x][y-s]=1;
            break;
          }
          player2kiki[x][y-s]=1;
          //}
        }
        player2kiki[x-1][y-1]=1;
        player2kiki[x+1][y-1]=1;
        player2kiki[x-1][y+1]=1;
        player2kiki[x+1][y+1]=1;
      }
    }
  }
}

//int enemykomause() {
//  int n=-2;
//  for (int x=1; x<6; x++) {
//    for (int y=1; y<6; y++) {
//      if (flag[x][y]==6&&flag[x][y-1]==0&&motigoma2[0][0]==1) {
//        motigoma2[0][0]=0;
//        flag[x][y-1]=11;
//        break;
//      }else if (flag[x][y]==6&&flag[x][y-1]==0&&motigoma2[0][1]==1) {
//        motigoma2[0][1]=0;
//        flag[x][y-1]=12;
//        break;
//      }else{
//        n=-1;
//      }
//    }
//  }
//  return n;
//}
