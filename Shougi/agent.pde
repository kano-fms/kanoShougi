class agentHabu {
  agentHabu() {
  }

  void strategy() {

    //ランダムに選ぶ
    int count=komamovelist.size();
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
