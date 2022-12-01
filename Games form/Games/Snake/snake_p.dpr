program snake_p;

uses
  Forms,
  snake_u in 'snake_u.pas' {frmSnake};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSnake, frmSnake);
  Application.Run;
end.
