boolean enemystrategy() //<>// //<>// //<>// //<>// //<>//
{
  //ランダムに選ぶ
  int count=komamovelist.size();
  if (count==0)
  {
    return false;
  }
  int number=0;

  //number=enemykomause();
  //if(number==-2){
  //return false;
  //}
  //if (number==-1) {
  number=ootorarerunigeru();//王手をかけられてたら逃げる
  //}

  if (number==-1) {
    number=ootoru();//王が取れたら取る
  }

  while (number==-1)
  {
    number=(int)random(0, count);//ランダムに動かす
    number=ouzibakuyoke(number);//王が自爆してたら-1を返してループ
  }
  //if(number!=-2){
  komamove move=komamovelist.get(number);
  println("相手は,", move.k, move.x1, move.y1, move.x2, move.y2);
  println("コンピューターは"+computerkihuoutput(move));
  if (move.x1<=5) {//指す手
    flag[move.x1][move.y1]=0;
    komaflag=move.k;                    //駒を手に取る
    enemykomamove(move.x2, move.y2); //駒指す
    //駒成り
    if (move.y1==5||move.y2==5) {

      if (flag[move.x2][move.y2]==11)
      {
        flag[move.x2][move.y2]=17;//相手と
      }
      if (flag[move.x2][move.y2]==12)
      {
        flag[move.x2][move.y2]=20;//相手成銀phase==PHASE.Player1Move
      }
      if (flag[move.x2][move.y2]==14)
      {  
        flag[move.x2][move.y2]=18;//相手馬
      }
      if (flag[move.x2][move.y2]==15)
      {
        flag[move.x2][move.y2]=19;//相手龍
      }
    }
  } else {//打つ手
    if (move.k==11) {
      if (motigoma2[1][0]==1) {
        motigoma2[1][0]=0;
      } else {
        motigoma2[0][0]=0;
      }
    }
    if (move.k==12) {
      if (motigoma2[1][1]==1) {
        motigoma2[1][1]=0;
      } else {
        motigoma2[0][1]=0;
      }
    }
    if (move.k==13) {
      if (motigoma2[1][2]==1) {
        motigoma2[1][2]=0;
      } else {
        motigoma2[0][2]=0;
      }
    }
    if (move.k==14) {
      if (motigoma2[1][3]==1) {
        motigoma2[1][3]=0;
      } else {
        motigoma2[0][3]=0;
      }
    }
    if (move.k==15) {
      if (motigoma2[1][4]==1) {
        motigoma2[1][4]=0;
      } else {
        motigoma2[0][4]=0;
      }
    }
    komaflag=move.k;
    enemykomamove(move.x2, move.y2);
  }

  //}
  return false;
}

int ootoru()
{
  for (int i=0; i<komamovelist.size(); i++ )
  {
    komamove move=komamovelist.get(i);
    if (flag[move.x2][move.y2]==6)
    {
      return i;
    } else if (flag[move.x2][move.y2]==5)
    {
      return i;
    } else if (flag[move.x2][move.y2]==4)
    {
      return i;
    } else if (flag[move.x2][move.y2]==3)
    {
      return i;
    } else if (flag[move.x2][move.y2]==2)
    {
      return i;
    } else if (flag[move.x2][move.y2]==1)
    {
      return i;
    }
  }

  return -1;
}

