String computerkihuoutput(komamove move) {
  if (compsengo==0) {
    return "-"+move.x1+""+move.y1+""+move.x2+""+move.y2+" "+komaname(move.k)+":"+dice2;
  } else {
    return "+"+move.x1+""+move.y1+""+move.x2+""+move.y2+" "+komaname(move.k)+":"+dice2;
  }
}

String komaname(int k) {
  if (k==11) {
    return "FU";
  } else if (k==12) {
    return "GI";
  } else if (k==13) {
    return "kI";
  } else if (k==14) {
    return "KA";
  } else if (k==15) {
    return "HI";
  } else if (k==16) {
    return "OU";
  } else if (k==17) {
    return "TO";
  } else if (k==18) {
    return "UM";
  } else if (k==19) {
    return "RY";
  } else if (k==20) {
    return "NG";
  }

  return "";
}
