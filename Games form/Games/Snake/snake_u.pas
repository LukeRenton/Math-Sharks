unit snake_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, math, GIFImg, StdCtrls, dmMathsharks_u, pngimage, Grids,
  DBGrids;

type
  TfrmSnake = class(TForm)
    sA: TShape;
    sH: TShape;
    tmrSnake: TTimer;
    imgstart: TImage;
    lblScoreb4: TLabel;
    lblScore: TLabel;
    pnlHigh: TPanel;
    pnlBack: TPanel;
    pnlHelp: TPanel;
    pnlStart: TPanel;
    grpHighScores: TGroupBox;
    lbl1S: TLabel;
    lbl1: TLabel;
    lbl1st: TLabel;
    lblRanking: TLabel;
    lblHiScore: TLabel;
    lblUsername: TLabel;
    lbl3rd: TLabel;
    lbl2nd: TLabel;
    lbl5th: TLabel;
    lbl4th: TLabel;
    lbl2: TLabel;
    lbl2S: TLabel;
    lbl3S: TLabel;
    lbl4S: TLabel;
    lbl5S: TLabel;
    lbl5: TLabel;
    lbl4: TLabel;
    lbl3: TLabel;
    imgtrophee1: TImage;
    imgtrophee2: TImage;
    lblTop: TLabel;
    lblChamp: TLabel;
    lblBack: TLabel;
    lblh: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lose;
    procedure FormActivate(Sender: TObject);
    procedure applespawn;
    procedure tmrSnakeTimer(Sender: TObject);
    procedure direction;
    procedure eatapple;
    procedure FormDestroy(Sender: TObject);
    procedure addNewbody;
    procedure newapplepos;
    procedure movebody;
    procedure checkbody;
    procedure pnlStartClick(Sender: TObject);
    procedure start;
    procedure pnlBackClick(Sender: TObject);
    procedure pnlHighClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lblBackClick(Sender: TObject);
  private
    iScore, iMove, iTopH, iLeftH, iTopA, iLeftA, iGrid, iTime: integer;
    bLeft, bRight, bUp, bDown, bStart: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

  TSnakebody = class(TShape)
  public
    constructor Create(AOwner: Tcomponent); override;
  end;

var
  frmSnake: TfrmSnake;
  list: Tlist;

implementation

uses games_u;
{$R *.dfm}

procedure TfrmSnake.addNewbody;
var
  newb, lastb: TSnakebody;
begin
  newb := TSnakebody.Create(self);
  newb.Parent := self;
  if list.Count >= 1 then
  begin
    lastb := TSnakebody(list.Items[list.Count - 1]);
    newb.left := lastb.left;
    newb.Top := lastb.Top;
    lastb := nil;
  end
  else
  begin
    newb.left := sH.left;
    newb.Top := sH.Top;
  end;
  list.Add(newb);
  newb := nil;
end;

procedure TfrmSnake.applespawn;
var
  i: integer;
  b: TSnakebody;
begin
  newapplepos;
  // loop through list + check i apple top + left lies within self.shapes top +left
  for i := 0 to list.Count - 1 do
  begin
    b := TSnakebody(list.Items[i]);
    if (b.Top = iTopA) AND (b.left = iLeftA) then
    begin
      newapplepos;
    end;
  end;
  sA.left := iLeftA;
  sA.Top := iTopA;
  iLeftA := 1;
  iTopA := 1;
end;

procedure TfrmSnake.checkbody;
var
  i: integer;
  b: TSnakebody;
begin
  if list.Count > 2 then
  begin
    for i := 0 to list.Count - 1 do
    begin
      b := TSnakebody(list.Items[i]);
      if (sH.Top = b.Top) AND (sH.left = b.left) then
      begin
        lose;
        break;
      end;
    end;
  end;
end;

procedure TfrmSnake.direction;
begin
  bLeft := false;
  bRight := false;
  bUp := false;
  bDown := false;
end;

procedure TfrmSnake.eatapple;
begin
  if (sH.left = sA.left) AND (sH.Top = sA.Top) then
  begin
    addNewbody;
    applespawn;
    iScore := iScore + 20;
    lblScore.Caption := inttostr(iScore);
    if tmrSnake.Interval > 20 then
    begin
      tmrSnake.Interval := tmrSnake.Interval - 2;
      tmrSnake.Enabled := true;
    end;

  end;
end;

