unit Noughtsandcrosses_p;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, pngimage, math;

type
  TForm2 = class(TForm)
    Image1: TImage;
    imgTopLeft: TImage;
    imgtopmid: TImage;
    imgTopRight: TImage;
    imgmidright: TImage;
    imgbotLeft: TImage;
    imgMId: TImage;
    imgMidLeft: TImage;
    imgBotmid: TImage;
    imgbotright: TImage;
    pnlCover: TPanel;
    btnRestart: TButton;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure imgTopLeftClick(Sender: TObject);
    procedure imgtopmidClick(Sender: TObject);
    procedure imgTopRightClick(Sender: TObject);
    procedure imgMidLeftClick(Sender: TObject);
    procedure imgMIdClick(Sender: TObject);
    procedure imgBotmidClick(Sender: TObject);
    procedure imgmidrightClick(Sender: TObject);
    procedure imgbotrightClick(Sender: TObject);
    procedure imgbotLeftClick(Sender: TObject);
    procedure btnRestartClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure easypz;
    procedure player1;
    procedure player2;
    procedure winner;
  private
    bPlayer1, bBotEasy, bbotmed, bBothard, bPlayer2, bPlayer3, bTopleft,
      bTopmid, bTopright, bMidleft, bMid, bMidright, bBotleft, bBotmid,
      bBotright, bValid: boolean;
    iTop1, iMiddle1, iCaseEasy, iBottom1, iLeft1, imid1, iRight1,
      iRighttoleft1, iLefttoright1, iTop2, iMiddle2, iBottom2, iLeft2, imid2,
      iRight2, iRighttoleft2, iLefttoright2, iDifficulty: integer;
    MyImage: TImage;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btnRestartClick(Sender: TObject);
begin
  imgTopLeft.picture := nil;
  imgtopmid.picture := nil;
  imgTopRight.picture := nil;
  imgMidLeft.picture := nil;
  imgMId.picture := nil;
  imgmidright.picture := nil;
  imgbotLeft.picture := nil;
  imgBotmid.picture := nil;
  imgbotright.picture := nil;
  bPlayer1 := true;
  bPlayer2 := false;
  bTopleft := true;
  bTopmid := true;
  bTopright := true;
  bMidleft := true;
  bMid := true;
  bMidright := true;
  bBotleft := true;
  bBotmid := true;
  bBotright := true;
  iTop1 := 0;
  iMiddle1 := 0;
  iBottom1 := 0;
  iLeft1 := 0;
  imid1 := 0;
  iRight1 := 0;
  iRighttoleft1 := 0;
  iLefttoright1 := 0;
  iTop2 := 0;
  iMiddle2 := 0;
  iBottom2 := 0;
  iLeft2 := 0;
  imid2 := 0;
  iRight2 := 0;
  iRighttoleft2 := 0;
  iLefttoright2 := 0;
  bBotEasy := false;
  bBothard := false;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin

  iDifficulty := strtoInt(inputbox('Please enter',
      'Please enter the difficulty level from 1 to 3 (1 being the easiest and 3 being the hardest)', ' '));

  case iDifficulty of
    1:
      bBotEasy := true;
    2:
      bbotmed := true;
    3:
      bBothard := true;
  end;

  bPlayer1 := false;
  bPlayer2 := false;
  bPlayer3 := true;

end;