int ootorarerunigeru()
{
  for (int y=0; y<7; y++)
  {
    for (int x=0; x<7; x++)
    {
      print(flag[x][y]+" ");
    }
    println();
  }

  for (int x=0; x<7; x++)
  {
    for (int y=0; y<7; y++)
    {
      ownkiki[x][y]=0;
    }
  }
  for (int x=0; x<7; x++)
  {
    for (int y=0; y<7; y++)
    {
      if (flag[x][y]==-1) ownkiki[x][y]=-1;

      if (flag[x][y]==1) {//歩
        ownkiki[x][y-1]=1;
      }

      if (flag[x][y]==2) {//銀
        ownkiki[x][y-1]=1;
        ownkiki[x-1][y-1]=1;
        ownkiki[x+1][y-1]=1;
        ownkiki[x-1][y+1]=1;
        ownkiki[x+1][y+1]=1;
      }

      //ここから先
      if (flag[x][y]==3||flag[x][y]==7||flag[x][y]==10) {//金
        ownkiki[x][y-1]=1;
        ownkiki[x-1][y-1]=1;
        ownkiki[x+1][y-1]=1;
        ownkiki[x-1][y]=1;
        ownkiki[x+1][y]=1;
        ownkiki[x][y+1]=1;
      }

      if (flag[x][y]==4) {//角
        for (int s=1; x+s<7&&y+s<7; s++) {
          //for (int t=s; y+t<7; t++) {
          if (flag[x+s][y+s]>=11) {
            ownkiki[x+s][y+s]=1;
            break;
          } else if (flag[x+s][y+s]!=0) {
            break;
          }

          ownkiki[x+s][y+s]=1;
          //}
        }
        for (int s=1; x-s>0&&y+s<7; s++) {
          //for (int t=s; y+t<7; t++) {
          if (flag[x-s][y+s]>=11) {
            ownkiki[x-s][y+s]=1;
            break;
          } else if (flag[x-s][y+s]!=0) {
            break;
          }

          ownkiki[x-s][y+s]=1;
          //}
        }
        for (int s=1; x+s<7&&y-s>0; s++) {
          //for (int t=s; y-t>0; t++) {
          if (flag[x+s][y-s]>=11) {
            ownkiki[x+s][y-s]=1;
            break;
          } else if (flag[x+s][y-s]!=0) {
            break;
          }

          ownkiki[x+s][y-s]=1;
          //}
        }
        for (int s=1; x-s>0&&y-s>0; s++) {
          //for (int t=s; y-t>0; t++) {
          if (flag[x-s][y-s]>=11) {
            ownkiki[x-s][y-s]=1;
            break;
          } else if (flag[x-s][y-s]!=0) {
            break;
          }

          ownkiki[x-s][y-s]=1;
          //}
        }
      }

      if (flag[x][y]==5) {//飛
        for (int s=1; y+s<6; s++) {//下
          //for (int t=s; y+t<7||y-t>0; t++) {                 
          if (flag[x][y+s]>=11) {
            ownkiki[x][y+s]=1;
            break;
          } else if (flag[x][y+s]!=0) {
            break;
          }
          ownkiki[x][y+s]=1;

          //}
        }
        for (int s=1; x-s>0; s++) {//左
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (flag[x-s][y]>=11) {
            ownkiki[x-s][y]=1;
            break;
          } else if (flag[x-s][y]!=0) {
            break;
          }
          ownkiki[x-s][y]=1;


          //}
        }
        for (int s=1; x+s<6; s++) {//右
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (flag[x+s][y]>=11) {
            ownkiki[x+s][y]=1;
            break;
          } else if (flag[x+s][y]!=0) {
            break;
          }
          ownkiki[x+s][y]=1;

          //}
        }
        for (int s=1; y-s>0; s++) {//上
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (flag[x][y-s]>=11) {
            ownkiki[x][y-s]=1;
            break;
          } else if (flag[x][y-s]!=0) {
            break;
          }
          ownkiki[x][y-s]=1;
          //}
        }
      }

      if (flag[x][y]==6) {//王
        ownkiki[x][y-1]=1;
        ownkiki[x-1][y-1]=1;
        ownkiki[x+1][y-1]=1;
        ownkiki[x-1][y]=1;
        ownkiki[x+1][y]=1;
        ownkiki[x][y+1]=1;
        ownkiki[x-1][y+1]=1;
        ownkiki[x+1][y+1]=1;
      }

      if (flag[x][y]==8) {//馬
        for (int s=1; x+s<7&&y+s<7; s++) {
          //for (int t=s; y+t<7; t++) {
          if (flag[x+s][y+s]>=11) {
            ownkiki[x+s][y+s]=1;
            break;
          } else if (flag[x+s][y+s]!=0) {
            break;
          }

          ownkiki[x+s][y+s]=1;
          //}
        }
        for (int s=1; x-s>0&&y+s<7; s++) {
          //for (int t=s; y+t<7; t++) {
          if (flag[x-s][y+s]>=11) {
            ownkiki[x-s][y+s]=1;
            break;
          } else if (flag[x-s][y+s]!=0) {
            break;
          }

          ownkiki[x-s][y+s]=1;
          //}
        }
        for (int s=1; x+s<7&&y-s>0; s++) {
          //for (int t=s; y-t>0; t++) {
          if (flag[x+s][y-s]>=11) {
            ownkiki[x+s][y-s]=1;
            break;
          } else if (flag[x+s][y-s]!=0) {
            break;
          }

          ownkiki[x+s][y-s]=1;
          //}
        }
        for (int s=1; x-s>0&&y-s>0; s++) {
          //for (int t=s; y-t>0; t++) {
          if (flag[x-s][y-s]>=11) {
            ownkiki[x-s][y-s]=1;
            break;
          } else if (flag[x-s][y-s]!=0) {
            break;
          }

          ownkiki[x-s][y-s]=1;
          //}
        }
        ownkiki[x][y-1]=1;
        ownkiki[x-1][y]=1;
        ownkiki[x+1][y]=1;
        ownkiki[x][y+1]=1;
      }

      if (flag[x][y]==9) {//龍
        for (int s=1; y+s<6; s++) {//下
          //for (int t=s; y+t<7||y-t>0; t++) {                 
          if (flag[x][y+s]>=11) {
            ownkiki[x][y+s]=1;
            break;
          } else if (flag[x][y+s]!=0) {
            break;
          }
          ownkiki[x][y+s]=1;

          //}
        }
        for (int s=1; x-s>0; s++) {//左
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (flag[x-s][y]>=11) {
            ownkiki[x-s][y]=1;
            break;
          } else if (flag[x-s][y]!=0) {
            break;
          }
          ownkiki[x-s][y]=1;


          //}
        }
        for (int s=1; x+s<6; s++) {//右
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (flag[x+s][y]>=11) {
            ownkiki[x+s][y]=1;
            break;
          } else if (flag[x+s][y]!=0) {
            break;
          }
          ownkiki[x+s][y]=1;

          //}
        }
        for (int s=1; y-s>0; s++) {//上
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (flag[x][y-s]>=11) {
            ownkiki[x][y-s]=1;
            break;
          } else if (flag[x][y-s]!=0) {
            break;
          }
          ownkiki[x][y-s]=1;
          //}
        }
        ownkiki[x-1][y-1]=1;
        ownkiki[x+1][y-1]=1;
        ownkiki[x-1][y+1]=1;
        ownkiki[x+1][y+1]=1;
      }
    }
  }

  for (int y=1; y<6; y++)
  {
    for (int x=1; x<6; x++)
    {
      print(ownkiki[x][y] );
    }
    println();
  }


  for (int xxx=0; xxx<7; xxx++)
  {
    for (int yyy=0; yyy<7; yyy++)
    {
      if (flag[xxx][yyy]==16&&ownkiki[xxx][yyy]==1)//王手がかかっている
      {

        for (int n=0; n<komamovelist.size(); n++) {
          komamove move=komamovelist.get(n);

          //試しに動かしてみる
          int [][] flagtameshi=new int[7][7];
          for (int xx=0; xx<7; xx++)
          {
            for (int yy=0; yy<7; yy++)
            {
              flagtameshi[xx][yy]=flag[xx][yy];
            }
          }
          flagtameshi[move.x1][move.y1]=0;
          flagtameshi[move.x2][move.y2]=move.k;

          //その後のownkikiを調べる 
          int[][]ownkikitameshi=new int[7][7];


          for (int x=0; x<7; x++)
          {
            for (int y=0; y<7; y++)
            {
              ownkikitameshi[x][y]=0;
            }
          }
          for (int x=0; x<7; x++)
          {
            for (int y=0; y<7; y++)
            {
              if (flagtameshi[x][y]==-1) ownkikitameshi[x][y]=-1;

              if (flagtameshi[x][y]==1) {//歩
                ownkikitameshi[x][y-1]=1;
              }

              if (flagtameshi[x][y]==2) {//銀
                ownkikitameshi[x][y-1]=1;
                ownkikitameshi[x-1][y-1]=1;
                ownkikitameshi[x+1][y-1]=1;
                ownkikitameshi[x-1][y+1]=1;
                ownkikitameshi[x+1][y+1]=1;
              }

              //ここから先
              if (flagtameshi[x][y]==3||flagtameshi[x][y]==7||flagtameshi[x][y]==10) {//金
                ownkikitameshi[x][y-1]=1;
                ownkikitameshi[x-1][y-1]=1;
                ownkikitameshi[x+1][y-1]=1;
                ownkikitameshi[x-1][y]=1;
                ownkikitameshi[x+1][y]=1;
                ownkikitameshi[x][y+1]=1;
              }

              if (flagtameshi[x][y]==4) {//角
                for (int s=1; x+s<7&&y+s<7; s++) {
                  //for (int t=s; y+t<7; t++) {
                  if (flag[x+s][y+s]>=11) {
                    ownkikitameshi[x+s][y+s]=1;
                    break;
                  } else if (flag[x+s][y+s]!=0) {
                    break;
                  }
                  ownkikitameshi[x+s][y+s]=1;
                  //}
                }
                for (int s=1; x-s>0&&y+s<7; s++) {
                  //for (int t=s; y+t<7; t++) {
                  if (flag[x-s][y+s]>=11) {
                    ownkikitameshi[x-s][y+s]=1;
                    break;
                  } else if (flag[x-s][y+s]!=0) {
                    break;
                  }
                  ownkikitameshi[x-s][y+s]=1;
                  //}
                }
                for (int s=1; x+s<7&&y-s>0; s++) {
                  //for (int t=s; y-t>0; t++) {
                  if (flag[x+s][y-s]>=11) {
                    ownkikitameshi[x+s][y-s]=1;
                    break;
                  } else if (flag[x+s][y-s]!=0) {
                    break;
                  }
                  ownkikitameshi[x+s][y-s]=1;
                  //}
                }
                for (int s=1; x-s>0&&y-s>0; s++) {
                  //for (int t=s; y-t>0; t++) {
                  if (flag[x-s][y-s]>=11) {
                    ownkikitameshi[x-s][y-s]=1;
                    break;
                  } else if (flag[x-s][y-s]!=0) {
                    break;
                  }
                  ownkikitameshi[x-s][y-s]=1;
                  //}
                }
              }

              if (flagtameshi[x][y]==5) {//飛
                for (int s=1; y+s<6; s++) {//下
                  //for (int t=s; y+t<7||y-t>0; t++) {
                  //println(x, y+s);
                  if (flag[x][y+s]>=11) {
                    ownkikitameshi[x][y+s]=1;
                    break;
                  } else if (flag[x][y+s]!=0) {
                    break;
                  }
                  ownkikitameshi[x][y+s]=1;

                  //}
                }
                for (int s=1; x-s>0; s++) {//左
                  //for (int t=s; y+t<7||y-t>0; t++) {
                  if (flag[x-s][y]>=11) {
                    ownkikitameshi[x-s][y]=1;
                    break;
                  } else if (flag[x-s][y]!=0) {
                    break;
                  }
                  ownkikitameshi[x-s][y]=1;


                  //}
                }
                for (int s=1; x+s<6; s++) {//右
                  //for (int t=s; y+t<7||y-t>0; t++) {
                  if (flag[x+s][y]>=11) {
                    ownkikitameshi[x+s][y]=1;
                    break;
                  } else if (flag[x+s][y]!=0) {
                    break;
                  }
                  ownkikitameshi[x+s][y]=1;

                  //}
                }
                for (int s=1; y-s>0; s++) {//上
                  //for (int t=s; y+t<7||y-t>0; t++) {
                  if (flag[x][y-s]>=11) {
                    ownkikitameshi[x][y-s]=1;
                    break;
                  } else if (flag[x][y-s]!=0) {
                    break;
                  }
                  ownkikitameshi[x][y-s]=1;
                  //}
                }
              }

              if (flagtameshi[x][y]==6) {//王
                ownkikitameshi[x][y-1]=1;
                ownkikitameshi[x-1][y-1]=1;
                ownkikitameshi[x+1][y-1]=1;
                ownkikitameshi[x-1][y]=1;
                ownkikitameshi[x+1][y]=1;
                ownkikitameshi[x][y+1]=1;
                ownkikitameshi[x-1][y+1]=1;
                ownkikitameshi[x+1][y+1]=1;
              }

              if (flagtameshi[x][y]==8) {//馬
                for (int s=1; x+s<7&&y+s<7; s++) {
                  //for (int t=s; y+t<7; t++) {
                  if (flag[x+s][y+s]>=11) {
                    ownkikitameshi[x+s][y+s]=1;
                    break;
                  } else if (flag[x+s][y+s]!=0) {
                    break;
                  }
                  ownkikitameshi[x+s][y+s]=1;
                  //}
                }
                for (int s=1; x-s>0&&y+s<7; s++) {
                  //for (int t=s; y+t<7; t++) {
                  if (flag[x-s][y+s]>=11) {
                    ownkikitameshi[x-s][y+s]=1;
                    break;
                  } else if (flag[x-s][y+s]!=0) {
                    break;
                  }
                  ownkikitameshi[x-s][y+s]=1;
                  //}
                }
                for (int s=1; x+s<7&&y-s>0; s++) {
                  //for (int t=s; y-t>0; t++) {
                  if (flag[x+s][y-s]>=11) {
                    ownkikitameshi[x+s][y-s]=1;
                    break;
                  } else if (flag[x+s][y-s]!=0) {
                    break;
                  }
                  ownkikitameshi[x+s][y-s]=1;
                  //}
                }
                for (int s=1; x-s>0&&y-s>0; s++) {
                  //for (int t=s; y-t>0; t++) {
                  if (flag[x-s][y-s]>=11) {
                    ownkikitameshi[x-s][y-s]=1;
                    break;
                  } else if (flag[x-s][y-s]!=0) {
                    break;
                  }
                  ownkikitameshi[x-s][y-s]=1;
                  //}
                }
                ownkikitameshi[x][y-1]=1;
                ownkikitameshi[x-1][y]=1;
                ownkikitameshi[x+1][y]=1;
                ownkikitameshi[x][y+1]=1;
              }

              if (flagtameshi[x][y]==9) {//龍
                for (int s=1; y+s<6; s++) {//下
                  //for (int t=s; y+t<7||y-t>0; t++) {
                  //println(x, y+s);
                  if (flag[x][y+s]>=11) {
                    ownkikitameshi[x][y+s]=1;
                    break;
                  } else if (flag[x][y+s]!=0) {
                    break;
                  }
                  ownkikitameshi[x][y+s]=1;

                  //}
                }
                for (int s=1; x-s>0; s++) {//左
                  //for (int t=s; y+t<7||y-t>0; t++) {
                  if (flag[x-s][y]>=11) {
                    ownkikitameshi[x-s][y]=1;
                    break;
                  } else if (flag[x-s][y]!=0) {
                    break;
                  }
                  ownkikitameshi[x-s][y]=1;


                  //}
                }
                for (int s=1; x+s<6; s++) {//右
                  //for (int t=s; y+t<7||y-t>0; t++) {
                  if (flag[x+s][y]>=11) {
                    ownkikitameshi[x+s][y]=1;
                    break;
                  } else if (flag[x+s][y]!=0) {
                    break;
                  }
                  ownkikitameshi[x+s][y]=1;

                  //}
                }
                for (int s=1; y-s>0; s++) {//上
                  //for (int t=s; y+t<7||y-t>0; t++) {
                  if (flag[x][y-s]>=11) {
                    ownkikitameshi[x][y-s]=1;
                    break;
                  } else if (flag[x][y-s]!=0) {
                    break;
                  }
                  ownkikitameshi[x][y-s]=1;
                  //}
                }
                ownkikitameshi[x-1][y-1]=1;
                ownkikitameshi[x+1][y-1]=1;
                ownkikitameshi[x-1][y+1]=1;
                ownkikitameshi[x+1][y+1]=1;
              }
            }
          }


          //王取りがかかっていなければそのnをreturnする
          if (move.k!=16) {
            if (ownkikitameshi[xxx][yyy]==0) {
              return n;
            }
          } else if (ownkikitameshi[move.x2][move.y2]==0) {
            return n;
          }
        }

        //if (flag[x-1][y-1]<=10&&flag[x-1][y-1]>=0&&ownkiki[x-1][y-1]==0)//左上
        //{
        //  int a=FindMoveFromMovelist(x, y, x-1, y-1);
        //  if (a!=-1)
        //  {
        //    return a;
        //  }
        //}

        //if (flag[x+1][y-1]<=10&&flag[x+1][y-1]>=0&&ownkiki[x+1][y-1]==0)//右上
        //{
        //  int a=FindMoveFromMovelist(x, y, x+1, y-1);
        //  if (a!=-1)
        //  {
        //    return a;
        //  }
        //}

        //if (flag[x-1][y+1]<=10&&flag[x-1][y+1]>=0&&ownkiki[x-1][y+1]==0)//左下
        //{
        //  int a=FindMoveFromMovelist(x, y, x-1, y+1);
        //  if (a!=-1)
        //  {
        //    return a;
        //  }
        //}

        //if (flag[x+1][y+1]<=10&&flag[x+1][y+1]>=0&&ownkiki[x+1][y+1]==0)//右下
        //{
        //  int a=FindMoveFromMovelist(x, y, x+1, y+1);
        //  if (a!=-1)
        //  {
        //    return a;
        //  }
        //}

        //if (flag[x][y-1]<=10&&flag[x][y-1]>=0&&ownkiki[x][y-1]==0)//上
        //{
        //  int a=FindMoveFromMovelist(x, y, x, y-1);
        //  if (a!=-1)
        //  {
        //    return a;
        //  }
        //}

        //if (flag[x][y+1]<=10&&flag[x][y+1]>=0&&ownkiki[x][y+1]==0)//下
        //{
        //  int a=FindMoveFromMovelist(x, y, x, y+1);
        //  if (a!=-1)
        //  {
        //    return a;
        //  }
        //}

        //if (flag[x-1][y]<=10&&flag[x-1][y]>=0&&ownkiki[x-1][y]==0)//左
        //{
        //  int a=FindMoveFromMovelist(x, y, x-1, y);
        //  if (a!=-1)
        //  {
        //    return a;
        //  }
        //}

        //if (flag[x+1][y]<=10&&flag[x+1][y]>=0&&ownkiki[x+1][y]==0)//右
        //{
        //  int a=FindMoveFromMovelist(x, y, x+1, y);
        //  if (a!=-1)
        //  {
        //    return a;
        //  }
        //}
      }
    }
  }
  return -1;
}



