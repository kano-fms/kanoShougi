void throw_dice1(){
    if (mouseX>1150&&mouseX<1250&&mouseY>450&&mouseY<550)//自分サイコロを振る                          　ここから
    {
      dice1=(int)random(1, 7);
      komaflag=0;
    }
}