procedure TForm2.easypz;
begin
  case iCaseEasy of
    1:
      if imgTopLeft.picture.Graphic = nil then
      begin
        MyImage := imgTopLeft;
        bValid := true;
        inc(iTop1);
        inc(iLeft1);
        inc(iLefttoright1);
        bTopleft := false;
      end;

    2:
      if imgtopmid.picture.Graphic = nil then
      begin
        MyImage := imgtopmid;
        bValid := true;
        bTopmid := false;
        inc(iTop1);
        inc(imid1);
      end;
    3:
      if imgTopRight.picture.Graphic = nil then
      begin
        MyImage := imgTopRight;
        bValid := true;
        bTopright := false;
        inc(iRighttoleft1);
        inc(iRight1);
        inc(iTop1);
      end;
    4:
      if imgMidLeft.picture.Graphic = nil then
      begin
        MyImage := imgMidLeft;
        bValid := true;
        bMidleft := false;
        inc(iMiddle1);
        inc(iLeft1);
      end;
    5:
      if imgMId.picture.Graphic = nil then
      begin
        MyImage := imgMId;
        bValid := true;
        bMid := false;
        inc(iMiddle1);
        inc(imid1);
        inc(iRighttoleft1);
        inc(iLefttoright1);
      end;
    6:
      if imgmidright.picture.Graphic = nil then
      begin
        MyImage := imgmidright;
        bValid := true;
        bMidright := false;
        inc(iMiddle1);
        inc(iRight1);
      end;
    7:
      if imgbotLeft.picture = nil then
      begin
        MyImage := imgbotLeft;
        bValid := true;
        bBotleft := false;
        inc(iBottom1);
        inc(iLeft1);
        inc(iRighttoleft1);
      end;
    8:
      if imgBotmid.picture.Graphic = nil then
      begin
        MyImage := imgBotmid;
        bValid := true;
        bBotmid := false;
        inc(imid1);
        inc(iBottom1);
      end;
    9:
      if imgbotright.picture.Graphic = nil then
      begin
        MyImage := imgbotright;
        bValid := true;
        bBotright := false;
        inc(iLefttoright1);
        inc(iBottom1);
        inc(iRight1);
      end;
  end;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  Showmessage('Welcome to noughts and crosses!');
  bPlayer1 := true;
  bPlayer2 := false;
  bPlayer3 := false;
  bValid := false;
  iTop1 := 0;
  iMiddle1 := 0;
  iBottom1 := 0;
  iLeft1 := 0;
  imid1 := 0;
  iRight1 := 0;
  iRighttoleft1 := 0;
  iLefttoright1 := 0;
  iTop2 := 0;
  iMiddle2 := 0;
  iBottom2 := 0;
  iLeft2 := 0;
  imid2 := 0;
  iRight2 := 0;
  iRighttoleft2 := 0;
  iLefttoright2 := 0;
  bTopleft := true;
  bTopmid := true;
  bTopright := true;
  bMidleft := true;
  bMid := true;
  bMidright := true;
  bBotleft := true;
  bBotmid := true;
  bBotright := true;
  iDifficulty := 0;
end;

procedure TForm2.imgbotLeftClick(Sender: TObject);
var
  bValid: boolean;
begin
  bValid := false;

  if (bPlayer1 = true) and (bBotleft = true) then
  begin
    imgbotLeft.picture.LoadFromFile('Nought.png');
    bBotleft := false;
    bPlayer2 := true;
    bPlayer1 := false;
    inc(iBottom1);
    inc(iLeft1);
    inc(iRighttoleft1);
  end
  else if (bPlayer2 = true) and (bBotleft = true) then
  begin
    imgbotLeft.picture.LoadFromFile('crosses.png');
    bBotleft := false;
    bPlayer2 := false;
    bPlayer1 := true;
    inc(iBottom2);
    inc(iLeft2);
    inc(iRighttoleft2);
  end;

  if (iTop2 = 2) OR (imid2 = 2) OR (iBottom2 = 2) OR (iLeft2 = 2) OR
    (iMiddle2 = 2) OR (iRight2 = 2) OR (iRighttoleft2 = 2) OR
    (iLefttoright2 = 2) then

    if (bPlayer3 = true) and (bBotleft = true) and (bBotEasy = true) then
    begin
      imgbotLeft.picture.LoadFromFile('Nought.png');
      bBotleft := false;
      bBotEasy := true;
      bPlayer3 := false;
      inc(iBottom2);
      inc(iLeft2);
      inc(iRighttoleft2);
      Form2.Refresh;
      sleep(1000);
      if (iTop2 = 3) OR (imid2 = 3) OR (iBottom2 = 3) OR (iLeft2 = 3) OR
        (iMiddle2 = 3) OR (iRight2 = 3) OR (iRighttoleft2 = 3) OR
        (iLefttoright2 = 3) then
        bValid := true;
      while bValid = false do
      begin
        iCaseEasy := randomrange(1, 10);
        easypz;
      end;
      bPlayer3 := true;
      MyImage.picture.LoadFromFile('Crosses.png');
    end;
  player1;
  player2;