procedure TfrmSnake.FormActivate(Sender: TObject);
begin
  frmSnake.Refresh;
  grpHighScores.Visible := false;
  frmSnake.BorderStyle := bsDialog;
  frmSnake.left := (Screen.Width - frmSnake.Width) div 2;
  frmSnake.Top := (Screen.Height - frmSnake.Height) div 2;
(imgstart.Picture.Graphic as TGIFImage)
  .Animate := true; // gets it goin'
(imgstart.Picture.Graphic as TGIFImage)
  .AnimationSpeed := 100; // adjust your speed
  frmSnake.Color := clBackground;
  sA.Visible := false;

  iGrid := 20;
  iTopA := 1;
  iLeftA := 1;
  iTopH := 1;
  iLeftH := 1;
  iTime := 1;
  bLeft := false;
  bRight := false;
  iScore := 0;
  lblScore.Caption := '0';
  bUp := false;
  bDown := false;
  sH.left := 240;
  lblScoreb4.Visible := false;
  lblScore.Visible := false;
  sH.Top := 460;
  iMove := iGrid;
  newapplepos;
  bStart := false;

  // --create lis
  list := Tlist.Create;
end;

procedure TfrmSnake.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  application.Terminate;
end;

procedure TfrmSnake.FormDestroy(Sender: TObject);
var
  i: integer;
  m: TSnakebody;
begin
  if assigned(list) then
  begin
    for i := 1 to list.Count - 1 do
    begin
      m := TSnakebody(list.Items[i]);
      freeandnil(m);
    end;
    list.Clear;
  end;
end;

procedure TfrmSnake.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_up) OR (Key = vk_down) OR (Key = vk_left) OR (Key = vk_right)
    then
  begin
    bStart := true;
    checkbody;
  end;

  if bStart = true then
  begin
    tmrSnake.Enabled := true;
  end;
  with sH do
  begin
    case Key of
      vk_up:
        begin
          start;
          direction;
          if Top > 0 then
            bUp := true
          else
            lose;
        end;

      vk_down:
        begin
          start;
          direction;
          if Top + Height < 500 then
            bDown := true
          else
            lose;
        end;

      vk_right:
        begin
          start;
          direction;
          if (left + Width) < 500 then
            bRight := true
          else
            lose;
        end;

      vk_left:
        begin
          start;
          direction;
          if left > 0 then
            bLeft := true
          else
            lose;
        end;
    end;
    if (left = sA.left) AND (Top = sA.Top) then
      applespawn;
  end;

end;

procedure TfrmSnake.lblBackClick(Sender: TObject);
begin
  grpHighScores.Visible := false;
  lblTop.Font.Size := 40;
  imgstart.Visible := true;
  pnlStart.Visible := true;
  pnlHelp.Visible := true;
  pnlBack.Visible := true;
  pnlHigh.Visible := true;
  lblh.Visible := false;
end;

procedure TfrmSnake.lose;
var
  i: integer;
  m: TSnakebody;
  bFound: boolean;
begin
  tmrSnake.Enabled := false;
  with dmmathsharks do
  begin
    bFound := false;
    i := objlearnerG.getID;
    tblUsers.active := true;
    tblUsers.First;
    while (not tblUsers.eof) and (bFound = false) do
    begin
      if (tblUsers['UserID'] = i) and (iScore > tblUsers['Snake Score']) then
      begin
        bFound := true;
        tblUsers.Edit;
        tblUsers['Snake Score'] := iScore;
        tblUsers.post;
      end;
      tblUsers.Next;
    end;
  end;
  if bFound = true then
  begin
    showmessage('You lost! You achieved a new highscore of: ' + inttostr
        (iScore) + '!');
  end
  else
    showmessage('You lost! You achieved a score of: ' + inttostr(iScore));
  lblScore.Caption := '0';
  pnlStart.Visible := true;
  pnlBack.Visible := true;
  pnlHigh.Visible := true;
  pnlHelp.Visible := true;
  imgstart.Visible := true;
  sH.Visible := false;
  sA.Visible := false;
  iScore := 0;
  iTime := 1;
  iTopA := 1;
  iLeftA := 1;
  iTopH := 1;
  iLeftH := 1;
  tmrSnake.Interval := 200;
  bLeft := false;
  bRight := false;
  bUp := false;
  bDown := false;
  newapplepos;
  iMove := iGrid;
  sH.left := 240;
  sH.Top := 260;
  applespawn;
  bStart := false;
  frmSnake.Refresh;
  if assigned(list) then
  begin
    for i := list.Count - 1 downto 0 do
    begin
      m := TSnakebody(list.Items[i]);
      m.Destroy;
    end;
    list.Clear;
    freeandnil(list);
  end;
  list := Tlist.Create;
  frmSnake.Refresh;

