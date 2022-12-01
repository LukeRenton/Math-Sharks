unit clsSnake_u;

interface
uses sysutils, extctrls, classes, math, windows;

type
 TSnakebody = class(TShape)
 private
  public
    constructor Create(AOwner: Tcomponent);
  end;

implementation

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