end;

procedure TForm2.imgBotmidClick(Sender: TObject);
var
  bValid: boolean;
begin
  bValid := false;
  if (bPlayer1 = true) and (bBotmid = true) then
  begin
    imgBotmid.picture.LoadFromFile('Nought.png');
    bBotmid := false;
    bPlayer2 := true;
    bPlayer1 := false;
    inc(imid1);
    inc(iBottom1);
  end
  else if (bPlayer2 = true) and (bBotmid = true) then
  begin
    imgBotmid.picture.LoadFromFile('crosses.png');
    bBotmid := false;
    bPlayer2 := false;
    bPlayer1 := true;
    inc(imid2);
    inc(iBottom2);
  end;
  if (bPlayer3 = true) and (bBotmid = true) and (bBotEasy = true) then
  begin
    imgBotmid.picture.LoadFromFile('Nought.png');
    bBotmid := false;
    bBotEasy := true;
    bPlayer3 := false;
    inc(iBottom2);
    inc(imid2);
    Form2.Refresh;
    sleep(1000);
    if (iTop2 = 3) OR (imid2 = 3) OR (iBottom2 = 3) OR (iLeft2 = 3) OR
      (iMiddle2 = 3) OR (iRight2 = 3) OR (iRighttoleft2 = 3) OR
      (iLefttoright2 = 3) then
      bValid := true;
    while bValid = false do
    begin
      iCaseEasy := randomrange(1, 10);
      easypz;
    end;
    MyImage.picture.LoadFromFile('Crosses.png');
    bPlayer3 := true;
  end;
  player1;
  player2;

end;

procedure TForm2.imgbotrightClick(Sender: TObject);
var
  bValid: boolean;
begin

  if (bPlayer1 = true) and (bBotright = true) then
  begin
    imgbotright.picture.LoadFromFile('Nought.png');
    bBotright := false;
    bPlayer2 := true;
    bPlayer1 := false;
    inc(iLefttoright1);
    inc(iBottom1);
    inc(iRight1);
  end
  else if (bPlayer2 = true) and (bBotright = true) then
  begin
    imgbotright.picture.LoadFromFile('crosses.png');
    bBotright := false;
    bPlayer2 := false;
    bPlayer1 := true;
    inc(iLefttoright2);
    inc(iBottom2);
    inc(iRight2);
  end;
  if (bPlayer3 = true) and (bBotright = true) and (bBotEasy = true) then
  begin
    imgbotright.picture.LoadFromFile('Nought.png');
    bBotright := false;
    bBotEasy := true;
    bPlayer3 := false;
    inc(iBottom2);
    inc(iRight2);
    inc(iLefttoright2);
    Form2.Refresh;
    sleep(1000);
    if (iTop2 = 3) OR (imid2 = 3) OR (iBottom2 = 3) OR (iLeft2 = 3) OR
      (iMiddle2 = 3) OR (iRight2 = 3) OR (iRighttoleft2 = 3) OR
      (iLefttoright2 = 3) then
      bValid := true;
    while bValid = false do
    begin
      iCaseEasy := randomrange(1, 10);
      easypz;
    end;

    MyImage.picture.LoadFromFile('Crosses.png');
    bPlayer3 := true;
  end;
  player1;
  player2;
end;

procedure TForm2.imgMIdClick(Sender: TObject);
var
  bValid: boolean;
