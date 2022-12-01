unit mathgame_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, pngimage, ExtCtrls, math, shellapi, winInet, GIFImg, dmMathsharks_u;

type
  TfrmMath = class(TForm)
    prgScore: TProgressBar;
    edtAnswer: TEdit;
    imgno2: TImage;
    imgNo1: TImage;
    imgSign: TImage;
    lblUser: TLabel;
    img1: TImage;
    grpMath: TGroupBox;
    imgWait: TImage;
    prgbot: TProgressBar;
    imgbot: TImage;
    lblbot: TLabel;
    Image1: TImage;
    grpSplash: TGroupBox;
    Label1: TLabel;
    pnlEasy: TPanel;
    pnlMedium: TPanel;
    pnlHigh: TPanel;
    pnlBack: TPanel;
    pnlHard: TPanel;
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
    Image3: TImage;
    Label9: TLabel;
    lblBack: TLabel;
    lblTop: TLabel;
    tmrBot: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure numbers;
    procedure number(iNum :integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnlMediumClick(Sender: TObject);
    procedure centreS;
    procedure pnlBackClick(Sender: TObject);
    procedure edtAnswerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnlHighClick(Sender: TObject);
    procedure lblBackClick(Sender: TObject);
    procedure tmrBotTimer(Sender: TObject);
    procedure startgame( iDif : integer);
    procedure pnlEasyClick(Sender: TObject);
    procedure pnlHardClick(Sender: TObject);
    procedure finished(sString : string);
  private
  iAnswer, i1, i2, iDiff : integer;
  sImage, sAnswer : string;


    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMath: TfrmMath;

implementation

uses games_u;

{$R *.dfm}


procedure TfrmMath.centreS;
begin
  frmMath.left := ((Screen.Width - frmMath.Width)) div 2;
  frmMath.Top := (Screen.Height - frmmath.Height) div 2;
end;

procedure TfrmMath.edtAnswerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
  begin
  try
  if strtoint(edtAnswer.Text) = iAnswer then
    begin
      prgScore.Position := prgScore.Position + 10;
      numbers;
      number(i1);
      imgno1.Picture.loadfromfile(sImage);
      number(i2);
      imgno2.Picture.loadfromfile(sImage);
    end
    else
    begin
       showmessage('Incorrect');
       edtAnswer.Clear;
       edtAnswer.SetFocus;
    end;

 except
    showmessage('Please enter a valid number');
 end;
  end;
end;

procedure TfrmMath.finished(sString : string);
var
  iRetry : integer;
begin
  iRetry := messagedlg(sString,mtCustom,
                              [mbYes,mbNo], 0);
  // Show the button type selected
  if iRetry = mrYes then
  startgame(iDiff);
  if IRetry = mrNo then
  begin
    formactivate(Self);
    imgno1.Picture := nil;
    imgno2.Picture := nil;
  end;

end;

procedure TfrmMath.FormActivate(Sender: TObject);
begin
  frmMath.borderstyle := bsdialog;
  frmMath.DoubleBuffered := True;
  iAnswer := 0;
  grphighscores.Visible := false;
  i1 := 0;
  i2 := 0;
  lblUser.Caption := objlearner.getName;
  grpsplash.Left := 0;
  grpSplash.Top := 0;
  grpSplash.Visible := true;
  frmMath.Width := grpSplash.Width + 6;
  frmMAth.Height := grpSplash.Height + 28;
  centreS;
end;

procedure TfrmMath.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  application.Terminate;
end;

procedure TfrmMath.lblBackClick(Sender: TObject);
begin
  formactivate(lblBack);
end;

procedure TfrmMath.number(iNum :integer);
begin
  case iNum of
  0: sImage := '0.png';
  1: sImage := '1.png';
  2: sImage := '2.png';
  3: sImage := '3.png';
  4: sImage := '4.png';
  5: sImage := '5.png';
  6: sImage := '6.png';
  7: sImage := '7.png';
  8: sImage := '8.png';
  9: sImage := '9.png';
  end;
end;

procedure TfrmMath.numbers;
begin
  if prgScore.Position < prgScore.Max then
  begin
    edtAnswer.clear;
    i1 := randomrange(1,10);
    i2 := randomrange(1,10);
    iAnswer := i1 * i2;
  end
  else
  begin
    tmrBot.Enabled := false;
    finished('You won the race! Would you like to try again?');
  end;

end;

procedure TfrmMath.pnlBackClick(Sender: TObject);
begin
  frmmath.Visible := false;
  frmGames.Visible := true;
end;

procedure TfrmMath.pnlEasyClick(Sender: TObject);
begin
  iDiff := 1;
  grpSplash.Visible := false;
  frmmath.width :=  732;
  frmMath.height := 482;
  edtAnswer.SetFocus;
  centreS;
  startgame(iDiff);
end;

procedure TfrmMath.pnlHardClick(Sender: TObject);
begin
  iDiff := 5;
  grpSplash.Visible := false;
  frmmath.width :=  732;
  frmMath.height := 482;
  edtAnswer.SetFocus;
  centreS;
  startgame(iDiff);
end;

procedure TfrmMath.pnlHighClick(Sender: TObject);
var
  i : integer;
begin
  with dmMathsharks do
  begin
  grpsplash.Visible := false;
    grpHighScores.Visible := true;
    clientWidth := grpHighscores.Width;
    clientHeight := grpHighscores.Height;
    grpHighscores.Left := 0;
    grpHighscores.Top := 0;
    tblUsers.open;
    tblusers.Sort := '[Math Score] DESC';
    lbl1.Caption := tblusers['Username'];
    lbltop.Caption := lbl1.Caption;
    lbl1S.Caption := tblUsers['Math Score'];
    for i := 1 to length(lbl1s.Caption) do
    begin
      lbltop.Font.Size := lbltop.Font.Size - 6;
    end;
    tblusers.Next;
    lbl2.Caption := tblusers['Username'];
    lbl2S.Caption := tblUsers['Math Score'];
    tblusers.Next;
    lbl3.Caption := tblusers['Username'];
    lbl3S.Caption := tblUsers['Math Score'];
    tblusers.Next;
    lbl4.Caption := tblusers['Username'];
    lbl4S.Caption := tblUsers['Math Score'];
    tblusers.Next;
    lbl5.Caption := tblusers['Username'];
    lbl5S.Caption := tblUsers['Math Score'];
    tblusers.Close;
  end;
end;

procedure TfrmMath.pnlMediumClick(Sender: TObject);
begin
  iDiff := 3;
  grpSplash.Visible := false;
  frmmath.width :=  732;
  frmMath.height := 482;
  edtAnswer.SetFocus;
  centreS;
  startgame(iDiff);
end;

procedure TfrmMath.startgame( iDif : integer);
begin
  prgScore.Position := 0;
  prgbot.Position := 0;
  showmessage('Ready...');
  showmessage('Steady...');
  showmessage('Go!');
  case iDif of
  1 : tmrbot.Interval := 4000;
  3 : tmrbot.Interval := 3000;
  5 : tmrbot.Interval := 2000;
  end;
  numbers;
  number(i1);
  imgno1.Picture.loadfromfile(sImage);
  number(i2);
  imgno2.Picture.loadfromfile(sImage);
  tmrbot.Enabled := true;
end;

procedure TfrmMath.tmrBotTimer(Sender: TObject);
begin
  prgbot.Position := prgbot.Position + 10;
  if prgbot.Position = prgbot.Max then
  begin
  tmrbot.Enabled := false;
    showmessage('The bot has won! Better luck next time.');

    finished('You lost, better luck next time! Would you like to try again?');
  end;
end;

end.
