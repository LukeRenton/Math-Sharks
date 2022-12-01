program noughtsandcrosses_u;

uses
  Forms,
  Noughtsandcrosses_p in 'Noughtsandcrosses_p.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