begin
  bValid := false;
  if (bPlayer1 = true) and (bMid = true) then
  begin
    imgMId.picture.LoadFromFile('Nought.png');
    bMid := false;
    bPlayer2 := true;
    bPlayer1 := false;
    inc(iMiddle1);
    inc(imid1);
    inc(iRighttoleft1);
    inc(iLefttoright1);
  end
  else if (bPlayer2 = true) and (bMid = true) then
  begin
    imgMId.picture.LoadFromFile('crosses.png');
    bMid := false;
    bPlayer2 := false;
    bPlayer1 := true;
    inc(iMiddle2);
    inc(imid2);
    inc(iRighttoleft2);
    inc(iLefttoright2);
  end;
  if (bPlayer3 = true) and (bMid = true) and (bBotEasy = true) then
  begin
    imgMId.picture.LoadFromFile('Nought.png');
    bMid := false;
    bBotEasy := true;
    bPlayer3 := false;
    inc(imid2);
    inc(iMiddle2);
    inc(iRighttoleft2);
    inc(iLefttoright2);
    Form2.Refresh;
    sleep(1000);
    if (iTop2 = 3) OR (imid2 = 3) OR (iBottom2 = 3) OR (iLeft2 = 3) OR
      (iMiddle2 = 3) OR (iRight2 = 3) OR (iRighttoleft2 = 3) OR
      (iLefttoright2 = 3) then
      bValid := true;
    while bValid = false do
    begin
      iCaseEasy := randomrange(1, 10);
      easypz;
    end;

    bPlayer3 := true;
    MyImage.picture.LoadFromFile('Crosses.png');

  end;
  player1;
  player2;
end;

procedure TForm2.imgMidLeftClick(Sender: TObject);
var
  bValid: boolean;
begin
  bValid := false;
  if (bPlayer1 = true) and (bMidleft = true) then
  begin
    imgMidLeft.picture.LoadFromFile('Nought.png');
    bMidleft := false;
    bPlayer2 := true;
    bPlayer1 := false;
    inc(iMiddle1);
    inc(iLeft1);
  end
  else if (bPlayer2 = true) and (bMidleft = true) then
  begin
    imgMidLeft.picture.LoadFromFile('crosses.png');
    bMidleft := false;
    bPlayer2 := false;
    bPlayer1 := true;
    inc(iMiddle2);
    inc(iLeft2);
  end;
  if (bPlayer3 = true) and (bMidleft = true) and (bBotEasy = true) then
  begin
    imgMidLeft.picture.LoadFromFile('Nought.png');
    bMidleft := false;
    bBotEasy := true;
    bPlayer3 := false;
    inc(iMiddle2);
    inc(iLeft2);
    Form2.Refresh;
    sleep(1000);
    if (iTop2 = 3) OR (imid2 = 3) OR (iBottom2 = 3) OR (iLeft2 = 3) OR
      (iMiddle2 = 3) OR (iRight2 = 3) OR (iRighttoleft2 = 3) OR
      (iLefttoright2 = 3) then
      bValid := true;
    while bValid = false do
    begin
      iCaseEasy := randomrange(1, 10);
      easypz;
    end;

    bPlayer3 := true;
    MyImage.picture.LoadFromFile('Crosses.png');

  end;
  player1;
  player2;
end;

procedure TForm2.imgmidrightClick(Sender: TObject);
var
  bValid: boolean;

