unit games_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, pngimage, ShellApi, jpeg, mathgame_u,
  Noughtsandcrosses_p,
  dmMathsharks_u, snake_u, GIFImg;

type
  TfrmGames = class(TForm)
    imgSnake: TImage;
    imgMath: TImage;
    imgNC: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    grpLogin: TGroupBox;
    imgGif: TImage;
    imgBack: TImage;
    imgLogo: TImage;
    imgSprite: TImage;
    Label5: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    btnVisible: TButton;
    btnLogin: TButton;
    btnHelp: TButton;
    lblDetails: TLabel;
    procedure imgSnakeClick(Sender: TObject);
    procedure imgMathClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure imgNCClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnVisibleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure hello;
    function getUserID : integer;
    ///
    /// RESET GAME STATE ON ALL GAMES
    ///
    ///  Make a class for the learner
    ///
  private
    { Private declarations }
    icountpassword, iUserID: integer;
  public
    { Public declarations }
  end;
    Tlearner = class(TObject)
    private
      fID, fSnake, fMath, fNC : integer;
      fName : string;
    public
    constructor create(pID, pSnake, pMAth, PNc: integer; pName : string);
      function getID : integer;
      function getName : string;
      function getSnake : integer;
      function getMath : integer;
      function getNc : integer;
      function toString : string;
    end;
var
  frmGames: TfrmGames;
  objLearner : Tlearner;

implementation

{$R *.dfm}

procedure TfrmGames.btnLoginClick(Sender: TObject);
var
  sUsername, sPassword: string;
  bEmpty, bLogin: boolean;
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
          (sPassword = tblusers['Password'])  then
        begin
          bLogin := true;
          frmGames.Width := imgNC.Left + imgNC.Width + 40;
          frmGames.Height := imgNC.Top + imgNC.Height + 100;
          frmGames.Left := (Screen.Width - Width) div 2;
          frmGames.Top := (Screen.Height - Height) div 2;
          frmGames.BorderStyle := bsDialog;
          label1.Visible := true;
          label2.Visible := true;
          label3.Visible := true;
          label4.Visible := true;
          imgsnake.Visible := true;
          imgmath.Visible := true;
          imgnc.Visible := true;
          grpLogin.Visible := false;
          objLearner := Tlearner.Create(tblUsers['UserID'], tblUsers['Snake Score'],tblUsers['Math Score'],tblUsers['TTT Wins'], tblUsers['FirstName']);
          lblDetails.Caption := objlearner.toString;
        end;
        tblusers.Next;
        tblAnswers.Next;
      until tblusers.eof or (bLogin = true);
    end;
    if bLogin = false then
    begin
      showmessage('Invalid user or user does not meet the requirement to access the games section');
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
  IuserID := 0;
end;

procedure TfrmGames.FormCreate(Sender: TObject);
begin
  icountpassword := 1;
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
end;

function TfrmGames.getUserID: integer;
begin
  result := iUserID;
end;

procedure TfrmGames.hello;
begin
  showmessage('Hello world');
end;

procedure TfrmGames.imgMathClick(Sender: TObject);
begin
  frmGames.Visible := false;
  frmMath.Visible := true;
  { ShellExecute(Handle, 'open', 'E:\Grade 12 PAT\Pat gr12\Games form\Games\Math Game\mathgame_p.exe',
    nil, nil, SW_SHOWNORMAL) ; }
end;

procedure TfrmGames.imgNCClick(Sender: TObject);
begin
  frmGames.Visible := false;
  frmNC.Visible := true;

  frmGames.Width := imgNC.Left + imgNC.Width + 40;
  frmGames.Height := imgNC.Top + imgNC.Height + 50;
  frmGames.Left := (Screen.Width - Width) div 2;
  frmGames.Top := (Screen.Height - Height) div 2;
  frmGames.BorderStyle := bsDialog;
end;

procedure TfrmGames.imgSnakeClick(Sender: TObject);
begin
  frmGames.Visible := false;
  frmSnake.Visible := true;
end;

{ Tlearner }

constructor Tlearner.create(pID, pSnake, pMAth, PNc: integer; pName : string);
begin
  fId := pID;
  fName := pName;
  fSnake := pSnake;
  fMath := pMath;
  fNc := pNc;
end;

function Tlearner.getID: integer;
begin
  result := fId;
end;

function Tlearner.getMath: integer;
begin
  result := fMath;
end;

function Tlearner.getName: string;
begin
  result := fName;
end;

function Tlearner.getNc: integer;
begin
  result := fNc;
end;

function Tlearner.getSnake: integer;
begin
  result := fSnake;
end;

function Tlearner.toString: string;
begin
  result := 'User: '+fName+#10+'Snake Game score: '+inttostr(fSnake)+#10+'Math Game wins: '+
            inttostr(fMath) + #10 + 'Noughts and Crosses Wins: '+inttostr(fNC);
end;

end.
