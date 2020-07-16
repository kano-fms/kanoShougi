String computerkihuoutput(komamove move) {
  if (compsengo==0) {
    if(move.x1==0){
      return "-"+"0"+""+"0"+""+(6-move.x2)+""+move.y2+" "+komaname(move.k)+":"+dice2;
    }
    return "-"+(6-move.x1)+""+move.y1+""+(6-move.x2)+""+move.y2+" "+komaname(move.k)+":"+dice2;
  } else {
    
    return "+"+move.x1+""+(6-move.y1)+""+move.x2+""+(6-move.y2)+" "+komaname(move.k)+":"+dice2;
  }
}

String hitokihuoutput(int x1, int y1, int x2, int y2, int k) {
  if (compsengo==0) {
    if(x1==0){
      return "+"+"0"+""+"0"+""+(6-x2)+""+y2+" "+komaname(k)+":"+dice1;
    }
    return "+"+(6-x1)+""+y1+""+(6-x2)+""+y2+" "+komaname(k)+":"+dice1;
  } else {
    
    return "-"+x1+""+(6-y1)+""+x2+""+(6-y2)+" "+komaname(k)+":"+dice1;
  }
}

String komaname(int k) {
  if (k==1||k==11) {
    return "FU";
  } else if (k==2||k==12) {
    return "GI";
  } else if (k==3||k==13) {
    return "KI";
  } else if (k==4||k==14) {
    return "KA";
  } else if (k==5||k==15) {
    return "HI";
  } else if (k==6||k==16) {
    return "OU";
  } else if (k==7||k==17) {
    return "TO";
  } else if (k==8||k==18) {
    return "UM";
  } else if (k==9||k==19) {
    return "RY";
  } else if (k==10||k==20) {
    return "NG";
  }

  return "";
}
