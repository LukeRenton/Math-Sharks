unit clsStudent_u;
//Class recieves information of the user from the student
//This is neccessary as the information is shared across mutliple forms
interface
uses
  sysutils;

type
      Tlearner = class(TObject)
    private
      fID, fSnake, fMath, fNC : integer;
      fName : string;
    public
    constructor create(pID, pSnake, pMAth, PNc: integer; pName : string);
      function getID : integer;
      function getName : string;
      function getSnake : integer;
      function getMath : integer;
      function getNc : integer;
      function toString : string;
    end;

implementation

{ Tlearner }

constructor Tlearner.create(pID, pSnake, pMAth, PNc: integer; pName : string);
begin
  fId := pID;
  fName := pName;
  fSnake := pSnake;
  fMath := pMath;
  fNc := pNc;
end;

function Tlearner.getID: integer;
begin
  result := fId;
end;

function Tlearner.getMath: integer;
begin
  result := fMath;
end;

function Tlearner.getName: string;
begin
  result := fName;
end;

function Tlearner.getNc: integer;
begin
  result := fNc;
end;

function Tlearner.getSnake: integer;
begin
  result := fSnake;
end;

function Tlearner.toString: string;
begin
  result := 'User: '+fName+#10+'Snake Game score: '+inttostr(fSnake)+#10+'Math Game wins: '+
            inttostr(fMath) + #10 + 'Noughts and Crosses Wins: '+inttostr(fNC);
end;
end.
