void shakeDice1() {
  if (key=='1') {
    dice1=1;
    komaflag=0;
    phase = PHASE.Player1Strategy;
  } else if (key=='2') {
    dice1=2;
    komaflag=0;
    phase = PHASE.Player1Strategy;
  } else if (key=='3') {
    dice1=3;
    komaflag=0;
    phase = PHASE.Player1Strategy;
  } else if (key=='4') {
    dice1=4;
    komaflag=0;
    phase = PHASE.Player1Strategy;
  } else if (key=='5') {
    dice1=5;
    komaflag=0;
    phase = PHASE.Player1Strategy;
  } else if (key=='6') {
    dice1=6;
    komaflag=0;
    phase = PHASE.Player1Strategy;
  } else {
  }
  if (ootekaketeru()==true) {//P2がP1に王手をかけていたらdice1=6
    dice1=6;
    phase = PHASE.Player1Strategy;
  }

  makeKOMAmovelist();
  if (komamovelist.size()==0) {//動かせるところがなかったらdice1=6
    dice1=6;
    phase = PHASE.Player1Strategy;
  }
}

void shakeDice2() {
  dice2musidekiru=false;
  if (key=='1') {
    dice2=1;
    phase = PHASE.Player2Strategy;
  } else if (key=='2') {
    dice2=2;
    phase = PHASE.Player2Strategy;
  } else if (key=='3') {
    dice2=3;
    phase = PHASE.Player2Strategy;
  } else if (key=='4') {
    dice2=4;
    phase = PHASE.Player2Strategy;
  } else if (key=='5') {
    dice2=5;
    phase = PHASE.Player2Strategy;
  } else if (key=='6') {
    dice2=6;
    phase = PHASE.Player2Strategy;
  } else {
  }
  if (ootekakatteru()) {
    //    dice2musidekiru=true;
    dice2=6;
    phase = PHASE.Player2Strategy;
  }
  makeKOMAmovelist();
  if (komamovelist.size()==0) {//動かせるところがなかったらdice2=6
    dice2=6;
    phase = PHASE.Player2Strategy;
  }
}