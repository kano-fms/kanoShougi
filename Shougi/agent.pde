class agentHabu {
  agentHabu() {
  }

  void strategy() {
    makeKOMAmovelist(teban, komamovelist2);

    //ランダムに選ぶ
    int count=komamovelist2.size();
    if (count==0)
    {
      return ;
    }
    int number=0;

    //number=enemykomause();
    //if(number==-2){
    //return false;
    //}
    //if (number==-1) {
    number=ootorarerunigeru();//王手をかけられてたら逃げる  －1帰ってきたらコンピュータの王詰み
    //}

    if (number==-1) {
      number=ootoru();//王が取れたら取る
    }

    //if (number==-1) {  //一手詰め  　　　　　　　komamovelistの中身が途中で書き換えられていることに問題あり

    //  //プレイヤー2が試しに動かしてみる
    //  int [][] flagcopy=new int[7][7];
    //  int [][] motikomaflagcopy=new int[2][5];
    //  for (int n=0; n<komamovelist.size(); n++) {
    //    komamove move=komamovelist.get(n);

    //    for (int xx=0; xx<7; xx++)
    //    {
    //      for (int yy=0; yy<7; yy++)
    //      {
    //        flagcopy[xx][yy]=flag[xx][yy];
    //      }
    //    }

    //    for (int xx=0; xx<2; xx++)
    //    {
    //      for (int yy=0; yy<5; yy++)
    //      {
    //        motikomaflagcopy[xx][yy]=motigoma2[xx][yy];
    //      }
    //    }

    //    if (move.x1!=0||move.y1!=0) {
    //      int toru=flag[move.x2][move.y2];
    //      flag[move.x2][move.y2]=move.k;
    //      flag[move.x1][move.y1]=0;
    //      if (ootekaketerunigerareru()==-2) {
    //        number=n;

    //        for (int xx=0; xx<7; xx++)
    //        {
    //          for (int yy=0; yy<7; yy++)
    //          {
    //            flag[xx][yy]=flagcopy[xx][yy];
    //          }
    //        }

    //        for (int xx=0; xx<2; xx++)
    //        {
    //          for (int yy=0; yy<5; yy++)
    //          {
    //            motigoma2[xx][yy]=motikomaflagcopy[xx][yy];
    //          }
    //        }

    //        break;
    //      } else {
    //        for (int xx=0; xx<7; xx++)
    //        {
    //          for (int yy=0; yy<7; yy++)
    //          {
    //            flag[xx][yy]=flagcopy[xx][yy];
    //          }
    //        }

    //        for (int xx=0; xx<2; xx++)
    //        {
    //          for (int yy=0; yy<5; yy++)
    //          {
    //            motigoma2[xx][yy]=motikomaflagcopy[xx][yy];
    //          }
    //        }
    //      }
    //    }
    //  }
    //}

    while (number==-1)
    {
      number=(int)random(0, count);//ランダムに動かす
      number=ouzibakuyoke(number);//王が自爆してたら-1を返してループ
    }
    //if(number!=-2){
    print(number+" "+komamovelist2.size());
    komamove move=komamovelist2.get(number);
    println("相手は,", move.k, move.x1, move.y1, move.x2, move.y2);

    println("コンピューターは"+computerkihuoutput(move));
    kihu.add(computerkihuoutput(move));

    if (move.x1>=1&&move.x1<=5) {//指す手
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
    return ;
  }
}