end;

procedure TfrmSnake.movebody;
var
  i: integer;
  botBody, topBody: TSnakebody;
begin
  for i := list.Count - 1 downto 1 do
  begin
    botBody := TSnakebody(list.Items[i - 1]);
    topBody := TSnakebody(list.Items[i]);
    topBody.left := botBody.left;
    topBody.Top := botBody.Top;
  end;
  if list.Count > 0 then
  begin
    botBody := TSnakebody(list.Items[0]);
    botBody.left := sH.left;
    botBody.Top := sH.Top;
  end;

  botBody := nil;
  topBody := nil;

end;

procedure TfrmSnake.newapplepos;
begin
  iTopA := 1;
  iLeftA := 1;
  while (NOT(iTopA MOD iGrid = 0)) do
    iTopA := randomrange(20, 401);
  while NOT(iLeftA MOD iGrid = 0) do
    iLeftA := randomrange(20, 401);

  sA.left := iLeftA;
  sA.Top := iTopA;
end;

procedure TfrmSnake.pnlBackClick(Sender: TObject);
begin
  frmSnake.Visible := false;
  frmGames.Visible := true;
end;

procedure TfrmSnake.pnlHighClick(Sender: TObject);
var
  i: integer;
begin
  with dmmathsharks do
  begin
    pnlStart.Visible := false;
    pnlBack.Visible := false;
    pnlHigh.Visible := false;
    pnlHelp.Visible := false;
    lblh.Visible := true;
    grpHighScores.Visible := true;
    imgstart.Visible := false;
    tblUsers.open;
    tblUsers.Sort := '[Snake Score] DESC';
    lbl1.Caption := tblUsers['Username'];
    lblTop.Caption := lbl1.Caption;
    lbl1S.Caption := tblUsers['Snake Score'];
    for i := 1 to length(lbl1S.Caption) do
    begin
      lblTop.Font.Size := lblTop.Font.Size - 6;
    end;
    tblUsers.Next;
    lbl2.Caption := tblUsers['Username'];
    lbl2S.Caption := tblUsers['Snake Score'];
    tblUsers.Next;
    lbl3.Caption := tblUsers['Username'];
    lbl3S.Caption := tblUsers['Snake Score'];
    tblUsers.Next;
    lbl4.Caption := tblUsers['Username'];
    lbl4S.Caption := tblUsers['Snake Score'];
    tblUsers.Next;
    lbl5.Caption := tblUsers['Username'];
    lbl5S.Caption := tblUsers['Snake Score'];
    tblUsers.Close;
  end;
end;

procedure TfrmSnake.pnlStartClick(Sender: TObject);
begin
  start;
  bUp := true;
  imgstart.Visible := false;
end;

procedure TfrmSnake.start;
begin
  pnlStart.Visible := false;
  pnlBack.Visible := false;
  pnlHigh.Visible := false;
  pnlHelp.Visible := false;
  sH.Visible := true;
  sA.Visible := true;
end;

procedure TfrmSnake.tmrSnakeTimer(Sender: TObject);
begin
  with sH do
  begin
    if bStart = true then
    begin

      frmSnake.Refresh;
      if iTime = 1 then
      begin
        tmrSnake.Enabled := true;
        inc(iTime);
      end;
      imgstart.Visible := false;
      lblscoreb4.Visible := true;
      lblScore.Visible := true;
      sA.Visible := true;
      if (bLeft = true) AND (left > 0) then
      begin
        movebody;
        left := left - iMove;
        checkbody;
        eatapple;
      end
      else if bRight = true AND (left + Width < 500) then
      begin
        movebody;
        left := left + iMove;
        checkbody;
        eatapple;
      end
      else if bUp = true AND (Top > 0) then
      begin
        movebody;
        Top := Top - iMove;
        checkbody;
        eatapple;
      end
      else if bDown = true AND (Top + Height < 500) then
      begin
        movebody;
        Top := Top + iMove;
        checkbody;
        eatapple;
      end
      else
        lose;
    end;
  end;
end;
{ TSnakebody }

constructor TSnakebody.Create(AOwner: Tcomponent);
begin
  inherited;
  self.Shape := stSquare;
  self.Width := 20;
  self.Height := 20;
  self.Brush.Color := RGB(randomrange(100, 256), randomrange(100, 256),
    randomrange(100, 256));
end;

end.
