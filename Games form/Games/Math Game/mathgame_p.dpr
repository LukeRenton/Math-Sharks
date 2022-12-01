program mathgame_p;

uses
  Forms,
  mathgame_u in 'mathgame_u.pas' {frmMath};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMath, frmMath);
  Application.Run;
end.
