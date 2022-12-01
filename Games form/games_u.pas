unit games_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, pngimage, ShellApi, jpeg, mathgame_u,
  Noughtsandcrosses_p, dmMathsharks_u, snake_u, GIFImg, clsStudent_u;

type
  TfrmGames = class(TForm)
    imgSnake: TImage;
    imgMath: TImage;
    imgNC: TImage;
    lblSnakeG: TLabel;
    lblMathG: TLabel;
    lblNCg: TLabel;
    lblChoose: TLabel;
    grpLogin: TGroupBox;
    imgGif: TImage;
    imgBack: TImage;
    imgLogo: TImage;
    imgSprite: TImage;
    lblDetailbelowG: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    btnVisible: TButton;
    btnLogin: TButton;
    lblDetails: TLabel;
    imglogout1: TImage;
    lblout: TLabel;
    btnBackMain: TButton;
    imghelpG: TImage;
    lblHelpG: TLabel;
    procedure imgSnakeClick(Sender: TObject);
    procedure imgMathClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure imgNCClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnVisibleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function getUserID: integer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imglogout1Click(Sender: TObject);
    procedure btnBackMainClick(Sender: TObject);
    procedure imghelpGClick(Sender: TObject);
    ///
    /// RESET GAME STATE ON ALL GAMES
    ///
    /// Make a class for the learner
    ///
  private
    { Private declarations }
    icountpassword, iUserID: integer;
  public
    { Public declarations }
  end;

var
  frmGames: TfrmGames;
  objLearnerG: Tlearner;

implementation

uses Main_u;
{$R *.dfm}

procedure TfrmGames.btnBackMainClick(Sender: TObject);
begin
  frmGames.visible := false;
  frmMain.visible := true;
end;

procedure TfrmGames.btnLoginClick(Sender: TObject);
var
  sUsername, sPassword: string;
  bEmpty, bLogin, bFound: boolean;
begin
  sUsername := edtUsername.Text;
  sPassword := edtPassword.Text;
  bEmpty := false;
  bLogin := false;

  if (sUsername = '') or (sPassword = '') then
  begin
    bEmpty := true;
    showmessage('Please enter your username and password to log in');
  end;
  if bEmpty = false then
  begin
    with dmMathSharks do
    begin
      tblusers.First;
      tblAnswers.First;
      repeat
        if (uppercase(sUsername) = uppercase(tblusers['Username'])) and
          (sPassword = tblusers['Password']) then
        begin
          bFound := true;
          objLearnerG := Tlearner.Create(tblusers['UserID'],
          tblusers['Snake Score'], tblusers['Math Score'],
          tblusers['TTT Wins'], tblusers['FirstName']);
        end;
        tblusers.Next;
        tblAnswers.Next;
      until tblusers.eof or (bFound = true);
    tblAnswers.First;
  if bFound = true then
  begin
    while (not tblAnswers.eof) and (bLogin = false) do
    begin
      if (tblAnswers['UserID'] = objlearnerG.getID) and (tblAnswers['Pass'] = true)then
      begin
        bLogin := true;
      end;
    tblAnswers.Next;
    end;
  end;
  end;

    if bLogin = true then
    begin
          frmGames.Width := imgNC.Left + imgNC.Width + 40;
          frmGames.Height := imgNC.Top + imgNC.Height + 100;
          frmGames.Left := (Screen.Width - Width) div 2;
          frmGames.Top := (Screen.Height - Height) div 2;
          frmGames.BorderStyle := bsDialog;
          lblSnakeG.visible := true;
          lblMathG.visible := true;
          lblNcg.visible := true;
          lblChoose.visible := true;
          imgSnake.visible := true;
          imgMath.visible := true;
          imgNC.visible := true;
          grpLogin.visible := false;
          imglogout1.visible := true;
          lblout.visible := true;
          lblDetails.Caption := objLearnerG.toString;
    end
    else
    begin
      showmessage(
        'Invalid user or user does not meet the requirement to access the games section');
        if bFound =  true then
        objlearnerG.Destroy;
    end;


  end;
end;

procedure TfrmGames.btnVisibleClick(Sender: TObject);
begin
  if NOT(icountpassword MOD 2 = 0) then
  begin
    inc(icountpassword);
    edtPassword.Passwordchar := #0;
  end
  else if icountpassword MOD 2 = 0 then
  begin
    inc(icountpassword);
    edtPassword.Passwordchar := '*';
  end;
end;

procedure TfrmGames.FormActivate(Sender: TObject);
begin
  icountpassword := 1;
  windowstate := wsNormal;
  iUserID := 0;

end;

procedure TfrmGames.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  application.Terminate;
end;

procedure TfrmGames.FormCreate(Sender: TObject);
begin
  icountpassword := 1;
  grpLogin.visible := true;
  imglogout1.visible := false;
  lblout.visible := false;
  windowstate := wsNormal;
  grpLogin.Top := 0;
  grpLogin.Left := 0;
  frmGames.BorderStyle := bsDialog;
  grpLogin.Width := 305;
  grpLogin.Height := 401;
  clientwidth := grpLogin.Width;
  clientheight := grpLogin.Height;
  frmGames.Left := (Screen.Width - Width) div 2;
  frmGames.Top := (Screen.Height - Height) div 2;
  imgLogo.Width := clientwidth;
  imgBack.Width := clientwidth;
  imgBack.Height := frmGames.Height;
  lblDetails.Caption := '';
end;

function TfrmGames.getUserID: integer;
begin
  result := iUserID;
end;

procedure TfrmGames.imghelpGClick(Sender: TObject);
begin
  showmessage(
    'Enter your Username and password in the given fields to proceed. ' + #10 + #10 +
      'If you don''t have an account please create one by going back to the main form. If you did not pass the course you will not have access to the games until you have passed (Get a score above 5)');
end;

procedure TfrmGames.imglogout1Click(Sender: TObject);
begin
  objlearnerG.Destroy;
  frmGames.FormCreate(self);
end;

procedure TfrmGames.imgMathClick(Sender: TObject);
begin
  frmGames.visible := false;
  frmMath.visible := true;
end;

procedure TfrmGames.imgNCClick(Sender: TObject);
begin
  frmGames.visible := false;
  frmNC.visible := true;

  { frmGames.Width := imgNC.Left + imgNC.Width + 40;
    frmGames.Height := imgNC.Top + imgNC.Height + 50;
    frmGames.Left := (Screen.Width - Width) div 2;
    frmGames.Top := (Screen.Height - Height) div 2;
    frmGames.BorderStyle := bsDialog; }
end;

procedure TfrmGames.imgSnakeClick(Sender: TObject);
begin
  frmGames.visible := false;
  frmSnake.visible := true;
  frmSnake.OnActivate(self);
end;

end.
