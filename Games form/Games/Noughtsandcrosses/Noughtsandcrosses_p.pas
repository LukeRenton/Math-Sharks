unit Noughtsandcrosses_p;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, pngimage, math, shellAPi, Grids,
  dmmathsharks_u;

type
  TfrmNC = class(TForm)
    imgBack: TImage;
    imgTopLeft: TImage;
    imgtopmid: TImage;
    imgTopRight: TImage;
    imgmidright: TImage;
    imgbotLeft: TImage;
    imgMId: TImage;
    imgMidLeft: TImage;
    imgBotmid: TImage;
    imgbotright: TImage;
    grpSplash: TGroupBox;
    grpGame: TGroupBox;
    Label1: TLabel;
    pnlPlayer: TPanel;
    pnlBot: TPanel;
    pnlHigh: TPanel;
    pnlBack: TPanel;
    grpHighScores: TGroupBox;
    Image2: TImage;
    lbl1S: TLabel;
    lbl1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblHiScore: TLabel;
    Label2: TLabel;
    lblUsername: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbl2: TLabel;
    lbl2S: TLabel;
    lbl3S: TLabel;
    lbl4S: TLabel;
    lbl5S: TLabel;
    lbl5: TLabel;
    lbl4: TLabel;
    lbl3: TLabel;
    Image1: TImage;
    Label9: TLabel;
    lblBack: TLabel;
    lblTop: TLabel;
    lblback1: TLabel;
    lblp1: TLabel;
    lblp2: TLabel;
    lbldraws: TLabel;
    lblbot: TLabel;
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
    procedure reset;
    procedure draw;
    procedure winner(s: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bot;
    procedure pnlPlayerClick(Sender: TObject);
    procedure pnlBackClick(Sender: TObject);
    procedure pnlHighClick(Sender: TObject);
    procedure lblBackClick(Sender: TObject);
    procedure lblback1Click(Sender: TObject);
    procedure player;
    procedure pnlBotClick(Sender: TObject);
  private
    bPlayer1, bBot, bPlayer2, bWinner, bPlayer3, bPlayer: boolean;
    sWinner: string;
    iGames, iP1, iP2, idraw: integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  arrG: array [0 .. 2, 0 .. 2] of string;
  frmNC: TfrmNC;

implementation

uses games_u;
{$R *.dfm}

procedure TfrmNC.bot;
var
  iCaseeasy: integer;
  bValid: boolean;
begin
  bValid := false;
  // populate array;
  while bValid = false do
  begin
    iCaseeasy := randomrange(1, 10);
    case iCaseeasy of
      1:
        if imgTopLeft.picture.Graphic = nil then
        begin
          sleep(1000);
          bValid := true;
          arrG[0, 0] := 'O';
          imgTopLeft.picture.LoadFromfile('Nought.png');
          winner('O');
        end;
      2:
        if imgtopmid.picture.Graphic = nil then
        begin
          sleep(1000);
          bValid := true;
          arrG[1, 0] := 'O';
          imgtopmid.picture.LoadFromfile('Nought.png');
          winner('O');
        end;
      3:
        if imgTopRight.picture.Graphic = nil then
        begin
          sleep(1000);
          bValid := true;
          arrG[2, 0] := 'O';
          imgTopRight.picture.LoadFromfile('Nought.png');
          winner('O');
        end;
      4:
        if imgMidLeft.picture.Graphic = nil then
        begin
          sleep(1000);
          bValid := true;
          arrG[0, 1] := 'O';
          imgMidLeft.picture.LoadFromfile('Nought.png');
          winner('O');
        end;
      5:
        if imgMId.picture.Graphic = nil then
        begin
          sleep(1000);
          bValid := true;
          arrG[1, 1] := 'O';
          imgMId.picture.LoadFromfile('Nought.png');
          winner('O');
        end;
      6:
        if imgmidright.picture.Graphic = nil then
        begin
          sleep(1000);
          bValid := true;
          arrG[2, 1] := 'O';
          imgmidright.picture.LoadFromfile('Nought.png');
          winner('O');
        end;
      7:
        if imgbotLeft.picture = nil then
        begin
          sleep(1000);
          bValid := true;
          arrG[0, 2] := 'O';
          imgbotLeft.picture.LoadFromfile('Nought.png');
          winner('O');
        end;
      8:
        if imgBotmid.picture.Graphic = nil then
        begin
          sleep(1000);
          bValid := true;
          arrG[1, 2] := 'O';
          imgBotmid.picture.LoadFromfile('Nought.png');
          winner('O');
        end;
      9:
        if imgbotright.picture.Graphic = nil then
        begin
          sleep(1000);
          bValid := true;
          arrG[2, 2] := 'O';
          imgbotright.picture.LoadFromfile('Nought.png');
          winner('O');
        end;
    end;
  end;

end;

procedure TfrmNC.draw;
var
  i, j, icount: integer;
begin
  icount := 0;
  for i := 0 to 3 - 1 do
    for j := 0 to 3 - 1 do
      if arrG[i, j] = '' then
        inc(icount);
  if icount = 0 then
  begin
    showmessage('Draw! No one wins');
    inc(iGames);
    inc(idraw);
    reset;
    lbldraws.Caption := 'Draws: ' + inttostr(idraw);
  end;
end;

procedure TfrmNC.FormActivate(Sender: TObject);
begin
  bPlayer := false;
  bBot := false;
  iP1 := 0;
  iP2 := 0;
  idraw := 0;
  iGames := 1;
  frmNC.Width := 353;
  frmNC.Height := 361;
  grpSplash.Height := 361;
  grpSplash.Width := 353;
  frmNC.left := (Screen.Width - Width) div 2;
  frmNC.Top := (Screen.Height - Height) div 2;
  grpSplash.left := -3;
  grpSplash.Top := 0;
  grpGame.Visible := false;
  grpHighScores.Visible := false;
  grpHighScores.left := -3;
  grpHighScores.Top := 0;
  grpHighScores.Width := 343;
  grpHighScores.Height := 337;
end;

procedure TfrmNC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  application.Terminate;
end;

procedure TfrmNC.imgbotLeftClick(Sender: TObject);
begin
  if bPlayer = true then
  begin
    if bPlayer1 = true and (imgbotLeft.picture.Graphic = nil) then
    begin
      arrG[0, 2] := 'X';
      bPlayer1 := false;
      bPlayer2 := true;
      imgbotLeft.picture.LoadFromfile('crosses.png');
      winner('X');
    end
    else if bPlayer2 = true and (imgbotLeft.picture.Graphic = nil) then
    begin
      arrG[0, 2] := 'O';
      bPlayer2 := false;
      bPlayer1 := true;
      imgbotLeft.picture.LoadFromfile('Nought.png');
      winner('O');
    end;
  end;
  if bBot = true then
  begin
    if bPlayer1 = true and (imgbotLeft.picture.Graphic = nil) then
    begin
      arrG[0, 2] := 'X';
      imgbotLeft.picture.LoadFromfile('crosses.png');
      winner('X');
      frmNC.Refresh;
      bot;
    end;
  end;
end;

procedure TfrmNC.imgBotmidClick(Sender: TObject);
begin
  if bPlayer = true then
  begin
    if bPlayer1 = true and (imgBotmid.picture.Graphic = nil) then
    begin
      arrG[1, 2] := 'X';
      bPlayer1 := false;
      bPlayer2 := true;
      imgBotmid.picture.LoadFromfile('crosses.png');
      winner('X');
    end
    else if bPlayer2 = true and (imgBotmid.picture.Graphic = nil) then
    begin
      arrG[1, 2] := 'O';
      bPlayer2 := false;
      bPlayer1 := true;
      imgBotmid.picture.LoadFromfile('Nought.png');
      winner('O');
    end;
  end;

  if bBot = true then
  begin
    if bPlayer1 = true and (imgBotmid.picture.Graphic = nil) then
    begin
      arrG[1, 2] := 'X';
      imgBotmid.picture.LoadFromfile('crosses.png');
      winner('X');
      frmNC.Refresh;
      bot;
    end;
  end;

end;

procedure TfrmNC.imgbotrightClick(Sender: TObject);
begin
  if bPlayer = true then
  begin
    if bPlayer1 = true and (imgbotright.picture.Graphic = nil) then
    begin
      arrG[2, 2] := 'X';
      bPlayer1 := false;
      bPlayer2 := true;
      imgbotright.picture.LoadFromfile('crosses.png');
      winner('X');
    end
    else if bPlayer2 = true and (imgbotright.picture.Graphic = nil) then
    begin
      arrG[2, 2] := 'O';
      bPlayer2 := false;
      bPlayer1 := true;
      imgbotright.picture.LoadFromfile('Nought.png');
      winner('O');
    end;
  end;
  if bBot = true then
  begin
    if bPlayer1 = true and (imgbotright.picture.Graphic = nil) then
    begin
      arrG[2, 2] := 'X';
      imgbotright.picture.LoadFromfile('crosses.png');
      winner('X');
      frmNC.Refresh;
      bot;
    end;
  end;
end;

procedure TfrmNC.imgMIdClick(Sender: TObject);
begin
  if bPlayer = true then
  begin
    if bPlayer1 = true and (imgMId.picture.Graphic = nil) then
    begin
      arrG[1, 1] := 'X';
      bPlayer1 := false;
      bPlayer2 := true;
      imgMId.picture.LoadFromfile('crosses.png');
      winner('X');
    end
    else if bPlayer2 = true and (imgMId.picture.Graphic = nil) then
    begin
      arrG[1, 1] := 'O';
      bPlayer2 := false;
      bPlayer1 := true;
      imgMId.picture.LoadFromfile('Nought.png');
      winner('O');
    end;
  end;
  if bBot = true then
  begin
    if bPlayer1 = true and (imgMId.picture.Graphic = nil) then
    begin
      arrG[1, 1] := 'X';
      imgMId.picture.LoadFromfile('crosses.png');
      winner('X');
      frmNC.Refresh;
      bot;
    end;
  end;

end;

procedure TfrmNC.imgMidLeftClick(Sender: TObject);
begin
  if bPlayer = true then
  begin
    if bPlayer1 = true and (imgMidLeft.picture.Graphic = nil) then
    begin
      arrG[0, 1] := 'X';
      bPlayer1 := false;
      bPlayer2 := true;
      imgMidLeft.picture.LoadFromfile('crosses.png');
      winner('X');
    end
    else if bPlayer2 = true and (imgMidLeft.picture.Graphic = nil) then
    begin
      arrG[0, 1] := 'O';
      bPlayer2 := false;
      bPlayer1 := true;
      imgMidLeft.picture.LoadFromfile('Nought.png');
      winner('O');
    end;
  end;
  if bBot = true then
  begin
    if bPlayer1 = true and (imgMidLeft.picture.Graphic = nil) then
    begin
      arrG[0, 1] := 'X';
      imgMidLeft.picture.LoadFromfile('crosses.png');
      winner('X');
      frmNC.Refresh;
      bot;
    end;
  end;

end;

procedure TfrmNC.imgmidrightClick(Sender: TObject);
begin
  if bPlayer = true then
  begin
    if bPlayer1 = true and (imgmidright.picture.Graphic = nil) then
    begin
      arrG[2, 1] := 'X';
      bPlayer1 := false;
      bPlayer2 := true;
      imgmidright.picture.LoadFromfile('crosses.png');
      winner('X');
    end
    else if bPlayer2 = true and (imgmidright.picture.Graphic = nil) then
    begin
      arrG[2, 1] := 'O';
      bPlayer2 := false;
      bPlayer1 := true;
      imgmidright.picture.LoadFromfile('Nought.png');
      winner('O');
    end;
  end;
  if bBot = true then
  begin
    if bPlayer1 = true and (imgmidright.picture.Graphic = nil) then
    begin
      arrG[2, 1] := 'X';
      imgmidright.picture.LoadFromfile('crosses.png');
      winner('X');
      frmNC.Refresh;
      bot;
    end;
  end;
end;

procedure TfrmNC.imgTopLeftClick(Sender: TObject);
begin
  if bPlayer = true then
  begin
    if bPlayer1 = true and (imgTopLeft.picture.Graphic = nil) then
    begin
      arrG[0, 0] := 'X';
      bPlayer1 := false;
      bPlayer2 := true;
      imgTopLeft.picture.LoadFromfile('crosses.png');
      winner('X');
    end
    else if bPlayer2 = true and (imgTopLeft.picture.Graphic = nil) then
    begin
      arrG[0, 0] := 'O';
      bPlayer2 := false;
      bPlayer1 := true;
      imgTopLeft.picture.LoadFromfile('Nought.png');
      winner('O');
    end;
  end;
  if bBot = true then
  begin
    if bPlayer1 = true and (imgTopLeft.picture.Graphic = nil) then
    begin
      arrG[0, 0] := 'X';
      imgTopLeft.picture.LoadFromfile('crosses.png');
      winner('X');
      frmNC.Refresh;
      bot;
    end;
  end;

end;

procedure TfrmNC.imgtopmidClick(Sender: TObject);
begin
  if bPlayer = true then
  begin
    if bPlayer1 = true and (imgtopmid.picture.Graphic = nil) then
    begin
      arrG[1, 0] := 'X';
      bPlayer1 := false;
      bPlayer2 := true;
      imgtopmid.picture.LoadFromfile('crosses.png');
      winner('X');
    end
    else if bPlayer2 = true and (imgtopmid.picture.Graphic = nil) then
    begin
      arrG[1, 0] := 'O';
      bPlayer2 := false;
      bPlayer1 := true;
      imgtopmid.picture.LoadFromfile('Nought.png');
      winner('O');
    end;
  end;
  if bBot = true then
  begin
    if bPlayer1 = true and (imgtopmid.picture.Graphic = nil) then
    begin
      arrG[1, 0] := 'X';
      imgtopmid.picture.LoadFromfile('crosses.png');
      winner('X');
      frmNC.Refresh;
      bot;
    end;
  end;
end;

procedure TfrmNC.imgTopRightClick(Sender: TObject);
begin
  if bPlayer = true then
  begin
    if bPlayer1 = true and (imgTopRight.picture.Graphic = nil) then
    begin
      arrG[2, 0] := 'X';
      bPlayer1 := false;
      bPlayer2 := true;
      imgTopRight.picture.LoadFromfile('crosses.png');
      winner('X');
    end
    else if bPlayer2 = true and (imgTopRight.picture.Graphic = nil) then
    begin
      arrG[2, 0] := 'O';
      bPlayer2 := false;
      bPlayer1 := true;
      imgTopRight.picture.LoadFromfile('Nought.png');
      winner('O');
    end;
  end;
  if bBot = true then
  begin
    if bPlayer1 = true and (imgTopRight.picture.Graphic = nil) then
    begin
      arrG[2, 0] := 'X';
      imgTopRight.picture.LoadFromfile('crosses.png');
      winner('X');
      frmNC.Refresh;
      bot;
    end;
  end;
end;

procedure TfrmNC.lblback1Click(Sender: TObject);
begin
  iP1 := 0;
  iP2 := 0;
  idraw := 0;
  iGames := 1;
  frmNC.Width := 353;
  frmNC.Height := 361;
  grpSplash.Height := 361;
  grpSplash.Width := 353;
  grpSplash.Visible := true;
  frmNC.left := (Screen.Width - Width) div 2;
  frmNC.Top := (Screen.Height - Height) div 2;
  grpSplash.left := -3;
  grpSplash.Top := 0;
  grpHighScores.Visible := false;
  grpGame.Visible := false;
  grpHighScores.left := -3;
  grpHighScores.Top := 0;
  grpHighScores.Width := 343;
  grpHighScores.Height := 337;
  reset;
end;

procedure TfrmNC.lblBackClick(Sender: TObject);
begin
  grpHighScores.Visible := false;
  grpSplash.Visible := true;
end;

procedure TfrmNC.player;
begin
  if iGames MOD 2 = 0 then
  begin
    bPlayer1 := false;
    bPlayer2 := true;
  end
  else if not(iGames MOD 2 = 0) then
  begin
    bPlayer2 := false;
    bPlayer1 := true;
  end;
end;

procedure TfrmNC.pnlBackClick(Sender: TObject);
begin
  frmNC.Visible := false;
  frmgames.Visible := true;
end;

procedure TfrmNC.pnlBotClick(Sender: TObject);
begin
  iP1 := 0;
  iP2 := 0;
  lblbot.Visible := true;
  lblp2.Visible := false;
  bPlayer1 := true;
  bBot := true;
  bPlayer := false;
  bPlayer3 := false;
  bplayer2 := false;
  bWinner := false;
  sWinner := '';
  grpGame.Visible := true;
  grpHighScores.Visible := false;
  grpSplash.Visible := false;
  frmNC.Width := 529;
  frmNC.Height := grpGame.Height;
  frmNC.left := (Screen.Width - Width) div 2;
  frmNC.Top := (Screen.Height - Height) div 2;
  grpGame.Top := 0;
  grpGame.left := 0;
end;

procedure TfrmNC.pnlHighClick(Sender: TObject);
var
  i: integer;
begin
  with dmMathsharks do
  begin
    grpHighScores.Visible := true;
    grpSplash.Visible := false;
    grpHighScores.Visible := true;
    tblUsers.open;
    tblUsers.Sort := '[TTT Wins] DESC';
    lbl1.Caption := tblUsers['Username'];
    lblTop.Caption := lbl1.Caption;
    lbl1S.Caption := tblUsers['TTT Wins'];
    for i := 1 to length(lbl1S.Caption) do
    begin
      lblTop.Font.Size := lblTop.Font.Size - 6;
    end;
    tblUsers.Next;
    lbl2.Caption := tblUsers['Username'];
    lbl2S.Caption := tblUsers['TTT Wins'];
    tblUsers.Next;
    lbl3.Caption := tblUsers['Username'];
    lbl3S.Caption := tblUsers['TTT Wins'];
    tblUsers.Next;
    lbl4.Caption := tblUsers['Username'];
    lbl4S.Caption := tblUsers['TTT Wins'];
    tblUsers.Next;
    lbl5.Caption := tblUsers['Username'];
    lbl5S.Caption := tblUsers['TTT Wins'];
    tblUsers.Close;
  end;
end;

procedure TfrmNC.pnlPlayerClick(Sender: TObject);
begin
  iP1 := 0;
  iP2 := 0;
  lblp2.Visible := true;
  lblbot.Visible := false;
  bPlayer := true;
  bPlayer1 := true;
  bPlayer2 := false;
  bBot := false;
  bWinner := false;
  sWinner := '';
  grpGame.Visible := true;
  grpHighScores.Visible := false;
  grpSplash.Visible := false;
  frmNC.Width := 529;
  frmNC.Height := grpGame.Height;
  frmNC.left := (Screen.Width - Width) div 2;
  frmNC.Top := (Screen.Height - Height) div 2;
  grpGame.Top := 0;
  grpGame.left := 0;
end;

procedure TfrmNC.reset;
var
  i, j: integer;
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
  lblp1.Caption := 'Player 1 wins: ';
  lblp2.Caption := 'Player 2 wins: ';
  lbldraws.Caption := 'Draws: ';
  lblbot.Caption := 'Bot wins: ';
  player;
  for i := 0 to 3 - 1 do
    for j := 0 to 3 - 1 do
      arrG[i, j] := '';
end;

procedure TfrmNC.winner(s: string);
var
  i, j, win, iUser: integer;

begin
  if bPlayer = true then
  begin
    if ((arrG[0, 0] = s) and (arrG[0, 1] = s) and (arrG[0, 2] = s)) or
      ((arrG[1, 0] = s) and (arrG[1, 1] = s) and (arrG[1, 2] = s)) or
      ((arrG[2, 0] = s) and (arrG[2, 1] = s) and (arrG[2, 2] = s)) or
      ((arrG[0, 0] = s) and (arrG[1, 0] = s) and (arrG[2, 0] = s)) or
      ((arrG[0, 1] = s) and (arrG[1, 1] = s) and (arrG[2, 1] = s)) or
      ((arrG[0, 2] = s) and (arrG[1, 2] = s) and (arrG[2, 2] = s)) or
      ((arrG[0, 0] = s) and (arrG[1, 1] = s) and (arrG[2, 2] = s)) or
      ((arrG[0, 2] = s) and (arrG[1, 1] = s) and (arrG[2, 0] = s)) then
    begin
      showmessage('Player ' + s + ' wins!');
      sWinner := s;
      bWinner := true;
      inc(iGames);
      reset;
      player;
      if bPlayer1 = true then
      begin
        inc(iP1);
        lblp1.Caption := 'Player 1 wins: ' + inttostr(iP1);
      end
      else
      begin
        inc(iP2);
        lblp2.Caption := 'Player 2 wins: ' + inttostr(iP2);
      end;
    end;
    draw;
  end;
  iUSer := objlearner.getID;
  if bBot = true then
  begin
    if ((arrG[0, 0] = s) and (arrG[0, 1] = s) and (arrG[0, 2] = s)) or
      ((arrG[1, 0] = s) and (arrG[1, 1] = s) and (arrG[1, 2] = s)) or
      ((arrG[2, 0] = s) and (arrG[2, 1] = s) and (arrG[2, 2] = s)) or
      ((arrG[0, 0] = s) and (arrG[1, 0] = s) and (arrG[2, 0] = s)) or
      ((arrG[0, 1] = s) and (arrG[1, 1] = s) and (arrG[2, 1] = s)) or
      ((arrG[0, 2] = s) and (arrG[1, 2] = s) and (arrG[2, 2] = s)) or
      ((arrG[0, 0] = s) and (arrG[1, 1] = s) and (arrG[2, 2] = s)) or
      ((arrG[0, 2] = s) and (arrG[1, 1] = s) and (arrG[2, 0] = s)) then
    begin
      showmessage('Player ' + s + ' wins!');
      sWinner := s;
      bWinner := true;
      reset;
      if s = 'X' then
      begin
        inc(iP1);
        lblp1.Caption := 'Player 1 wins: ' + inttostr(iP1);
      end
      else
      begin
        inc(iP2);
        lblbot.Caption := 'Bot wins: ' + inttostr(iP2);
      end;
    end;
    draw;
  end
end;
end.
