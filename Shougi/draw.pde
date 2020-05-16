void draw()
{
  background(255);

  //将棋盤
  strokeWeight(5);
  fill(200, 125, 0);
  rect(100, 100, 800, 800);
  line(260, 100, 260, 900);
  line(420, 100, 420, 900);
  line(580, 100, 580, 900);
  line(740, 100, 740, 900);
  line(100, 260, 900, 260);
  line(100, 420, 900, 420);
  line(100, 580, 900, 580);
  line(100, 740, 900, 740);

  for (int x=0; x<7; x++) {//動かせる位置の色変え
    for (int y=0; y<7; y++) {
      if (flag[x][y]==1&&komaflag==1) {//歩
        fill(230, 180, 0);
        if (flag[x][y-1]==0||flag[x][y-1]>10) {
          rect((x-1)*160+100, (y-2)*160+100, 160, 160);
        }
        fill(200, 125, 0);
      }
      if (flag[x][y]==2&&komaflag==2) {//銀
        fill(230, 180, 0);
        if (flag[x][y-1]==0||flag[x][y-1]>10) {
          rect((x-1)*160+100, (y-2)*160+100, 160, 160);
        }
        if (flag[x-1][y-1]==0||flag[x-1][y-1]>10) {
          rect((x-2)*160+100, (y-2)*160+100, 160, 160);
        }
        if (flag[x+1][y-1]==0||flag[x+1][y-1]>10) {
          rect(x*160+100, (y-2)*160+100, 160, 160);
        }
        if (flag[x-1][y+1]==0||flag[x-1][y+1]>10) {
          rect((x-2)*160+100, y*160+100, 160, 160);
        }
        if (flag[x+1][y+1]==0||flag[x+1][y+1]>10) {
          rect(x*160+100, y*160+100, 160, 160);
        }
        fill(200, 125, 0);
      }
      if ((flag[x][y]==3&&komaflag==3)||(flag[x][y]==7&&komaflag==7)||(flag[x][y]==10&&komaflag==10)) {//金
        fill(230, 180, 0);
        if (flag[x][y-1]==0||flag[x][y-1]>10) {
          rect((x-1)*160+100, (y-2)*160+100, 160, 160);
        }
        if (flag[x-1][y-1]==0||flag[x-1][y-1]>10) {
          rect((x-2)*160+100, (y-2)*160+100, 160, 160);
        }
        if (flag[x+1][y-1]==0||flag[x+1][y-1]>10) {
          rect(x*160+100, (y-2)*160+100, 160, 160);
        }
        if (flag[x-1][y]==0||flag[x-1][y]>10) {
          rect((x-2)*160+100, (y-1)*160+100, 160, 160);
        }
        if (flag[x+1][y]==0||flag[x+1][y]>10) {
          rect(x*160+100, (y-1)*160+100, 160, 160);
        }
        if (flag[x][y+1]==0||flag[x][y+1]>10) {
          rect((x-1)*160+100, y*160+100, 160, 160);
        }
        fill(200, 125, 0);
      }
      if (flag[x][y]==4&&komaflag==4) {//角
        fill(230, 180, 0);
        for (int d=0; d<4; d++) {
          for (int n=0; n<6; n++) {
            int xx=x+kakuX[d]*n;
            int yy=y+kakuY[d]*n;
            int f=flag[xx][yy];
            if (f==-1) {
              break;
            } else if (f==0||f>10) {
              rect((xx-1)*160+100, (yy-1)*160+100, 160, 160);
              if (f>10)break;
            }
          }
        }
        fill(200, 125, 0);
      }
      if (flag[x][y]==5&&komaflag==5) {//飛
        fill(230, 180, 0);
        for (int d=0; d<4; d++) {
          for (int n=0; n<6; n++) {
            int xx=x+hishaX[d]*n;
            int yy=y+hishaY[d]*n;
            int f=flag[xx][yy];
            if (f==-1) {
              break;
            } else if (f==0||f>10) {
              rect((xx-1)*160+100, (yy-1)*160+100, 160, 160);
              if (f>10)break;
            }
          }
        }
        fill(200, 125, 0);
      }
      if (flag[x][y]==6&&komaflag==6) {//王
        fill(230, 180, 0);
        if (flag[x][y-1]==0||flag[x][y-1]>10) {
          rect((x-1)*160+100, (y-2)*160+100, 160, 160);
        }
        if (flag[x-1][y-1]==0||flag[x-1][y-1]>10) {
          rect((x-2)*160+100, (y-2)*160+100, 160, 160);
        }
        if (flag[x+1][y-1]==0||flag[x+1][y-1]>10) {
          rect(x*160+100, (y-2)*160+100, 160, 160);
        }
        if (flag[x-1][y]==0||flag[x-1][y]>10) {
          rect((x-2)*160+100, (y-1)*160+100, 160, 160);
        }
        if (flag[x+1][y]==0||flag[x+1][y]>10) {
          rect(x*160+100, (y-1)*160+100, 160, 160);
        }
        if (flag[x][y+1]==0||flag[x][y+1]>10) {
          rect((x-1)*160+100, y*160+100, 160, 160);
        }
        if (flag[x-1][y+1]==0||flag[x-1][y+1]>10) {
          rect((x-2)*160+100, y*160+100, 160, 160);
        }
        if (flag[x+1][y+1]==0||flag[x+1][y+1]>10) {
          rect(x*160+100, y*160+100, 160, 160);
        }
        fill(200, 125, 0);
      }

      if (flag[x][y]==8&&komaflag==8) {//馬
        fill(230, 180, 0);
        for (int d=0; d<4; d++) {
          for (int n=0; n<6; n++) {
            int xx=x+kakuX[d]*n;
            int yy=y+kakuY[d]*n;
            int f=flag[xx][yy];
            if (f==-1) {
              break;
            } else if (f==0||f>10) {
              rect((xx-1)*160+100, (yy-1)*160+100, 160, 160);
              if (f>10)break;
            }
          }
        }
        if (flag[x][y-1]==0||flag[x][y-1]>10) {
          rect((x-1)*160+100, (y-2)*160+100, 160, 160);
        }
        if (flag[x][y+1]==0||flag[x][y+1]>10) {
          rect((x-1)*160+100, y*160+100, 160, 160);
        }
        if (flag[x-1][y]==0||flag[x-1][y]>10) {
          rect((x-2)*160+100, (y-1)*160+100, 160, 160);
        }
        if (flag[x+1][y]==0||flag[x+1][y]>10) {
          rect(x*160+100, (y-1)*160+100, 160, 160);
        }
        fill(200, 125, 0);
      }

      if (flag[x][y]==9&&komaflag==9) {//龍
        fill(230, 180, 0);
        for (int d=0; d<4; d++) {
          for (int n=0; n<6; n++) {
            int xx=x+hishaX[d]*n;
            int yy=y+hishaY[d]*n;
            int f=flag[xx][yy];
            if (f==-1) {
              break;
            } else if (f==0||f>10) {
              rect((xx-1)*160+100, (yy-1)*160+100, 160, 160);
              if (f>10)break;
            }
          }
        }
        if (flag[x-1][y-1]==0||flag[x-1][y-1]>10) {
          rect((x-2)*160+100, (y-2)*160+100, 160, 160);
        }
        if (flag[x+1][y-1]==0||flag[x+1][y-1]>10) {
          rect(x*160+100, (y-2)*160+100, 160, 160);
        }
        if (flag[x-1][y+1]==0||flag[x-1][y+1]>10) {
          rect((x-2)*160+100, y*160+100, 160, 160);
        }
        if (flag[x+1][y+1]==0||flag[x+1][y+1]>10) {
          rect(x*160+100, y*160+100, 160, 160);
        }
        fill(200, 125, 0);
      }
    }
  }

  if (teban==0)
  {
    ellipse(950, 850, 50, 50);//番確認
  } else if (teban==1) {
    ellipse(950, 150, 50, 50);//
  }

  //持ち将棋駒
  fill(200, 125, 0);
  rect(1000, 100, 600, 800);
  PFont font = createFont("Yu Gothic", 64, true);
  textFont(font);
  textSize(80);
  fill(0);
  strokeWeight(2);
  if (motigoma1[0][0]==1)
  {
    line(900+180, 500+130, 900+140, 500+150);
    line(900+140, 500+150, 900+130, 500+230);
    line(900+130, 500+230, 900+230, 500+230);
    line(900+230, 500+230, 900+220, 500+150);
    line(900+220, 500+150, 900+180, 500+130);
    text("歩", 900+140, 500+220);
  }
  if (motigoma1[1][0]==1)
  {
    line(900+180, 660+130, 900+140, 660+150);
    line(900+140, 660+150, 900+130, 660+230);
    line(900+130, 660+230, 900+230, 660+230);
    line(900+230, 660+230, 900+220, 660+150);
    line(900+220, 660+150, 900+180, 660+130);
    text("歩", 900+140, 660+220);
  }
  if (motigoma1[0][1]==1)
  {
    line(1000+180, 500+130, 1000+140, 500+150);
    line(1000+140, 500+150, 1000+130, 500+230);
    line(1000+130, 500+230, 1000+230, 500+230);
    line(1000+230, 500+230, 1000+220, 500+150);
    line(1000+220, 500+150, 1000+180, 500+130);
    text("銀", 1000+140, 500+220);
  }
  if (motigoma1[1][1]==1)
  {
    line(1000+180, 660+130, 1000+140, 660+150);
    line(1000+140, 660+150, 1000+130, 660+230);
    line(1000+130, 660+230, 1000+230, 660+230);
    line(1000+230, 660+230, 1000+220, 660+150);
    line(1000+220, 660+150, 1000+180, 660+130);
    text("銀", 1000+140, 660+220);
  }
  if (motigoma1[0][2]==1)
  {
    line(1100+180, 500+130, 1100+140, 500+150);
    line(1100+140, 500+150, 1100+130, 500+230);
    line(1100+130, 500+230, 1100+230, 500+230);
    line(1100+230, 500+230, 1100+220, 500+150);
    line(1100+220, 500+150, 1100+180, 500+130);
    text("金", 1100+140, 500+220);
  }
  if (motigoma1[1][2]==1)
  {
    line(1100+180, 660+130, 1100+140, 660+150);
    line(1100+140, 660+150, 1100+130, 660+230);
    line(1100+130, 660+230, 1100+230, 660+230);
    line(1100+230, 660+230, 1100+220, 660+150);
    line(1100+220, 660+150, 1100+180, 660+130);
    text("金", 1100+140, 660+220);
  }
  if (motigoma1[0][3]==1)
  {
    line(1200+180, 500+130, 1200+140, 500+150);
    line(1200+140, 500+150, 1200+130, 500+230);
    line(1200+130, 500+230, 1200+230, 500+230);
    line(1200+230, 500+230, 1200+220, 500+150);
    line(1200+220, 500+150, 1200+180, 500+130);
    text("角", 1200+140, 500+220);
  }
  if (motigoma1[1][3]==1)
  {
    line(1200+180, 660+130, 1200+140, 660+150);
    line(1200+140, 660+150, 1200+130, 660+230);
    line(1200+130, 660+230, 1200+230, 660+230);
    line(1200+230, 660+230, 1200+220, 660+150);
    line(1200+220, 660+150, 1200+180, 660+130);
    text("角", 1200+140, 660+220);
  }
  if (motigoma1[0][4]==1)
  {
    line(1300+180, 500+130, 1300+140, 500+150);
    line(1300+140, 500+150, 1300+130, 500+230);
    line(1300+130, 500+230, 1300+230, 500+230);
    line(1300+230, 500+230, 1300+220, 500+150);
    line(1300+220, 500+150, 1300+180, 500+130);
    text("飛", 1300+140, 500+220);
  }
  if (motigoma1[1][4]==1)
  {
    line(1300+180, 660+130, 1300+140, 660+150);
    line(1300+140, 660+150, 1300+130, 660+230);
    line(1300+130, 660+230, 1300+230, 660+230);
    line(1300+230, 660+230, 1300+220, 660+150);
    line(1300+220, 660+150, 1300+180, 660+130);
    text("飛", 1300+140, 660+220);
  }

  if (motigoma2[0][0]==1)
  {
    pushMatrix();
    translate(900+220, 180+100);
    rotate(PI);
    text("歩", 0, 0);
    translate(80, -70);
    line(-40, -20, -80, 0);
    line(-80, 0, -90, 80);
    line(-90, 80, 10, 80);
    line(10, 80, 0, 0);
    line(0, 0, -40, -20);
    popMatrix();
  }
  if (motigoma2[1][0]==1)
  {
    pushMatrix();
    translate(900+220, 120);
    rotate(PI);
    text("歩", 0, 0);
    translate(80, -70);
    line(-40, -20, -80, 0);
    line(-80, 0, -90, 80);
    line(-90, 80, 10, 80);
    line(10, 80, 0, 0);
    line(0, 0, -40, -20);
    popMatrix();
  }
  if (motigoma2[0][1]==1)
  {
    pushMatrix();
    translate(900+320, 180+100);
    rotate(PI);
    text("銀", 0, 0);
    translate(80, -70);
    line(-40, -20, -80, 0);
    line(-80, 0, -90, 80);
    line(-90, 80, 10, 80);
    line(10, 80, 0, 0);
    line(0, 0, -40, -20);
    popMatrix();
  }
  if (motigoma2[1][1]==1)
  {
    pushMatrix();
    translate(900+320, 120);
    rotate(PI);
    text("銀", 0, 0);
    translate(80, -70);
    line(-40, -20, -80, 0);
    line(-80, 0, -90, 80);
    line(-90, 80, 10, 80);
    line(10, 80, 0, 0);
    line(0, 0, -40, -20);
    popMatrix();
  }
  if (motigoma2[0][2]==1)
  {
    pushMatrix();
    translate(900+420, 180+100);
    rotate(PI);
    text("金", 0, 0);
    translate(80, -70);
    line(-40, -20, -80, 0);
    line(-80, 0, -90, 80);
    line(-90, 80, 10, 80);
    line(10, 80, 0, 0);
    line(0, 0, -40, -20);
    popMatrix();
  }
  if (motigoma2[1][2]==1)
  {
    pushMatrix();
    translate(900+420, 120);
    rotate(PI);
    text("金", 0, 0);
    translate(80, -70);
    line(-40, -20, -80, 0);
    line(-80, 0, -90, 80);
    line(-90, 80, 10, 80);
    line(10, 80, 0, 0);
    line(0, 0, -40, -20);
    popMatrix();
  }
  if (motigoma2[0][3]==1)
  {
    pushMatrix();
    translate(900+520, 180+100);
    rotate(PI);
    text("角", 0, 0);
    translate(80, -70);
    line(-40, -20, -80, 0);
    line(-80, 0, -90, 80);
    line(-90, 80, 10, 80);
    line(10, 80, 0, 0);
    line(0, 0, -40, -20);
    popMatrix();
  }
  if (motigoma2[1][3]==1)
  {
    pushMatrix();
    translate(900+520, 120);
    rotate(PI);
    text("角", 0, 0);
    translate(80, -70);
    line(-40, -20, -80, 0);
    line(-80, 0, -90, 80);
    line(-90, 80, 10, 80);
    line(10, 80, 0, 0);
    line(0, 0, -40, -20);
    popMatrix();
  }
  if (motigoma2[0][4]==1)
  {
    pushMatrix();
    translate(900+620, 180+100);
    rotate(PI);
    text("飛", 0, 0);
    translate(80, -70);
    line(-40, -20, -80, 0);
    line(-80, 0, -90, 80);
    line(-90, 80, 10, 80);
    line(10, 80, 0, 0);
    line(0, 0, -40, -20);
    popMatrix();
  }
  if (motigoma2[1][4]==1)
  {
    pushMatrix();
    translate(900+620, 120);
    rotate(PI);
    text("飛", 0, 0);
    translate(80, -70);
    line(-40, -20, -80, 0);
    line(-80, 0, -90, 80);
    line(-90, 80, 10, 80);
    line(10, 80, 0, 0);
    line(0, 0, -40, -20);
    popMatrix();
  }


  //駒描画
  strokeWeight(2);
  textSize(80);
  fill(0);

  //サイコロ描画
  fill(255);

  rect(1150, 450, 100, 100);//自分サイコロ
  if (dice1==1) {
    fill(255, 0, 0);
    ellipse(1200, 500, 50, 50);
    fill(255);
  } else if (dice1==2) {
    fill(0);
    ellipse(1175, 475, 20, 20);
    ellipse(1225, 525, 20, 20);
    fill(255);
  } else if (dice1==3) {
    fill(0);
    ellipse(1175, 475, 20, 20);
    ellipse(1200, 500, 20, 20);
    ellipse(1225, 525, 20, 20);
    fill(255);
  } else if (dice1==4) {
    fill(0);
    ellipse(1175, 475, 20, 20);
    ellipse(1225, 525, 20, 20);
    ellipse(1175, 525, 20, 20);
    ellipse(1225, 475, 20, 20);
    fill(255);
  } else if (dice1==5) {
    fill(0);
    ellipse(1175, 475, 20, 20);
    ellipse(1225, 525, 20, 20);
    ellipse(1200, 500, 20, 20);
    ellipse(1175, 525, 20, 20);
    ellipse(1225, 475, 20, 20);
    fill(255);
  } else if (dice1==6) {
    fill(0);
    ellipse(1175, 475, 20, 20);
    ellipse(1225, 525, 20, 20);
    ellipse(1175, 525, 20, 20);
    ellipse(1225, 475, 20, 20);
    ellipse(1175, 500, 20, 20);
    ellipse(1225, 500, 20, 20);
    fill(255);
  }

  rect(1350, 450, 100, 100);//相手サイコロ
  if (dice2==1) {
    fill(255, 0, 0);
    ellipse(1400, 500, 50, 50);
    fill(255);
  } else if (dice2==2) {
    fill(0);
    ellipse(1375, 475, 20, 20);
    ellipse(1425, 525, 20, 20);
    fill(255);
  } else if (dice2==3) {
    fill(0);
    ellipse(1375, 475, 20, 20);
    ellipse(1400, 500, 20, 20);
    ellipse(1425, 525, 20, 20);
    fill(255);
  } else if (dice2==4) {
    fill(0);
    ellipse(1375, 475, 20, 20);
    ellipse(1425, 525, 20, 20);
    ellipse(1375, 525, 20, 20);
    ellipse(1425, 475, 20, 20);
    fill(255);
  } else if (dice2==5) {
    fill(0);
    ellipse(1375, 475, 20, 20);
    ellipse(1425, 525, 20, 20);
    ellipse(1400, 500, 20, 20);
    ellipse(1375, 525, 20, 20);
    ellipse(1425, 475, 20, 20);
    fill(255);
  } else if (dice2==6) {
    fill(0);
    ellipse(1375, 475, 20, 20);
    ellipse(1425, 525, 20, 20);
    ellipse(1375, 525, 20, 20);
    ellipse(1425, 475, 20, 20);
    ellipse(1375, 500, 20, 20);
    ellipse(1425, 500, 20, 20);
    fill(255);
  }

  fill(0);

  //駒移動表示
  //for (int x=0; x<7; x=x+1)
  //{
  //  for (int y=0; y<7; y=y+1)
  //  {
  //    if (komaflag==2||motikomaflag==2) {
  //      x=mouseX-180;
  //      y=mouseY-180;
  //      line(x+180, y+130, x+140, y+150);
  //      line(x+140, y+150, x+130, y+230);
  //      line(x+130, y+230, x+230, y+230);
  //      line(x+230, y+230, x+220, y+150);
  //      line(x+220, y+150, x+180, y+130);
  //      text("銀", x+140, y+220);
  //    }
  //  }
  //}

  //駒自分
  for (int x=0; x<7; x=x+1)
  {
    for (int y=0; y<7; y=y+1)
    {
      //歩
      if (flag[x][y]==1)
      {
        line((x-1)*160+180, (y-1)*160+130, (x-1)*160+140, (y-1)*160+150);
        line((x-1)*160+140, (y-1)*160+150, (x-1)*160+130, (y-1)*160+230);
        line((x-1)*160+130, (y-1)*160+230, (x-1)*160+230, (y-1)*160+230);
        line((x-1)*160+230, (y-1)*160+230, (x-1)*160+220, (y-1)*160+150);
        line((x-1)*160+220, (y-1)*160+150, (x-1)*160+180, (y-1)*160+130);
        text("歩", (x-1)*160+140, (y-1)*160+220);
      }

      //銀
      if (flag[x][y]==2)
      {
        line((x-1)*160+180, (y-1)*160+130, (x-1)*160+140, (y-1)*160+150);
        line((x-1)*160+140, (y-1)*160+150, (x-1)*160+130, (y-1)*160+230);
        line((x-1)*160+130, (y-1)*160+230, (x-1)*160+230, (y-1)*160+230);
        line((x-1)*160+230, (y-1)*160+230, (x-1)*160+220, (y-1)*160+150);
        line((x-1)*160+220, (y-1)*160+150, (x-1)*160+180, (y-1)*160+130);
        text("銀", (x-1)*160+140, (y-1)*160+220);
      }

      //金
      if (flag[x][y]==3)
      {
        line((x-1)*160+180, (y-1)*160+130, (x-1)*160+140, (y-1)*160+150);
        line((x-1)*160+140, (y-1)*160+150, (x-1)*160+130, (y-1)*160+230);
        line((x-1)*160+130, (y-1)*160+230, (x-1)*160+230, (y-1)*160+230);
        line((x-1)*160+230, (y-1)*160+230, (x-1)*160+220, (y-1)*160+150);
        line((x-1)*160+220, (y-1)*160+150, (x-1)*160+180, (y-1)*160+130);
        text("金", (x-1)*160+140, (y-1)*160+220);
      }

      //角
      if (flag[x][y]==4)
      {
        line((x-1)*160+180, (y-1)*160+130, (x-1)*160+140, (y-1)*160+150);
        line((x-1)*160+140, (y-1)*160+150, (x-1)*160+130, (y-1)*160+230);
        line((x-1)*160+130, (y-1)*160+230, (x-1)*160+230, (y-1)*160+230);
        line((x-1)*160+230, (y-1)*160+230, (x-1)*160+220, (y-1)*160+150);
        line((x-1)*160+220, (y-1)*160+150, (x-1)*160+180, (y-1)*160+130);
        text("角", (x-1)*160+140, (y-1)*160+220);
      }

      //飛
      if (flag[x][y]==5)
      {
        line((x-1)*160+180, (y-1)*160+130, (x-1)*160+140, (y-1)*160+150);
        line((x-1)*160+140, (y-1)*160+150, (x-1)*160+130, (y-1)*160+230);
        line((x-1)*160+130, (y-1)*160+230, (x-1)*160+230, (y-1)*160+230);
        line((x-1)*160+230, (y-1)*160+230, (x-1)*160+220, (y-1)*160+150);
        line((x-1)*160+220, (y-1)*160+150, (x-1)*160+180, (y-1)*160+130);
        text("飛", (x-1)*160+140, (y-1)*160+220);
      }

      //王
      if (flag[x][y]==6)
      {
        line((x-1)*160+180, (y-1)*160+130, (x-1)*160+140, (y-1)*160+150);
        line((x-1)*160+140, (y-1)*160+150, (x-1)*160+130, (y-1)*160+230);
        line((x-1)*160+130, (y-1)*160+230, (x-1)*160+230, (y-1)*160+230);
        line((x-1)*160+230, (y-1)*160+230, (x-1)*160+220, (y-1)*160+150);
        line((x-1)*160+220, (y-1)*160+150, (x-1)*160+180, (y-1)*160+130);
        text("王", (x-1)*160+140, (y-1)*160+220);
      }

      //と
      if (flag[x][y]==7) {
        line((x-1)*160+180, (y-1)*160+130, (x-1)*160+140, (y-1)*160+150);
        line((x-1)*160+140, (y-1)*160+150, (x-1)*160+130, (y-1)*160+230);
        line((x-1)*160+130, (y-1)*160+230, (x-1)*160+230, (y-1)*160+230);
        line((x-1)*160+230, (y-1)*160+230, (x-1)*160+220, (y-1)*160+150);
        line((x-1)*160+220, (y-1)*160+150, (x-1)*160+180, (y-1)*160+130);
        fill(255, 0, 0);
        text("と", (x-1)*160+140, (y-1)*160+220);
        fill(0);
      }

      //馬
      if (flag[x][y]==8) {
        line((x-1)*160+180, (y-1)*160+130, (x-1)*160+140, (y-1)*160+150);
        line((x-1)*160+140, (y-1)*160+150, (x-1)*160+130, (y-1)*160+230);
        line((x-1)*160+130, (y-1)*160+230, (x-1)*160+230, (y-1)*160+230);
        line((x-1)*160+230, (y-1)*160+230, (x-1)*160+220, (y-1)*160+150);
        line((x-1)*160+220, (y-1)*160+150, (x-1)*160+180, (y-1)*160+130);
        fill(255, 0, 0);
        text("馬", (x-1)*160+140, (y-1)*160+220);
        fill(0);
      }

      //龍
      if (flag[x][y]==9) {
        line((x-1)*160+180, (y-1)*160+130, (x-1)*160+140, (y-1)*160+150);
        line((x-1)*160+140, (y-1)*160+150, (x-1)*160+130, (y-1)*160+230);
        line((x-1)*160+130, (y-1)*160+230, (x-1)*160+230, (y-1)*160+230);
        line((x-1)*160+230, (y-1)*160+230, (x-1)*160+220, (y-1)*160+150);
        line((x-1)*160+220, (y-1)*160+150, (x-1)*160+180, (y-1)*160+130);
        fill(255, 0, 0);
        text("龍", (x-1)*160+140, (y-1)*160+220);
        fill(0);
      }

      //成銀
      if (flag[x][y]==10) {
        line((x-1)*160+180, (y-1)*160+130, (x-1)*160+140, (y-1)*160+150);
        line((x-1)*160+140, (y-1)*160+150, (x-1)*160+130, (y-1)*160+230);
        line((x-1)*160+130, (y-1)*160+230, (x-1)*160+230, (y-1)*160+230);
        line((x-1)*160+230, (y-1)*160+230, (x-1)*160+220, (y-1)*160+150);
        line((x-1)*160+220, (y-1)*160+150, (x-1)*160+180, (y-1)*160+130);
        fill(255, 0, 0);
        text("金", (x-1)*160+140, (y-1)*160+220);
        fill(0);
      }
    }
  }

  //駒相手

  for (int x=0; x<7; x=x+1)
  {
    for (int y=0; y<7; y=y+1)
    {
      //歩
      if (flag[x][y]==11)
      {
        pushMatrix();
        translate((x-1)*160+220, (y-1)*160+150);
        rotate(PI);
        text("歩", 0, 0);
        translate(80, -70);
        line(-40, -20, -80, 0);
        line(-80, 0, -90, 80);
        line(-90, 80, 10, 80);
        line(10, 80, 0, 0);
        line(0, 0, -40, -20);
        popMatrix();
      }

      //銀
      if (flag[x][y]==12)
      {
        pushMatrix();
        translate((x-1)*160+220, (y-1)*160+150);
        rotate(PI);
        text("銀", 0, 0);
        translate(80, -70);
        line(-40, -20, -80, 0);
        line(-80, 0, -90, 80);
        line(-90, 80, 10, 80);
        line(10, 80, 0, 0);
        line(0, 0, -40, -20);
        popMatrix();
      }

      //金
      if (flag[x][y]==13)
      {
        pushMatrix();
        translate((x-1)*160+220, (y-1)*160+150);
        rotate(PI);
        text("金", 0, 0);
        translate(80, -70);
        line(-40, -20, -80, 0);
        line(-80, 0, -90, 80);
        line(-90, 80, 10, 80);
        line(10, 80, 0, 0);
        line(0, 0, -40, -20);
        popMatrix();
      }

      //角
      if (flag[x][y]==14)
      {
        pushMatrix();
        translate((x-1)*160+220, (y-1)*160+150);
        rotate(PI);
        text("角", 0, 0);
        translate(80, -70);
        line(-40, -20, -80, 0);
        line(-80, 0, -90, 80);
        line(-90, 80, 10, 80);
        line(10, 80, 0, 0);
        line(0, 0, -40, -20);
        popMatrix();
      }

      //飛
      if (flag[x][y]==15)
      {
        pushMatrix();
        translate((x-1)*160+220, (y-1)*160+150);
        rotate(PI);
        text("飛", 0, 0);
        translate(80, -70);
        line(-40, -20, -80, 0);
        line(-80, 0, -90, 80);
        line(-90, 80, 10, 80);
        line(10, 80, 0, 0);
        line(0, 0, -40, -20);
        popMatrix();
      }

      //玉
      if (flag[x][y]==16)
      {
        pushMatrix();
        translate((x-1)*160+220, (y-1)*160+150);
        rotate(PI);
        text("玉", 0, 0);
        translate(80, -70);
        line(-40, -20, -80, 0);
        line(-80, 0, -90, 80);
        line(-90, 80, 10, 80);
        line(10, 80, 0, 0);
        line(0, 0, -40, -20);
        popMatrix();
      }

      //と
      if (flag[x][y]==17) {
        pushMatrix();
        translate((x-1)*160+220, (y-1)*160+150);
        rotate(PI);
        fill(255, 0, 0);
        text("と", 0, 0);
        fill(0);
        translate(80, -70);
        line(-40, -20, -80, 0);
        line(-80, 0, -90, 80);
        line(-90, 80, 10, 80);
        line(10, 80, 0, 0);
        line(0, 0, -40, -20);
        popMatrix();
      }

      //馬
      if (flag[x][y]==18) {
        pushMatrix();
        translate((x-1)*160+220, (y-1)*160+150);
        rotate(PI);
        fill(255, 0, 0);
        text("馬", 0, 0);
        fill(0);
        translate(80, -70);
        line(-40, -20, -80, 0);
        line(-80, 0, -90, 80);
        line(-90, 80, 10, 80);
        line(10, 80, 0, 0);
        line(0, 0, -40, -20);
        popMatrix();
      }

      //龍
      if (flag[x][y]==19) {
        pushMatrix();
        translate((x-1)*160+220, (y-1)*160+150);
        rotate(PI);
        fill(255, 0, 0);
        text("龍", 0, 0);
        fill(0);
        translate(80, -70);
        line(-40, -20, -80, 0);
        line(-80, 0, -90, 80);
        line(-90, 80, 10, 80);
        line(10, 80, 0, 0);
        line(0, 0, -40, -20);
        popMatrix();
      }

      //成銀
      if (flag[x][y]==20) {
        pushMatrix();
        translate((x-1)*160+220, (y-1)*160+150);
        rotate(PI);
        fill(255, 0, 0);
        text("金", 0, 0);
        fill(0);
        translate(80, -70);
        line(-40, -20, -80, 0);
        line(-80, 0, -90, 80);
        line(-90, 80, 10, 80);
        line(10, 80, 0, 0);
        line(0, 0, -40, -20);
        popMatrix();
      }
    }
  }

  //勝敗結果
  fill(255);
  if (syouriflag==1)
  {
    rect(600, 250, 500, 500);
    fill(0);
    line(600, 650, 1100, 650);
    line(850, 650, 850, 750);
    textSize(200);
    fill(255, 0, 0);
    text("勝利", 650, 550);
    textSize(50);
    fill(0);
    text("もう一度", 625, 720);
    text("止める", 900, 720);
  }
  if (syouriflag==2)
  {
    rect(600, 250, 500, 500);
    fill(0);
    line(600, 650, 1100, 650);
    line(850, 650, 850, 750);
    textSize(200);
    fill(0, 0, 255);
    text("敗北", 650, 550);
    textSize(50);
    fill(0);
    text("もう一度", 625, 720);
    text("止める", 900, 720);
  }
  fill(0);

  if (phase==PHASE.Player1Sasu) {
    //駒成り
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
    }
  }

  if (phase==PHASE.Player2Sasu) {
    for (int n=0; n<7; n=n+1)
    {
      if (flag[n][5]==11)
      {
        flag[n][5]=17;//相手と
      }
      if (flag[n][5]==12)
      {
        flag[n][5]=20;//相手成銀phase==PHASE.Player1Move
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

  if (phase==PHASE.Player1Start) {
    phase = PHASE.Player1Dice;
  }
  
  if (phase==PHASE.Player1Strategy) {
    phase = PHASE.Player1Tenitoru;
  }
  
   if (phase==PHASE.Player2Start) {
    phase = PHASE.Player2Dice;
  }
  
  if (phase==PHASE.Player2Strategy) {
    byou=millis();
    makeKOMAmovelist();
    enemystrategy();
    komaflag=-1;
    teban=0;
    phase = PHASE.Player1Start;
    println((millis()-byou)+"ms");
  }
}
