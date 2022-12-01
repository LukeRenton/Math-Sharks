program Main_p;

uses
  Forms,
  Main_u in 'Main_u.pas' {frmMain},
  dmMathsharks_u in 'dmMathsharks_u.pas' {dmMathSharks: TDataModule},
  games_u in '..\Games form\games_u.pas' {frmGames},
  mathgame_u in '..\Games form\Games\Math Game\mathgame_u.pas' {frmMath},
  Noughtsandcrosses_p in '..\Games form\Games\Noughtsandcrosses\Noughtsandcrosses_p.pas' {frmNC},
  snake_u in '..\Games form\Games\Snake\snake_u.pas' {frmSnake},
  clsStudent_u in 'clsStudent_u.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmMathSharks, dmMathSharks);
  Application.CreateForm(TfrmGames, frmGames);
  Application.CreateForm(TfrmMath, frmMath);
  Application.CreateForm(TfrmNC, frmNC);
  Application.CreateForm(TfrmSnake, frmSnake);
  Application.Run;
end.