int ouzibakuyoke(int n) {//王が自爆してたら-1を返す

  komamove move=komamovelist.get(n);
  //ownkikiのデータはあるものと仮定
  if (move.k==16) {
    if (ownkiki[move.x2][move.y2]==1) {
      return -1;
    }
  }

  return n;
}

int ownkiki[][] =new int [7][7];


int FindMoveFromMovelist(int x1, int y1, int x2, int y2)
{
  for (int i=0; i<komamovelist.size(); i++ )
  {
    komamove move=komamovelist.get(i);
    if (x1==move.x1&&y1==move.y1&&
      x2==move.x2&&y2==move.y2)
    {
      return i;
    }
  }

  return -1;
}

boolean ootekakatteru() {
  for (int y=0; y<7; y++)
  {
    for (int x=0; x<7; x++)
    {
      print(flag[x][y]+" ");
    }
    println();
  }

  for (int x=0; x<7; x++)
  {
    for (int y=0; y<7; y++)
    {
      ownkiki[x][y]=0;
    }
  }
  for (int x=0; x<7; x++)
  {
    for (int y=0; y<7; y++)
    {
      if (flag[x][y]==-1) ownkiki[x][y]=-1;

      if (flag[x][y]==1) {//歩
        ownkiki[x][y-1]=1;
      }

      if (flag[x][y]==2) {//銀
        ownkiki[x][y-1]=1;
        ownkiki[x-1][y-1]=1;
        ownkiki[x+1][y-1]=1;
        ownkiki[x-1][y+1]=1;
        ownkiki[x+1][y+1]=1;
      }

      //ここから先
      if (flag[x][y]==3||flag[x][y]==7||flag[x][y]==10) {//金
        ownkiki[x][y-1]=1;
        ownkiki[x-1][y-1]=1;
        ownkiki[x+1][y-1]=1;
        ownkiki[x-1][y]=1;
        ownkiki[x+1][y]=1;
        ownkiki[x][y+1]=1;
      }

      if (flag[x][y]==4) {//角
        for (int s=1; x+s<7&&y+s<7; s++) {
          //for (int t=s; y+t<7; t++) {
          if (flag[x+s][y+s]>=11) {
            ownkiki[x+s][y+s]=1;
            break;
          } else if (flag[x+s][y+s]!=0) {
            break;
          }

          ownkiki[x+s][y+s]=1;
          //}
        }
        for (int s=1; x-s>0&&y+s<7; s++) {
          //for (int t=s; y+t<7; t++) {
          if (flag[x-s][y+s]>=11) {
            ownkiki[x-s][y+s]=1;
            break;
          } else if (flag[x-s][y+s]!=0) {
            break;
          }

          ownkiki[x-s][y+s]=1;
          //}
        }
        for (int s=1; x+s<7&&y-s>0; s++) {
          //for (int t=s; y-t>0; t++) {
          if (flag[x+s][y-s]>=11) {
            ownkiki[x+s][y-s]=1;
            break;
          } else if (flag[x+s][y-s]!=0) {
            break;
          }

          ownkiki[x+s][y-s]=1;
          //}
        }
        for (int s=1; x-s>0&&y-s>0; s++) {
          //for (int t=s; y-t>0; t++) {
          if (flag[x-s][y-s]>=11) {
            ownkiki[x-s][y-s]=1;
            break;
          } else if (flag[x-s][y-s]!=0) {
            break;
          }

          ownkiki[x-s][y-s]=1;
          //}
        }
      }

      if (flag[x][y]==5) {//飛
        for (int s=1; y+s<6; s++) {//下
          //for (int t=s; y+t<7||y-t>0; t++) {                 
          if (flag[x][y+s]>=11) {
            ownkiki[x][y+s]=1;
            break;
          } else if (flag[x][y+s]!=0) {
            break;
          }
          ownkiki[x][y+s]=1;

          //}
        }
        for (int s=1; x-s>0; s++) {//左
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (flag[x-s][y]>=11) {
            ownkiki[x-s][y]=1;
            break;
          } else if (flag[x-s][y]!=0) {
            break;
          }
          ownkiki[x-s][y]=1;


          //}
        }
        for (int s=1; x+s<6; s++) {//右
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (flag[x+s][y]>=11) {
            ownkiki[x+s][y]=1;
            break;
          } else if (flag[x+s][y]!=0) {
            break;
          }
          ownkiki[x+s][y]=1;

          //}
        }
        for (int s=1; y-s>0; s++) {//上
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (flag[x][y-s]>=11) {
            ownkiki[x][y-s]=1;
            break;
          } else if (flag[x][y-s]!=0) {
            break;
          }
          ownkiki[x][y-s]=1;
          //}
        }
      }

      if (flag[x][y]==6) {//王
        ownkiki[x][y-1]=1;
        ownkiki[x-1][y-1]=1;
        ownkiki[x+1][y-1]=1;
        ownkiki[x-1][y]=1;
        ownkiki[x+1][y]=1;
        ownkiki[x][y+1]=1;
        ownkiki[x-1][y+1]=1;
        ownkiki[x+1][y+1]=1;
      }

      if (flag[x][y]==8) {//馬
        for (int s=1; x+s<7&&y+s<7; s++) {
          //for (int t=s; y+t<7; t++) {
          if (flag[x+s][y+s]>=11) {
            ownkiki[x+s][y+s]=1;
            break;
          } else if (flag[x+s][y+s]!=0) {
            break;
          }

          ownkiki[x+s][y+s]=1;
          //}
        }
        for (int s=1; x-s>0&&y+s<7; s++) {
          //for (int t=s; y+t<7; t++) {
          if (flag[x-s][y+s]>=11) {
            ownkiki[x-s][y+s]=1;
            break;
          } else if (flag[x-s][y+s]!=0) {
            break;
          }

          ownkiki[x-s][y+s]=1;
          //}
        }
        for (int s=1; x+s<7&&y-s>0; s++) {
          //for (int t=s; y-t>0; t++) {
          if (flag[x+s][y-s]>=11) {
            ownkiki[x+s][y-s]=1;
            break;
          } else if (flag[x+s][y-s]!=0) {
            break;
          }

          ownkiki[x+s][y-s]=1;
          //}
        }
        for (int s=1; x-s>0&&y-s>0; s++) {
          //for (int t=s; y-t>0; t++) {
          if (flag[x-s][y-s]>=11) {
            ownkiki[x-s][y-s]=1;
            break;
          } else if (flag[x-s][y-s]!=0) {
            break;
          }

          ownkiki[x-s][y-s]=1;
          //}
        }
        ownkiki[x][y-1]=1;
        ownkiki[x-1][y]=1;
        ownkiki[x+1][y]=1;
        ownkiki[x][y+1]=1;
      }

      if (flag[x][y]==9) {//龍
        for (int s=1; y+s<6; s++) {//下
          //for (int t=s; y+t<7||y-t>0; t++) {                 
          if (flag[x][y+s]>=11) {
            ownkiki[x][y+s]=1;
            break;
          } else if (flag[x][y+s]!=0) {
            break;
          }
          ownkiki[x][y+s]=1;

          //}
        }
        for (int s=1; x-s>0; s++) {//左
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (flag[x-s][y]>=11) {
            ownkiki[x-s][y]=1;
            break;
          } else if (flag[x-s][y]!=0) {
            break;
          }
          ownkiki[x-s][y]=1;


          //}
        }
        for (int s=1; x+s<6; s++) {//右
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (flag[x+s][y]>=11) {
            ownkiki[x+s][y]=1;
            break;
          } else if (flag[x+s][y]!=0) {
            break;
          }
          ownkiki[x+s][y]=1;

          //}
        }
        for (int s=1; y-s>0; s++) {//上
          //for (int t=s; y+t<7||y-t>0; t++) {
          if (flag[x][y-s]>=11) {
            ownkiki[x][y-s]=1;
            break;
          } else if (flag[x][y-s]!=0) {
            break;
          }
          ownkiki[x][y-s]=1;
          //}
        }
        ownkiki[x-1][y-1]=1;
        ownkiki[x+1][y-1]=1;
        ownkiki[x-1][y+1]=1;
        ownkiki[x+1][y+1]=1;
      }
    }
  }

  for (int y=1; y<6; y++)
  {
    for (int x=1; x<6; x++)
    {
      print(ownkiki[x][y] );
    }
    println();
  }


  for (int xxx=0; xxx<7; xxx++)
  {
    for (int yyy=0; yyy<7; yyy++)
    {
      if (flag[xxx][yyy]==16&&ownkiki[xxx][yyy]==1)//王手がかかっている
      {
        return true;
      }
    }
  }
  return false;
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