begin
  bValid := false;
  if (bPlayer1 = true) and (bMidright = true) then
  begin
    imgmidright.picture.LoadFromFile('Nought.png');
    bMidright := false;
    bPlayer2 := true;
    bPlayer1 := false;
    inc(iMiddle1);
    inc(iRight1);
  end
  else if (bPlayer2 = true) and (bMidright = true) then
  begin
    imgmidright.picture.LoadFromFile('crosses.png');
    bMidright := false;
    bPlayer2 := false;
    bPlayer1 := true;
    inc(iMiddle2);
    inc(iRight2);
  end;
  if (bPlayer3 = true) and (bMidright = true) and (bBotEasy = true) then
  begin
    imgmidright.picture.LoadFromFile('Nought.png');
    bMidright := false;
    bBotEasy := true;
    bPlayer3 := false;
    inc(iMiddle2);
    inc(iRight2);
    Form2.Refresh;
    sleep(1000);
    if (iTop2 = 3) OR (imid2 = 3) OR (iBottom2 = 3) OR (iLeft2 = 3) OR
      (iMiddle2 = 3) OR (iRight2 = 3) OR (iRighttoleft2 = 3) OR
      (iLefttoright2 = 3) then
      bValid := true;
    while bValid = false do
    begin
      iCaseEasy := randomrange(1, 10);
      easypz;
    end;

    MyImage.picture.LoadFromFile('Crosses.png');
    bPlayer3 := true;
  end;
  player1;
  player2;
end;

procedure TForm2.imgTopLeftClick(Sender: TObject);
var
  bValid: boolean;
begin
  bValid := false;
  if (bPlayer1 = true) and (bTopleft = true) then
  begin
    imgTopLeft.picture.LoadFromFile('nought.png');
    bTopleft := false;
    bPlayer2 := true;
    bPlayer1 := false;
    inc(iTop1);
    inc(iLeft1);
    inc(iLefttoright1);
  end
  else if (bPlayer2 = true) and (bTopleft = true) then
  begin
    imgTopLeft.picture.LoadFromFile('crosses.png');
    bTopleft := false;
    bPlayer2 := false;
    bPlayer1 := true;
    inc(iTop2);
    inc(iLeft2);
    inc(iLefttoright2);
  end;

  if (bPlayer3 = true) and (bTopleft = true) and (bBotEasy = true) then
  begin
    imgTopLeft.picture.LoadFromFile('Nought.png');
    bTopleft := false;
    bBotEasy := true;
    bPlayer3 := false;
    inc(iTop2);
    inc(iLeft2);
    inc(iLefttoright2);
    Form2.Refresh;
    sleep(1000);
    if (iTop2 = 3) OR (imid2 = 3) OR (iBottom2 = 3) OR (iLeft2 = 3) OR
      (iMiddle2 = 3) OR (iRight2 = 3) OR (iRighttoleft2 = 3) OR
      (iLefttoright2 = 3) then
      bValid := true;
    while bValid = false do
    begin
      iCaseEasy := randomrange(1, 10);
      easypz;
    end;
    bPlayer3 := true;
    MyImage.picture.LoadFromFile('Crosses.png');
  end;
  player1;
  player2;
end;

procedure TForm2.imgtopmidClick(Sender: TObject);
var
  bValid: boolean;

begin
  bValid := false;
  if (bPlayer1 = true) and (bTopmid = true) then
  begin
    imgtopmid.picture.LoadFromFile('nought.png');
    bTopmid := false;
    bPlayer2 := true;
    bPlayer1 := false;
    inc(iTop1);
    inc(imid1);
  end
  else if (bPlayer2 = true) and (bTopmid = true) then
  begin
    imgtopmid.picture.LoadFromFile('crosses.png');
    bTopmid := false;
    bPlayer2 := false;
    bPlayer1 := true;
    inc(iTop2);
    inc(imid2);
  end;
  if (bPlayer3 = true) and (bTopmid = true) and (bBotEasy = true) then
  begin
    imgtopmid.picture.LoadFromFile('Nought.png');
    bTopmid := false;
    bBotEasy := true;
    bPlayer3 := false;
    inc(iTop2);
    inc(imid2);
    Form2.Refresh;
    sleep(1000);
    if (iTop2 = 3) OR (imid2 = 3) OR (iBottom2 = 3) OR (iLeft2 = 3) OR
      (iMiddle2 = 3) OR (iRight2 = 3) OR (iRighttoleft2 = 3) OR
      (iLefttoright2 = 3) then
      bValid := true;
    while bValid = false do
    begin
      iCaseEasy := randomrange(1, 10);
      easypz;
    end;
    bPlayer3 := true;
    MyImage.picture.LoadFromFile('Crosses.png');
  end;
  player1;
  player2;
