program Main_p;

uses
  Forms,
  Main_u in 'Main_u.pas' {frmMain},
  dmMathsharks_u in 'dmMathsharks_u.pas' {dmMathSharks: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmMathSharks, dmMathSharks);
  Application.Run;
end.
