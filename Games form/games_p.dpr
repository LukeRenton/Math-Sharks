program games_p;

uses
  Forms,
  games_u in 'games_u.pas' {frmGames},
  mathgame_u in 'Games\Math Game\mathgame_u.pas' {frmMath},
  snake_u in 'Games\Snake\snake_u.pas' {frmSnake},
  Noughtsandcrosses_p in 'Games\Noughtsandcrosses\Noughtsandcrosses_p.pas' {frmNC},
  dmMathsharks_u in '..\Main Form\dmMathsharks_u.pas' {dmMathSharks: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGames, frmGames);
  Application.CreateForm(TfrmSnake, frmSnake);
  Application.CreateForm(TfrmMath, frmMath);
  Application.CreateForm(TfrmSnake, frmSnake);
  Application.CreateForm(TfrmNC, frmNC);
  Application.CreateForm(TdmMathSharks, dmMathSharks);
  Application.Run;
end.
