unit Main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, GIFImg, math, jpeg, StdCtrls, TeEngine, TeeProcs,
  Chart, Grids, DBGrids, ComCtrls, dmMathSharks_u, Series, shellAPI, dateutils,
  WinINet, games_u, clsStudent_u;

type
  TfrmMain = class(TForm)
    imgLogo: TImage;
    imgGif: TImage;
    imgBack: TImage;
    imgSprite: TImage;
    grpLogin: TGroupBox;
    edtUsername: TEdit;
    edtPassword: TEdit;
    btnVisible: TButton;
    btnLogin: TButton;
    btnCreateNew: TButton;
    lblFront: TLabel;
    grpTeacher: TGroupBox;
    imglogoteach: TImage;
    dbgDB: TDBGrid;
    lblWelcome: TLabel;
    lblTeacher: TLabel;
    lblUsersBelow: TLabel;
    prgpass: TProgressBar;
    lblPass: TLabel;
    ChrtAns: TChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    grpCreateNew: TGroupBox;
    imgNew: TImage;
    lblCreate: TLabel;
    edtName: TEdit;
    edtSurname: TEdit;
    edtNewPass: TEdit;
    dtbDOB: TDateTimePicker;
    edtNewName: TEdit;
    cmbGender: TComboBox;
    btnCancel: TButton;
    btnvis: TButton;
    btncreate: TButton;
    imglogoC: TImage;
    scbcourse: TScrollBox;
    lblBenchmark: TLabel;
    imglogoscb: TImage;
    rgpAnswers: TRadioGroup;
    lblQ1: TLabel;
    grpAnswers: TGroupBox;
    pnlA: TPanel;
    pnlB: TPanel;
    pnlC: TPanel;
    pnlD: TPanel;
    tmrq: TTimer;
    prbTime: TProgressBar;
    btnSubmit: TButton;
    lblq2: TLabel;
    imgq: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl6: TLabel;
    red1: TRichEdit;
    red3: TRichEdit;
    red6: TRichEdit;
    red9: TRichEdit;
    red7: TRichEdit;
    red8: TRichEdit;
    red4: TRichEdit;
    red5: TRichEdit;
    red2: TRichEdit;
    imgAdd: TImage;
    imgSub: TImage;
    cmbExtra: TComboBox;
    pnlBenchmarklbl: TPanel;
    Series3: TPieSeries;
    rgpSort: TRadioGroup;
    imghelp1: TImage;
    imgout1: TImage;
    lblOutTeach: TLabel;
    imghelp3: TImage;
    lblteachhelp: TLabel;
    lblHelpFront: TLabel;
    pnlSort: TPanel;
    pnlDelete: TPanel;
    pnlSearch: TPanel;
    pnlFeedback: TPanel;
    pnlPass: TPanel;
    pnlCourseEng: TPanel;
    pnlCourseZulu: TPanel;
    pnlPi: TPanel;
    pnlBar: TPanel;
    dbgDb1: TDBGrid;
    btnGames: TButton;
    imgOutScb: TImage;
    lblScbLog: TLabel;
    imgoutAnswers: TImage;
    lblOutanswers: TLabel;
    imgb: TImage;
    redOut: TRichEdit;
    btnSubmitChanges: TButton;
    imghelpG: TImage;
    lblscbHelp: TLabel;
    imgHelp: TImage;
    lblHelpBack: TLabel;
    procedure shell(s: Pwidechar);
    procedure FormActivate(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnVisibleClick(Sender: TObject);
    procedure btnSortClick(Sender: TObject);
    procedure btncreateClick(Sender: TObject);
    procedure btnCreateNewClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure checkanswer;
    procedure makepasswordvisible(edtEdit: TEdit);
    procedure Q1;
    procedure Q2;
    procedure Q3;
    procedure Q4;
    procedure Q5;
    procedure Q6;
    procedure Q7;
    procedure Q8;
    procedure Q9;
    procedure Q10;
    procedure time;
    procedure show;
    procedure logbench;
    procedure course(stextfile: string);
    function sDialog(sWord: string): string;
    function Messages(sMessage: string): boolean;
    procedure fixpos(mylabel: TLabel; myImg: TImage);
    function validation(sWord: string): boolean; // validate user
    function validuser(sWord: string): boolean;
    function validpass(sWord: string): boolean;
    procedure Label8Click(Sender: TObject);
    procedure question;
    procedure bar;
    procedure tmrqTimer(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
    procedure lblBenchmarkClick(Sender: TObject);
    procedure centre;
    procedure changecourse(stextfile: string);
    procedure cmbExtraClick(Sender: TObject);
    procedure rgpSortClick(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure imgout1Click(Sender: TObject);
    procedure lblOutTeachClick(Sender: TObject);
    procedure wqerClick(Sender: TObject);
    procedure qwerqwerweqClick(Sender: TObject);
    procedure pnlSortClick(Sender: TObject);
    procedure pnlDeleteClick(Sender: TObject);
    procedure pnlSearchClick(Sender: TObject);
    procedure pnlPassClick(Sender: TObject);
    procedure pnlPiClick(Sender: TObject);
    procedure pnlBarClick(Sender: TObject);
    procedure btnGamesClick(Sender: TObject);
    procedure pnlFeedbackClick(Sender: TObject);
    procedure btnvisClick(Sender: TObject);
    procedure pnlCourseEngClick(Sender: TObject);
    procedure btnSubmitChangesClick(Sender: TObject);
    procedure pnlCourseZuluClick(Sender: TObject);
    procedure imghelpGClick(Sender: TObject);
    procedure imghelp3Click(Sender: TObject);
    procedure lblHelpBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imghelp1Click(Sender: TObject);

  private
    iMinW, iMinH, icountpassword, iUser, iAnswer, iQuestion, ipass,
      iFordelete: integer;
    bMoving, bTeacher, bTest: boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  objLearner: Tlearner;

implementation

{$R *.dfm}

procedure TfrmMain.btnLoginClick(Sender: TObject);
var
  sUsername, sPassword: string;
  bEmpty, bLogin, bEnglish, bstudent: boolean;
begin
  sUsername := edtUsername.Text;
  sPassword := edtPassword.Text;
  bEmpty := false;
  bTeacher := false;
  bstudent := false;
  bLogin := false;
  bEnglish := false;
  if (sUsername = '') or (sPassword = '') then
  begin
    bEmpty := true;
    showmessage('Please enter something into the fields then log in');
  end;
  if bEmpty = false then
  begin
    with dmMathSharks do
    begin
      tblusers.First;
      repeat
        if (uppercase(sUsername) = uppercase(tblusers['Username'])) and
          (sPassword = tblusers['Password']) and (tblusers['Teacher'] = true)
          then
        begin
          bTeacher := true;
          showmessage('welcome teacher');
          iUser := tblusers['UserID'];
          objLearner := Tlearner.Create(tblusers['UserID'],
            tblusers['Snake Score'], tblusers['Math Score'],
            tblusers['TTT Wins'], tblusers['FirstName']);
          bar;
          iQuestion := 0;
        end
        else if (uppercase(sUsername) = uppercase(tblusers['Username'])) and
          (sPassword = tblusers['Password']) then
        begin
          bLogin := true;
          iUser := tblusers['UserID'];
          objLearner := Tlearner.Create(tblusers['UserID'],
            tblusers['Snake Score'], tblusers['Math Score'],
            tblusers['TTT Wins'], tblusers['FirstName']);
          bstudent := true;
          iQuestion := 0;
        end;
        tblusers.Next;
      until tblusers.Eof or (bTeacher = true) or (bLogin = true);
    end;
  end;
  if bTeacher = true then
  begin
    scbcourse.Visible := false;
    grpLogin.Visible := false;
    grpTeacher.Visible := true;
    frmMain.Top := 0;
    frmMain.left := 0;
    grpTeacher.width := 1201;
    grpTeacher.Height := 590;
    frmMain.width := grpTeacher.width;
    frmMain.Height := grpTeacher.Height;
    centre;
    Series1.Clear;
    Series2.Clear;
    centre;
    centre;
    grpTeacher.Top := 0;
    grpTeacher.left := 0;
    redout.Lines.Clear;
    redout.Visible := false;
    lblUsersbelow.Visible := true;
    btnSubmitchanges.Visible := false;
  end
  else if bstudent = true then
  begin
    bEnglish := Messages(
      ' Welcome student!. Would you like to take the course in English? No to take the course in Zulu.');
    if bEnglish = true then
    begin
      // english
      course('Englishcourse.txt');
    end
    else
    begin
      // zulu
      course('Zulucourse.txt');
    end;
    scbcourse.left := 0;
    scbcourse.Top := 0;
    grpLogin.Visible := false;
    scbcourse.Visible := true;
    scbcourse.width := 963;
    scbcourse.Height := 595;
    frmMain.width := scbcourse.width + 4;
    frmMain.Height := scbcourse.Height + 10;
    centre;
    scbcourse.VertScrollBar.Position := 0;
  end;

end;

procedure TfrmMain.btnLogoutClick(Sender: TObject);
begin
  grpTeacher.Visible := false;
  grpLogin.Visible := true;
  grpLogin.Top := 0;
  grpLogin.left := 0;
  frmMain.BorderStyle := bsdialog;
  grpLogin.width := 305;
  grpLogin.Height := 401;
  frmMain.width := 305;
  frmMain.Height := 401;
  centre;
end;

procedure TfrmMain.btnVisibleClick(Sender: TObject);
begin
  makepasswordvisible(edtPassword);
end;

procedure TfrmMain.centre;
begin
  frmMain.left := (screen.width - width) div 2;
  frmMain.Top := (screen.Height - Height) div 2;
end;

procedure TfrmMain.changecourse(stextfile: string);
var
  Tfile: textfile;
  sLine, sstring: string;
begin

  lblUsersbelow.visible := false;
  redOut.Visible := true;
  redOut.BringToFront;
  btnSubmitchanges.BringToFront;
  redOut.left := 0;
  redOut.width := clientwidth;
  btnSubmitChanges.Visible := true;

  if FileExists(stextfile) then
  begin
    assignfile(Tfile, stextfile);
    reset(Tfile);
    while not Eof(Tfile) do
    begin
      readln(Tfile, sLine);
      redOut.Lines.Add(sLine);
    end;
  end;
  closefile(tFile);
  showmessage('Make absolutely any changes you want below!' + #10+#10+
    'EACH PARAGRAPH IS SEPERATED BY A #, PLEASE ENSURE YOU DO NOT ADD OR DELETE ANY HASTAGS. ' +#10+#10+
    'Once you are done making changes click the submit button and your changes will be saved!');
end;

procedure TfrmMain.checkanswer;
var
  answer: integer; // temporary, replace with group box answer
  sQ: string;
  bFound: boolean;
begin
  bFound := false;
  if iAnswer = rgpAnswers.ItemIndex then
  begin
    sQ := 'Question ' + inttostr(iQuestion);
    with dmMathSharks do
    begin
      tblAnswers.First;
      if iAnswer = rgpAnswers.ItemIndex then
      begin
        while (not tblAnswers.Eof) or (bFound = false) do
        begin
          if iUser = tblAnswers['UserID'] then
          begin
            tblAnswers.Edit;
            tblAnswers[sQ] := true;
            tblAnswers['Score'] := tblAnswers['Score'] + 1;
            tblAnswers.Post;
            bFound := true;
          end;
          tblAnswers.Next;
        end;
      end;
    end;
  end;

end;

procedure TfrmMain.cmbExtraClick(Sender: TObject);
begin

  case cmbExtra.ItemIndex of
    0:
      begin
        shell('https://www.youtube.com/watch?v=F5laZoTo-AY');
      end;
    1:
      begin
        shell('https://www.youtube.com/watch?v=YFyOsvnr9ig');
      end;
    2:
      begin
        shell('https://www.youtube.com/watch?v=s1Ly3cX4yHc');
      end;
    3:
      begin
        shell('https://www.youtube.com/watch?v=wbkHv9zcGhI');
      end;
    4:
      begin
        shell('https://www.youtube.com/watch?v=PcEwj5_v75g');
      end;
    5:
      begin
        shell('https://www.youtube.com/watch?v=8BDkwmieBN0');
      end;
    6:
      begin
        shell('https://www.youtube.com/watch?v=Lj4YxVZWLVU');
      end;
    7:
      begin
        shell('https://www.youtube.com/watch?v=HhHqXHCN2-g');
      end;

  end;

end;

procedure TfrmMain.course(stextfile: string);
var
  Tfile: textfile;
  sLine, sstring: string;
begin
  red1.Lines.Clear;
  red2.Lines.Clear;
  red3.Lines.Clear;
  red4.Lines.Clear;
  red5.Lines.Clear;
  red6.Lines.Clear;
  red7.Lines.Clear;
  red8.Lines.Clear;
  red9.Lines.Clear;
  if FileExists(stextfile) then
  begin
    assignfile(Tfile, stextfile);
    reset(Tfile);
    while not Eof(Tfile) do
    begin
      readln(Tfile, sLine);
      sstring := sstring + copy(sLine, 1, length(sLine));
    end;
    closefile(Tfile);
    red1.Lines.Add(sDialog(sstring));
    Delete(sstring, 1, pos('#', sstring));
    red2.Lines.Add(sDialog(sstring));
    Delete(sstring, 1, pos('#', sstring));
    red3.Lines.Add(sDialog(sstring));
    Delete(sstring, 1, pos('#', sstring));
    red4.Lines.Add(sDialog(sstring));
    Delete(sstring, 1, pos('#', sstring));
    red5.Lines.Add(sDialog(sstring));
    Delete(sstring, 1, pos('#', sstring));
    red6.Lines.Add(sDialog(sstring));
    Delete(sstring, 1, pos('#', sstring));
    red7.Lines.Add(sDialog(sstring));
    Delete(sstring, 1, pos('#', sstring));
    red8.Lines.Add(sDialog(sstring));
    Delete(sstring, 1, pos('#', sstring));
    red9.Lines.Add(sDialog(sstring));
    Delete(sstring, 1, pos('#', sstring));
  end
  else
    showmessage('file not found, contact teacher.');

end;

procedure TfrmMain.fixpos(mylabel: TLabel; myImg: TImage);
var
  iMidimg: integer;
begin
  iMidimg := myImg.left + ceil(myImg.width / 2);
  mylabel.left := iMidimg - ceil(mylabel.width / 2);
end;

procedure TfrmMain.btnCancelClick(Sender: TObject);
begin
  grpLogin.Visible := true;
  grpCreateNew.Visible := false;
  edtNewName.Clear;
  edtNewPass.Clear;
  edtName.Clear;
  edtSurname.Clear;
  cmbGender.ItemIndex := -1;
end;

// -----------------------------------------------
// Create new user + check if valid and add to DB
// -----------------------------------------------
procedure TfrmMain.btncreateClick(Sender: TObject);

var
  sName, sSurname, sUsername, sPassword, sGender: string;
  dDOB: TDate;
  bValid, bUser, bName, bSur, bNil, bPass: boolean;
  i: integer;
begin
  bValid := false;
  bUser := true;
  bName := true;
  bSur := true;
  bNil := true;
  bPass := true;
  sName := edtName.Text;
  dDOB := dtbDOB.Date;
  sSurname := edtSurname.Text;
  sUsername := edtNewName.Text;
  sPassword := edtNewPass.Text;
  if (cmbGender.ItemIndex = -1) or (sName = '') or (sSurname = '') or
    (sUsername = '') or (sPassword = '') then
  // nothing is empty
  begin
    showmessage('Please fill in all the fields before creating your account');
    bNil := false;
  end;
  bName := validation(sName);
  bSur := validation(sSurname);
  bUser := validuser(sUsername);
  bPass := validpass(sPassword);

  if bName = true and (bSur = true) and (bUser = true) and (bPass = true) and
    (bNil = true) then
    bValid := true; // is everything valid

  if bValid = true then
  begin
    showmessage('Welcome new user: ' + sUsername +
        ' please log in to continue!');
    grpCreateNew.Visible := false;
    grpLogin.Visible := true;
    edtUsername.Text := sUsername;
    edtPassword.Text := sPassword;
    edtNewPass.Clear;
    edtNewName.Clear;
    edtName.Clear;
    edtSurname.Clear;
    sGender := cmbGender.Items[cmbGender.ItemIndex];

    with dmMathSharks do
    begin
      tblusers.Append;
      tblusers['Firstname'] := sName;
      tblusers['Surname'] := sSurname;
      tblusers['DOB'] := dDOB;
      tblusers['Username'] := sUsername;
      tblusers['Password'] := sPassword;
      tblusers['Gender'] := sGender;
      tblusers['Teacher'] := false;
      tblusers['Snake Score'] := 0;
      tblusers['Math Score'] := 0;
      tblusers['TTT wins'] := 0;
      tblusers.Post;
      i := tblusers['UserID'];

      tblAnswers.Append;
      tblAnswers['UserID'] := i;
      tblAnswers['Question 1'] := false;
      tblAnswers['Question 2'] := false;
      tblAnswers['Question 3'] := false;
      tblAnswers['Question 4'] := false;
      tblAnswers['Question 5'] := false;
      tblAnswers['Question 6'] := false;
      tblAnswers['Question 7'] := false;
      tblAnswers['Question 8'] := false;
      tblAnswers['Question 9'] := false;
      tblAnswers['Question 10'] := false;
      tblAnswers['Score'] := 0;
      tblAnswers.Post;
      { qryshow.Close;
        qryshow.SQL.Text :=
        'Insert INTO Answers(UserID, [Question 1], [Question 2], [Question 3], [Question 4], [Question 5], [Question 6], [Question 7], [Question 8], [Question 9], [Question 10], Score)' + ' Values (' + '"' + inttostr(tblusers['UserID']) + '"' + ', false, false, false, false, false, false, false, false, false, false, 0)';
        qryshow.ExecSQL; }

      { tblanswers.Last;
        tblAnswers.Refresh;
        showmessage(inttostr(tblAnswers['UserID'])); }

    end;
  end;
end;
// -----------------------------------------------
// Check if user is valid + and/or admin
// -----------------------------------------------

procedure TfrmMain.btnCreateNewClick(Sender: TObject);
begin
  grpLogin.Visible := false;
  grpCreateNew.Visible := true;
  icountpassword := 1;
end;

procedure TfrmMain.btnGamesClick(Sender: TObject);
begin
  frmMain.Visible := false;
  frmGames.Visible := true;
end;


procedure TfrmMain.btnSortClick(Sender: TObject);
begin
  rgpSort.Visible := true;
  lblPass.Visible := false;
  rgpSort.Refresh;
end;

procedure TfrmMain.btnSubmitChangesClick(Sender: TObject);
var
  Tfile, tnew: textfile;
begin
  case iFordelete of
    0:
      begin
        lblUsersbelow.visible := true;
        redout.Visible := false;
        btnSubmitchanges.Visible := false;
        if FileExists('Englishcourse.txt') then
        begin
          assignfile(tnew, 'Temp.txt');
          rewrite(tnew);
          writeln(tnew, redOut.Text);
          closefile(tnew);
          deletefile('Englishcourse.txt');
          renamefile('Temp.txt', 'Englishcourse.txt');
          showmessage('You have succesfully changed the courses text!');
        end;
      end;
    1:
      begin
        lblUsersbelow.visible := true;
        redout.Visible := false;
        btnSubmitchanges.Visible := false;
        if FileExists('Zulucourse.txt') then
        begin
          assignfile(tnew, 'Temp.txt');
          rewrite(tnew);
          writeln(tnew, redOut.Text);
          showmessage('You have succesfully changed the courses text!');
          closefile(tnew);
          deletefile('Zulucourse.txt');
          renamefile('Temp.txt', 'Zulucourse.txt');
        end;
      end;
  end;
end;

procedure TfrmMain.btnSubmitClick(Sender: TObject);
var
  bGames, bRetry, bFound, bPass: boolean;
  iID1: integer;
begin
  tmrq.Enabled := false;
  prbTime.Position := 0;
  frmMain.Refresh;
  bFound := false;
  bPass := false;
  checkanswer;
  inc(iQuestion);
  question;
  rgpAnswers.ItemIndex := -1;
  if iQuestion = 11 then
  begin
    with dmMathSharks do
    begin
      btnSubmit.Enabled := false;
      iQuestion := 0;
      iID1 := objLearner.getID;
      if tblAnswers['Score'] >= 5 then
      begin
        tblAnswers.Edit;
        tblAnswers['Pass'] := true;
        tblAnswers.Post;
        bFound := true;
      end;

      if bFound = true then
      begin
        bGames := Messages(
          'Well done! You have finished the benchmark test and passed! Would you like to go to the games form?');
      end
      else
        bRetry := Messages(
          'Well done! You have finished the benchmark test. Unfortunately you did not pass, would you like to try again?');

      if bGames = true then
      begin
        frmGames.Visible := true;
        frmMain.Visible := false;
        objLearner.Destroy;
      end
      else
      begin
        imgoutAnswers.Visible := true;
        lblOutanswers.Visible := true;
        logbench;
      end;

      if bRetry = true then
      begin
        grpAnswers.Visible := false;
        scbcourse.left := 0;
        scbcourse.Top := 0;
        grpLogin.Visible := false;
        scbcourse.Visible := true;
        scbcourse.width := 963;
        scbcourse.Height := 595;
        frmMain.width := scbcourse.width + 4;
        frmMain.Height := scbcourse.Height + 10;
        centre;
        logbench;
      end
      else
      begin
        imgoutAnswers.Visible := true;
        lblOutanswers.Visible := true;
        logbench;
      end;

    end;

  end;
end;

procedure TfrmMain.btnvisClick(Sender: TObject);
begin
  makepasswordvisible(edtNewPass);
end;

procedure TfrmMain.bar;
begin
  ipass := 0;
  with dmMathSharks do
  begin
    tblAnswers.First;
    while not tblAnswers.Eof do
    begin
      if tblAnswers['Pass'] = true then
        inc(ipass);
      tblAnswers.Next;
    end;
    prgpass.Max := tblAnswers.RecordCount;
    prgpass.Position := ipass;
    lblPass.Caption := 'Learner pass percentage: ' + inttostr
      (ceil((ipass / tblAnswers.RecordCount) * 100));
  end;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
var
  sFile: string;
begin
  with dmMathSharks do
  begin
    commathsharks.Connected := false;
    sFile := ExtractFilePath(Application.ExeName) + 'mathcourse.mdb';
    if FileExists(sFile) then
    begin
      commathsharks.ConnectionString :=
        'Provider=Microsoft.Jet.OLEDB.4.0;Data Source="' + sFile +
        '";Mode=ReadWrite;Persist Security Info=False';
    end
    else
      showmessage('Database is NOT connected');

    tmrq.Enabled := false;
    tblAnswers.Active := true;
    tblusers.Active := true;
    dbgDB.DataSource := dsUsers;

  end;

  grpAnswers.Visible := false;
  grpLogin.Visible := true;
  grpCreateNew.Visible := false;
  iMinW := 0;
  iMinH := 0;
  icountpassword := 1;
  bTeacher := false;
  grpTeacher.Visible := false;
  windowstate := wsNormal;
  grpLogin.Top := 0;
  grpLogin.left := 0;
  frmMain.BorderStyle := bsdialog;
  grpLogin.width := 305;
  grpLogin.Height := 401;
  grpCreateNew.width := grpLogin.width;
  grpCreateNew.Height := grpLogin.Height;
  bTest := false;
  grpAnswers.Visible := false;
  scbcourse.Visible := false;
  clientwidth := grpLogin.width;
  clientheight := grpLogin.Height;
  frmMain.left := (screen.width - width) div 2;
  frmMain.Top := (screen.Height - Height) div 2;
  grpCreateNew.Top := grpLogin.Top;
  grpCreateNew.left := grpLogin.left;
  imgLogo.width := clientwidth;
  lblq2.Caption := '';
  imgBack.width := clientwidth;
  imgBack.Height := frmMain.Height;
  imgSprite.Top := imgLogo.Top + 40;
  imgSprite.left := 350;
  bMoving := false;
  imgNew.Top := grpCreateNew.Top;
  imgNew.left := grpCreateNew.left;
  imgNew.width := grpCreateNew.width;
  imgNew.Height := grpCreateNew.Height;
  iQuestion := 0; // for when adding either correct or incorrect to db (tblquestions['Question' + iQuestion]);
  iAnswer := -5; // for storing answer from radiogroup
  { (Imggif.Picture.Graphic as TGIFImage).Animate := True;// gets it goin'
    (Imggif.Picture.Graphic as TGIFImage).AnimationSpeed:= 10;// adjust your speed
    frmMain.DoubleBuffered := True;// stops flickering }
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  application.Terminate;
end;

procedure TfrmMain.imghelp1Click(Sender: TObject);
begin
  showmessage('Please log in with your details below. If you do not have an account you may create one by clicking the create button.');
end;

procedure TfrmMain.imghelp3Click(Sender: TObject);
begin
  imghelp.Visible := true;
  imghelp.Top := 0;
  imghelp.Left := 0;
  imghelp.BringToFront;
  imghelp.Width := clientwidth;
  imghelp.Height := clientheight;
  lblHelpback.Visible := true;
  lblHelpback.BringToFront;
  dbgDB.Visible := false;
  dbgDB1.Visible := false;
  chrtans.Visible := false;
  pnlPi.Visible := false;
  pnlBar.Visible := false;
  pnlCourseeng.Visible := false;
  pnlCourseZulu.Visible := false;
  pnldelete.Visible := false;
  pnlfeedback.Visible := false;
  pnlPass.Visible := false;
  pnlPi.Visible := false;
  pnlSearch.Visible := false;
  pnlsort.Visible := false;
  redout.Lines.Clear;
  redout.Visible := false;
  btnSubmitchanges.Visible := false;
  rgpSort.Visible := false;
  prgpass.Visible := false;
end;

procedure TfrmMain.imghelpGClick(Sender: TObject);
begin
  showmessage('The below boxes contain valuable information for you to revise before taking the benchmark test.'+#10+#10+
  'You can navigate the course by using the scrollbar on the right hand side of the page. If you need extra help, there is a box at the top left of the page with topic names which when clicked will direct you to extra help');
end;

procedure TfrmMain.imgout1Click(Sender: TObject);
begin
  imgoutAnswers.Visible := false;
  lblOutanswers.Visible := false;
  tmrq.Enabled := false;
  prbTime.Position := 0;
  grpTeacher.Visible := false;
  grpAnswers.Visible := false;
  scbcourse.Visible := false;
  grpCreateNew.Visible := false;
  grpLogin.Visible := true;
  grpLogin.Top := 0;
  grpLogin.left := 0;
  frmMain.BorderStyle := bsdialog;
  grpLogin.width := 305;
  grpLogin.Height := 401;
  frmMain.width := 305;
  frmMain.Height := 401;
  centre;
  scbcourse.Visible := false;
  objLearner.Destroy;
end;

procedure TfrmMain.lblBenchmarkClick(Sender: TObject);
var
  byes, bFound: boolean;
  iIdbench: integer;
  iQ: integer;
  sQ: string;

begin
  byes := Messages('Would you like to take the benchmark test?');
  bFound := false;
  if byes = true then
  begin
    with dmMathSharks do
    begin
      tblAnswers.First;
      iIdbench := objLearner.getID;
      while (not tblAnswers.Eof) or (bFound = false) do
      begin
        if tblAnswers['UserID'] = iIdbench then
        begin
          bFound := true;
          tblAnswers.Edit;
          tblAnswers['Score'] := 0;
          for iQ := 1 to 10 do
          begin
            sQ := 'Question ' + inttostr(iQ);
            tblAnswers[sQ] := false;
          end;
          tblAnswers.Post;
        end;
        tblAnswers.Next;
      end;
    end;
    btnSubmit.Enabled := true;
    imgoutAnswers.Visible := false;
    lblOutanswers.Visible := false;
    grpAnswers.Visible := true;
    scbcourse.Visible := false;
    grpAnswers.Top := 0;
    grpAnswers.left := 0;
    grpAnswers.width := 586;
    grpAnswers.Height := 478;
    imgb.left := 0;
    imgb.Top := 0;
    imgb.width := grpAnswers.width;
    imgb.Height := grpAnswers.Height;
    imgb.SendToBack;
    frmMain.width := grpAnswers.width;
    frmMain.Height := grpAnswers.Height + 30;
    centre;
    fixpos(lblQ1, imgb);
    fixpos(lblq2, imgb);
    showmessage('Ready...');
    showmessage('Steady...');
    showmessage('Go!');
    btnSubmit.OnClick(lblBenchmark);
  end;

end;

procedure TfrmMain.lblHelpBackClick(Sender: TObject);
begin
  imghelp.Visible := false;
  lblHelpback.Visible := false;
  lblHelpback.BringToFront;
  dbgDB.Visible := true;
  chrtans.Visible := true;
  pnlPi.Visible := true;
  pnlBar.Visible := true;
  pnlCourseeng.Visible := true;
  pnlCourseZulu.Visible := true;
  pnldelete.Visible := true;
  pnlfeedback.Visible := true;
  pnlPass.Visible := true;
  pnlPi.Visible := true;
  pnlSearch.Visible := true;
  pnlsort.Visible := true;
  prgpass.Visible := true;
end;

procedure TfrmMain.logbench;
begin
  scbcourse.VertScrollBar.Position := 0;
  iQuestion := 0;
  lblq2.Caption := '';
  lblq2.Font.size := -15;
end;

procedure TfrmMain.makepasswordvisible(edtEdit: TEdit);
begin
  if NOT(icountpassword MOD 2 = 0) then
  begin
    inc(icountpassword);
    edtEdit.Passwordchar := #0;
  end
  else if icountpassword MOD 2 = 0 then
  begin
    inc(icountpassword);
    edtEdit.Passwordchar := '*';
  end;
end;

procedure TfrmMain.lblOutTeachClick(Sender: TObject);
begin
  grpTeacher.Visible := false;
  grpLogin.Visible := true;
  grpLogin.Top := 0;
  grpLogin.left := 0;
  frmMain.BorderStyle := bsdialog;
  grpLogin.width := 305;
  grpLogin.Height := 401;
  frmMain.width := 305;
  frmMain.Height := 401;
  centre;
end;

procedure TfrmMain.Label8Click(Sender: TObject);
begin
  Q1;
end;

function TfrmMain.Messages(sMessage: string): boolean;
var
  i: integer;
begin
  i := MessageDlg(sMessage, mtCustom, [mbYes, mbNo], 0);
  case i of
    mrYes:
      result := true;
    mrNo:
      result := false;
  end;
end;

procedure TfrmMain.pnlBarClick(Sender: TObject);
var
  iYes, i: integer;
  s: string;
begin
  iYes := 0;
  Series1.Clear;
  Series2.Clear;
  ChrtAns.title.Clear;
  Series1.Visible := true;
  Series2.Visible := true;
  Series3.Visible := false;
  Series3.Clear;
  // ChrtAns.Title.Text := 'Bar Graph showing the learners questions answered';
  with dmMathSharks do
  begin
    tblAnswers.First;
    for i := 1 to 10 do
    begin
      tblAnswers.First;
      s := 'Question ' + inttostr(i);
      while not tblAnswers.Eof do
      begin
        if tblAnswers[s] = true then
        begin
          inc(iYes);
        end;
        tblAnswers.Next;
      end;
      With Series1 do
      begin
        Add(iYes, s[1] + inttostr(i), clRed); // so here you just add to the series you create in the TChart component
        // the add command requires first the value of the bar --> x-title of bar --> color
        // so basically its y-coordinate, x-title, bar-color
        Series2.Add(tblAnswers.RecordCount - iYes, '', clBlue);
      end;
      iYes := 0;
    end;
  end;
end;

procedure TfrmMain.pnlCourseEngClick(Sender: TObject);
var
  Tfile, tnew: textfile;

begin
  changecourse('Englishcourse.txt');
  iFordelete := 0;
  btnSubmitchanges.Visible := true;

end;

procedure TfrmMain.pnlCourseZuluClick(Sender: TObject);
begin
  changecourse('Zulucourse.txt');
  iFordelete := 1;
  btnSubmitchanges.Visible := true;
end;

procedure TfrmMain.pnlDeleteClick(Sender: TObject);
var
  sDelete, sstring: string;
  bDelete, bFound: boolean;
  i: integer;
begin
  bFound := false;
  bDelete := false;
  sDelete := inputbox('',
    'Please enter the users username of which you want to delete below (NB not first name!) ', 'Swagerboy');
  sstring := 'Do you wish to delete user ' + sDelete +
    ' and all their details from the database?';
  with dmMathSharks do
  begin
    tblusers.First;
    repeat
      if (uppercase(sDelete) = uppercase(tblusers['Username'])) then
      begin
        bDelete := Messages(sstring);
        bFound := true;
        if bDelete = true then
        begin
          i := tblusers['UserID'];
          qryshow.Close;
          qryshow.SQL.Text := 'Delete * from Answers' + ' Where UserID = ' +
            inttostr(i);
          qryshow.ExecSQL;
          tblusers.Delete;
          showmessage('User ' + sDelete +
              ' has been succesfully deleted from the databse');

        end
        else
          showmessage('User ' + sDelete + ' will not be deleted');
      end;
      tblusers.Next;
    until tblusers.Eof or (bFound = true);
    if bFound = false then
      showmessage('User: ' + sDelete + ' does not exist');
  end;
end;

procedure TfrmMain.pnlFeedbackClick(Sender: TObject);
var
  sSubject, sbody, smailAdress, sMail, s: string;
  iPassed, i, iQ, iQ2 : integer;
begin
  //Complex sending email: https://www.tek-tips.com/viewthread.cfm?qid=1071099
  sSubject := 'Math Course Feedback '; // Subject line
  sBody := 'Benchmark test feedback (Right to wrong ratio):                                 =========================';
  with dmmathsharks do
  begin
    for i := 1 to 10 do
    begin
      iQ := 0;
      iQ2 := 0;
      tblAnswers.First;
      s := 'Question ' + inttostr(i);
      while not tblAnswers.Eof do
      begin
        if tblAnswers[s] = true then
        begin
          inc(iQ);
        end
        else
          inc(iQ2);
        tblAnswers.Next;
      end;
      sBody := sBody + s +' ('+inttostr(iQ)+':'+inttostr(iQ2)+') ';
     end;
    sBody := sBody + '==================================' + lblpass.Caption+'%==================================';
    sBody := sBody + inputbox('Your feedback','Enter below','Hello');
  end;
  sMail := 'mailto:luke.renton@icloud.com?subject=' +
  sSubject + '&body=' + sbody;
  ShellExecute(Handle, 'open', PChar(sMail), nil, nil, SW_SHOWNORMAL);

end;

procedure TfrmMain.pnlPassClick(Sender: TObject);
var
  iID: integer;
  bFound: boolean;
begin
  with dmMathSharks do
  begin
    bFound := false;
    try
      iID := strtoint(inputbox('',
          'Please enter the user ID of the user to Pass', '2'));
    except
      on E: Exception do
        showmessage('Please enter a user ID to continue');
    end;

    tblAnswers.First;
    while not(tblAnswers.Eof) and (bFound = false) do
    begin
      if iID = tblAnswers['UserID'] then
      begin
        bFound := true;
      end;
      tblAnswers.Next;
    end;
    if bFound = true then
    begin
      dbgDB.DataSource := dsshow;
      qryshow.Close;
      qryshow.SQL.Text :=
        'UPDATE Answers SET Pass = true Where UserID = ' + inttostr(iID);
      qryshow.ExecSQL;
      showmessage('User with user ID: ' + inttostr(iID) +
          ' has been succesfully passed!');

      bar;
      frmMain.Refresh;
    end
    else
      showmessage('Learner with userID ' + inttostr(iID) +
          ' does not exist please ensure you have typed the correct statement');

  end;
end;

procedure TfrmMain.pnlPiClick(Sender: TObject);
var
  i: integer;
begin
  i := dmMathSharks.tblAnswers.RecordCount;
  Series3.Clear;
  Series1.Visible := false;
  Series2.Visible := false;
  Series3.Visible := true;
  Series3.Add(ceil((ipass / i) * 360), 'Pass: ' + inttostr
      (ceil((ipass / i) * 100)), clRed);
  Series3.Add(ceil(((i - ipass) / i) * 360), 'Fail: ' + inttostr
      (floor(((i - ipass) / i) * 100)), clAqua);
end;

procedure TfrmMain.pnlSearchClick(Sender: TObject);
var
  sName: string;
  ///
  /// At least two queries using calculations,such
  /// as minimum, maximum, sum and average3At least
  /// one query involving two tables3At least
  /// one dynamic query using a variable
  ///
begin
  sName := inputbox('', 'Please enter a name below to find', 'Luke');
  with dmMathSharks do
  begin
    dbgDB.DataSource := dsshow;
    qryshow.Close;
    qryshow.SQL.Text := 'Select * ' + 'From Users ' + 'Where Firstname = ' +
      '"' + sName + '"';
    qryshow.Open;
  end;
end;

procedure TfrmMain.pnlSortClick(Sender: TObject);
begin
  rgpSort.Visible := true;
  lblPass.Visible := false;
  rgpSort.Refresh;
end;

procedure TfrmMain.Q1;
var
  iNumber, iCorrect: integer;
  rTemp: real;
begin

  iNumber := randomrange(1000, 10001);
  lblQ1.Caption := 'Round ' + inttostr(iNumber) + ' to the nearest 100';
  fixpos(lblQ1, imgb);
  fixpos(lblq2, imgb);
  rTemp := iNumber / 100;
  if frac(rTemp) >= 0.5 then
  begin
    iCorrect := ceil(rTemp) * 100;
  end
  else
    iCorrect := floor(rTemp) * 100;
  // figure out how to select random panel
  pnlA.Caption := 'A. ' + inttostr(iCorrect + 100);
  pnlB.Caption := 'B. ' + inttostr(iCorrect);
  pnlD.Caption := 'D. ' + inttostr(iCorrect - 100);
  pnlC.Caption := 'C. ' + inttostr(iCorrect + randomrange(1, 500));
  iAnswer := 1;
  tmrq.Enabled := true;
  prbTime.Max := 30;

end;

procedure TfrmMain.Q10;
var
  ino1, ino2, ino3, ino4, iC: integer;
begin
  tmrq.Enabled := true;
  prbTime.Max := 60;
  ino1 := randomrange(10, 80);
  ino2 := randomrange(10, 80);
  ino3 := randomrange(10, 80);
  ino4 := randomrange(10, 80);
  lblQ1.Caption :=
    'Bob has a fence with four sides, each measuring different lengths.';
  lblq2.Font.size := lblq2.Font.size + 2;
  lblq2.Caption := 'The lengths of the sides are ' + inttostr(ino1)
    + ', ' + inttostr(ino2) + ', ' + inttostr(ino3) + ', ' + inttostr(ino4)
    + ', ' + ' respectively. What is the perimeter of the fence?';
  fixpos(lblQ1, imgb);
  fixpos(lblq2, imgb);
  iC := ino1 + ino2 + ino3 + ino4;
  pnlA.Caption := 'A. ' + inttostr(iC - 20);
  pnlB.Caption := 'B. ' + inttostr(iC + 3);
  pnlC.Caption := 'C. ' + inttostr(iC);
  pnlD.Caption := 'D. ' + inttostr(iC + 22);
  iAnswer := 2;
end;

procedure TfrmMain.Q2;
var
  ino1, ino2, iCorrect: integer;
begin
  tmrq.Enabled := true;
  prbTime.Max := 60;
  ino1 := randomrange(1000, 10000);
  ino2 := randomrange(1000, 10000);
  lblQ1.Caption := 'What is the sum of ' + inttostr(ino1) + ' and ' + inttostr
    (ino2) + '?';
  fixpos(lblQ1, imgb);
  fixpos(lblq2, imgb);
  iCorrect := ino1 + ino2;
  pnlA.Caption := 'A. ' + inttostr(iCorrect + randomrange(1, 1000));
  pnlB.Caption := 'B. ' + inttostr(iCorrect + randomrange(1, 1000));
  pnlC.Caption := 'C. ' + inttostr(iCorrect + randomrange(1, 1000));
  pnlD.Caption := 'D. ' + inttostr(iCorrect);
  iAnswer := 3;
end;

procedure TfrmMain.Q3;
var
  ino1, ino2, iC: integer;
begin
  tmrq.Enabled := true;
  prbTime.Max := 15;
  ino2 := 500;
  ino1 := randomrange(50, 201);
  while ino2 > ino1 do
  begin
    ino2 := randomrange(20, 201);
  end;
  lblQ1.Caption := 'What is ' + inttostr(ino1) + ' - ' + inttostr(ino2) + '?';
  fixpos(lblQ1, imgb);
  fixpos(lblq2, imgb);
  iC := ino1 - ino2;
  pnlA.Caption := 'A. ' + inttostr(iC - 20);
  pnlB.Caption := 'B. ' + inttostr(iC + 3);
  pnlC.Caption := 'C. ' + inttostr(iC);
  pnlD.Caption := 'D. ' + inttostr(iC + 22);
  iAnswer := 2;
end;

procedure TfrmMain.Q4;
var
  iNum1, iC: integer;
begin
  tmrq.Enabled := true;
  prbTime.Max := 40;
  iNum1 := randomrange(4, 12);
  lblQ1.Caption := 'If there are ' + inttostr(iNum1) +
    ' spiders and each spider has 8 legs.';
  lblq2.Caption := 'How many legs are there on all the spiders combined?';
  fixpos(lblQ1, imgb);
  fixpos(lblq2, imgb);
  iC := iNum1 * 8;
  pnlA.Caption := 'A. ' + inttostr(iC);
  pnlB.Caption := 'B. ' + inttostr(iC + 1);
  pnlC.Caption := 'C. ' + inttostr(iC * 2);
  pnlD.Caption := 'D. ' + inttostr(iC - 2);
  iAnswer := 0;

end;

procedure TfrmMain.Q5;
var
  iNum1, iNum2: integer;
begin
  tmrq.Enabled := true;
  prbTime.Max := 25;
  iNum2 := randomrange(4, 10);
  iNum1 := randomrange(4, 10) * iNum2;
  lblQ1.Caption := 'What is the answer for the divsion of ' + inttostr(iNum1)
    + '/' + inttostr(iNum2);
  fixpos(lblQ1, imgb);
  fixpos(lblq2, imgb);
  lblq2.Caption := '';
  iNum2 := floor(iNum1 / iNum2);
  pnlA.Caption := 'A. ' + inttostr(iNum2 + 1);
  pnlB.Caption := 'B. ' + inttostr(iNum1);
  pnlC.Caption := 'C. ' + inttostr(iNum2);
  pnlD.Caption := 'D. ' + inttostr(iNum2 + iNum1);
  iAnswer := 2;
end;

procedure TfrmMain.Q6;
var
  i, ix1, iy, igcd, ismallest, ibig: integer;
  bV: boolean;
begin
  bV := false;
  { euclidean algorithm for finding Greatest common denominator in a fraction }
  while bV = false do
  begin
    ix1 := 1;
    iy := 1;
    while ix1 = iy do
    begin
      ix1 := randomrange(2, 30);
      iy := randomrange(2, 30);
    end;
    if ix1 > iy then
    begin
      ismallest := iy;
      ibig := ix1;
    end
    else
    begin
      ismallest := ix1;
      ibig := iy;
    end;
    for i := 2 to ismallest + 1 do
    begin
      if ((ix1 MOD i = 0) and (iy MOD i = 0)) then
      begin
        igcd := i;
        bV := true;
      end;
    end;
  end;
  tmrq.Enabled := true;
  prbTime.Max := 30;
  lblQ1.Caption := 'What is the simplest form of the fraction ' + inttostr
    (ismallest) + '/' + inttostr(ibig) + '?';
  fixpos(lblQ1, imgb);
  fixpos(lblq2, imgb);
  pnlA.Caption := 'A. ' + inttostr(ismallest) + '/' + inttostr(ibig);
  pnlB.Caption := 'B. ' + inttostr(floor(ismallest / igcd)) + '/' + inttostr
    (floor(ibig / igcd));
  pnlC.Caption := 'C. ' + inttostr(2);
  pnlD.Caption := 'D. ' + inttostr(1);
  iAnswer := 1;

end;

procedure TfrmMain.Q7;
var
  ino1: integer;
  rans: real;
begin
  tmrq.Enabled := true;
  prbTime.Max := 15;
  ino1 := randomrange(1000, 10001);
  lblQ1.Caption := 'What is ' + inttostr(ino1) + 'cm in meters?';
  rans := ino1 / 100;
  fixpos(lblQ1, imgb);
  fixpos(lblq2, imgb);
  pnlA.Caption := 'A. ' + floattostr(rans) + 'm';
  pnlB.Caption := 'B. ' + floattostr(rans * 2) + 'm';
  pnlC.Caption := 'C. ' + floattostr(rans - 10) + 'm';
  pnlD.Caption := 'D. ' + inttostr(ceil(ino1 / 50)) + 'm';
  iAnswer := 0;
end;

procedure TfrmMain.Q8;
var
  ih1, ih2, imin1, imin2, iinc, i: integer;
begin
  ih1 := 1;
  ih2 := randomrange(0, 10);
  imin1 := randomrange(1, 6);
  imin2 := randomrange(0, 10);
  iinc := randomrange(30, 61);
  lblQ1.Caption := 'If the time is ' + inttostr(ih1) + inttostr(ih2)
    + ':' + inttostr(imin1) + inttostr(imin2);
  lblq2.Caption := 'what time will it be if ' + inttostr(iinc)
    + ' minutes pass';
  fixpos(lblQ1, imgb);
  fixpos(lblq2, imgb);
  for i := 1 to iinc do
  begin
    if imin2 >= 9 then
    begin
      inc(imin1);
      imin2 := 0;
      if imin1 >= 6 then
      begin
        imin1 := 0;
        inc(ih2);
        if ih2 >= 9 then
        begin
          ih1 := 2;
          ih2 := 0;
        end;
      end;
    end
    else
      inc(imin2);
  end;
  tmrq.Enabled := true;
  prbTime.Max := 20;
  pnlA.Caption := 'A. ' + inttostr(ih1) + inttostr(ih2) + ':' + inttostr(imin1)
    + inttostr(imin2 + 2);
  pnlB.Caption := 'B. ' + inttostr(ih1 - 1) + inttostr(ih2 + 3) + ':' + inttostr
    (imin1) + inttostr(imin2 + 3);
  pnlC.Caption := 'C. ' + inttostr(ih1) + inttostr(ih2) + ':' + inttostr
    (imin1 - 1) + inttostr(imin2);
  pnlD.Caption := 'D. ' + inttostr(ih1) + inttostr(ih2) + ':' + inttostr(imin1)
    + inttostr(imin2);
  iAnswer := 3;
end;

procedure TfrmMain.Q9;
var
  ino1, ino2, ino3, iC: integer;
begin
  tmrq.Enabled := true;
  prbTime.Max := 30;
  ino1 := randomrange(11, 30);
  ino2 := randomrange(5, 10);
  ino3 := randomrange(10, 30);
  iC := (ino1 - ino2) + ino3;
  lblQ1.Caption := 'If Keren has ' + inttostr(ino1)
    + ' Apples and Luke eats ' + inttostr(ino2) + ' of Keren''s apples';
  lblq2.Caption := 'But Sipho give keren back ' + inttostr(ino3) +
    ' apples, how many apples does Keren have?';
  fixpos(lblQ1, imgb);
  fixpos(lblq2, imgb);
  pnlA.Caption := 'A. ' + inttostr(iC + 2);
  pnlB.Caption := 'B. ' + inttostr(iC);
  pnlC.Caption := 'C. ' + inttostr(iC - 3);
  pnlD.Caption := 'D. ' + inttostr(iC * 2);
  iAnswer := 1;
end;

procedure TfrmMain.question;
begin
  case iQuestion of
    1:
      Q1;
    2:
      Q2;
    3:
      Q3;
    4:
      Q4;
    5:
      Q5;
    6:
      Q6;
    7:
      Q7;
    8:
      Q8;
    9:
      Q9;
    10:
      begin
        Q10;
        bTest := true;
      end;
  end;
end;

procedure TfrmMain.qwerqwerweqClick(Sender: TObject);
begin
  edtUsername.Text := 'Wakarie';
  edtPassword.Text := 'Ilovechubby';
  btnLogin.Click;
end;

procedure TfrmMain.rgpSortClick(Sender: TObject);
var
  sLetter: string;
begin
  with dmMathSharks do
  begin
    dbgDB.DataSource := dsUsers;
    // Sorting
    case rgpSort.ItemIndex of
      0:
        begin
          dbgDb1.Visible := false;
          tblusers.sort := 'DOB DESC';
        end;

      1:
        begin
          dbgDb1.Visible := false;
          tblusers.sort := 'DOB ASC';
        end;

      2:
        begin
          dbgDb1.Visible := false;
          tblusers.sort := 'FirstName ASC';
        end;

      3:
        begin
          dbgDb1.Visible := false;
          tblusers.sort := 'FirstName DESC';
        end;

      4:
        begin
          dbgDb1.Visible := false;
          dbgDB.DataSource := dsshow;
          qryshow.Close;
          qryshow.SQL.Text := 'select * from users order by Gender ASC';
          qryshow.Open;
        end;

      5:
        begin
          dbgDb1.Visible := false;
          dbgDB.DataSource := dsshow;
          qryshow.Close;
          qryshow.SQL.Text :=
            'Select U.UserID, Username, Password, FirstName, Surname, DOB, Gender'
            + ' FROM Users U, Answers A' +
            ' where U.userid = A.userid and pass = true';
          qryshow.Open;
        end;
      6:
        begin
          dbgDb1.Visible := false;
          dbgDB.DataSource := dsshow;
          qryshow.Close;
          qryshow.SQL.Text :=
            'Select U.UserID, Username, Password, FirstName, Surname, DOB, Gender'
            + ' FROM Users U, Answers A' +
            ' where U.userid = A.userid and pass = false';
          qryshow.Open;
        end;
      7:
        begin
          dbgDb1.Visible := true;
          dbgDb1.DataSource := dsshow;
          qryshow.Close;
          qryshow.SQL.Text := 'select Top 1 Score, Firstname, Surname ' +
            'from Answers A, Users U ' + 'where A.UserID = U.UserID ' +
            'Order by Score DESC';
          qryshow.Open;
        end;

      8:
        begin
          dbgDb1.Visible := true;
          dbgDb1.DataSource := dsshow;
          qryshow.Close;
          qryshow.SQL.Text := 'select Top 1 Score, Firstname, Surname ' +
            'from Answers A, Users U ' + 'where A.UserID = U.UserID ' +
            'Order by Score ASC';
          qryshow.Open;
        end;

      // Aggregate function for the total number of users
      9:
        begin
          dbgDb1.Visible := true;
          dbgDb1.DataSource := dsshow;
          qryshow.Close;
          qryshow.SQL.Text :=
            'Select count(FirstName) as [Total number of users]' +
            ' from Users';
          qryshow.Open;
        end;

      // Grouping the average score by gender
      10:
        begin
          dbgDb1.Visible := true;
          dbgDb1.DataSource := dsshow;
          qryshow.Close;
          qryshow.SQL.Text :=
            'Select Gender, round(avg(Score),2) as [Average score per Gender]'
            + ' from Answers A, Users U' + ' where A.UserID = U.UserID' +
            ' group by Gender';
          qryshow.Open;
        end;

      // Using sub query to find the average of the scores and display those
      // who either scored above or below the average score
      11:
        begin
          dbgDb1.Visible := true;
          dbgDb1.DataSource := dsshow;
          qryshow.Close;
          qryshow.SQL.Text := 'select Firstname, Surname, Score' +
            ' from Answers A, Users U' +
            ' where A.UserID = U.UserID and score > (select avg(score) from Answers)';
          qryshow.Open;
        end;

      12:
        begin
          dbgDb1.Visible := true;
          dbgDb1.DataSource := dsshow;
          qryshow.Close;
          qryshow.SQL.Text := 'select Firstname, Surname, Score' +
            ' from Answers A, Users U' +
            ' where A.UserID = U.UserID and score < (select avg(score) from Answers)';
          qryshow.Open;
        end;

      // Using Left command to see if a user has that Letter at the start of their first namen
      13:
        begin

          try
            sLetter := uppercase
              (inputbox('', 'Please enter a letter below', 'L'));
            dbgDb1.Visible := false;
            dbgDB.DataSource := dsshow;
            qryshow.Close;
            qryshow.SQL.Text := 'select * from users ' +
              ' where Left(FirstName, 1) = ' + '"' + sLetter + '"'; ;
            qryshow.Open;
          except
            showmessage('Please enter a valid letter');
          end;
        end;

      14:
        begin
          rgpSort.Visible := false;
          lblPass.Visible := true;
          show;
          rgpsort.ItemIndex := -1;
        end;

    end;
  end;
end;

function TfrmMain.sDialog(sWord: string): string;
begin
  result := copy(sWord, 1, pos('#', sWord) - 1);
end;

procedure TfrmMain.shell(s: Pwidechar);
begin
  ShellExecute(Handle, 'open', s, nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmMain.show;
begin
  with dmMathSharks do
  begin
    dbgDB.DataSource := dsshow;
    qryshow.Close;
    qryshow.SQL.Text :=
      'Select UserId, Username, Password, FirstName, Surname, DOB, Gender ' +
      'FROM Users ';
    qryshow.Open;
  end;
end;

procedure TfrmMain.time;
begin
  if prbTime.Position = prbTime.Max then
    btnSubmitClick(btnSubmit);
end;

procedure TfrmMain.tmrqTimer(Sender: TObject);
begin
  prbTime.Position := prbTime.Position + 1;
  time;
end;

function TfrmMain.validation(sWord: string): boolean;
var
  i: integer;
  bB: boolean;
begin
  result := true;
  bB := true;
  for i := 1 to length(sWord) do
  begin
    if ((sWord[i]) IN (['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'])) or
      (sWord[i] IN ['&', '@', '#', '$', '%', '!', '^', '*', '(', ')'])
      and bB = true then
    begin
      result := false;
      showmessage('Invalid charcter in name or surname field');
      bB := false;
    end;
  end;
end;

function TfrmMain.validpass(sWord: string): boolean;
begin
  result := true;
  if length(sWord) <= 6 then
  begin
    result := false;
    showmessage(
      'Your password is too short (Please make it longer than 5 characters');
  end;
end;

function TfrmMain.validuser(sWord: string): boolean;
var
  i: integer;
  bV: boolean;
  snew: string;
begin
  result := true;
  bV := true;
  if length(sWord) <= 5 then
  begin
    result := false;
    bV := false;
    showmessage(
      'Username is too short (Please maker it longer than 5 characters)');
  end;
  snew := sWord + inttostr(randomrange(0, 1001));
  with dmMathSharks do
  begin
    tblusers.First;
    while not tblusers.Eof and (bV = true) do
    begin
      if uppercase(sWord) = uppercase(tblusers['Username']) then
      begin
        result := false;
        bV := false;
        i := MessageDlg
          ('Username already taken :/ ' + #10 + '=================' + #10 +
            'Maybe try this: ' + snew + ' press yes to use this username',
          mtCustom, [mbYes, mbNo], 0);
        case i of
          mrYes:
            edtNewName.Text := snew;
        end;
      end;
      tblusers.Next;
    end;
  end;
end;

procedure TfrmMain.wqerClick(Sender: TObject);
begin
  edtUsername.Text := 'funny';
  edtPassword.Text := 'Ilovedogs';
  btnLogin.Click;
end;

end.
