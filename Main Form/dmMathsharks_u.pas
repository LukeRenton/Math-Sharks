unit dmMathsharks_u;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmMathSharks = class(TDataModule)
    tblAnswers: TADOTable;
    tblUsers: TADOTable;
    dsAnswers: TDataSource;
    dsUsers: TDataSource;
    comMathSharks: TADOConnection;
    qryShow: TADOQuery;
    dsSHow: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMathSharks: TdmMathSharks;

implementation

{$R *.dfm}

end.