end;

procedure TForm2.imgTopRightClick(Sender: TObject);
var
  bValid: boolean;
begin
  bValid := false;
  if (bPlayer1 = true) and (bTopright = true) then
  begin
    imgTopRight.picture.LoadFromFile('Nought.png');
    bTopright := false;
    bPlayer2 := true;
    bPlayer1 := false;
    inc(iRighttoleft1);
    inc(iRight1);
    inc(iTop1);
  end
  else if (bPlayer2 = true) and (bTopright = true) then
  begin
    imgTopRight.picture.LoadFromFile('crosses.png');
    bTopright := false;
    bPlayer2 := false;
    bPlayer1 := true;
    inc(iRighttoleft2);
    inc(iRight2);
    inc(iTop2);
  end;
  if (bPlayer3 = true) and (bTopright = true) and (bBotEasy = true) then
  begin
    imgTopRight.picture.LoadFromFile('Nought.png');
    bTopright := false;
    bBotEasy := true;
    bPlayer3 := false;
    inc(iRighttoleft2);
    inc(iRight2);
    inc(iTop2);
    Form2.Refresh;
    sleep(1000);
    if (iTop2 = 3) OR (imid2 = 3) OR (iBottom2 = 3) OR (iLeft2 = 3) OR
      (iMiddle2 = 3) OR (iRight2 = 3) OR (iRighttoleft2 = 3) OR
      (iLefttoright2 = 3) then
      bValid := true;
    while bValid = false do
    begin
      iCaseEasy := randomrange(1, 10);
      easypz;
    end;

    bPlayer3 := true;
    MyImage.picture.LoadFromFile('Crosses.png');

  end;
  player1;
  player2;

end;

procedure TForm2.player1;
begin
  if (iTop1 = 3) OR (imid1 = 3) OR (iBottom1 = 3) OR (iLeft1 = 3) OR
    (iMiddle1 = 3) OR (iRight1 = 3) OR (iRighttoleft1 = 3) OR
    (iLefttoright1 = 3) then
  begin
    Showmessage('Player 1 wins!');
    winner;
  end;
end;

procedure TForm2.player2;
begin
  if (iTop2 = 3) OR (imid2 = 3) OR (iBottom2 = 3) OR (iLeft2 = 3) OR
    (iMiddle2 = 3) OR (iRight2 = 3) OR (iRighttoleft2 = 3) OR
    (iLefttoright2 = 3) then
  begin
    Showmessage('Player 2 wins!');
    winner;
  end;
end;

procedure TForm2.winner;
begin
  imgTopLeft.picture := nil;
  imgtopmid.picture := nil;
  imgTopRight.picture := nil;
  imgMidLeft.picture := nil;
  imgMId.picture := nil;
  imgmidright.picture := nil;
  imgbotLeft.picture := nil;
  imgBotmid.picture := nil;
  imgbotright.picture := nil;
  bPlayer1 := true;
  bPlayer2 := false;
  bTopleft := true;
  bTopmid := true;
  bTopright := true;
  bMidleft := true;
  bMid := true;
  bMidright := true;
  bBotleft := true;
  bBotmid := true;
  bBotright := true;
  iTop1 := 0;
  iMiddle1 := 0;
  iBottom1 := 0;
  iLeft1 := 0;
  imid1 := 0;
  iRight1 := 0;
  iRighttoleft1 := 0;
  iLefttoright1 := 0;
  iTop2 := 0;
  iMiddle2 := 0;
  iBottom2 := 0;
  iLeft2 := 0;
  imid2 := 0;
  iRight2 := 0;
  iRighttoleft2 := 0;
  iLefttoright2 := 0;
end;

end.
