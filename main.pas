unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Math,IntervalArithmetic32and64, gjordan;

type

    matrix = array of vector;
    matrixInt = array of vectorInt;

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Button4: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

    procedure Normal();
    procedure Interval();
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    przedzialowa: boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  n: Integer; // liczba rownan oraz niewiadomych
  dane: matrix;
  daneInt: matrixInt;

procedure oneeqn(i : Integer;
                 var a : vector1); far;
procedure oneeqnInt(i : Integer;
                 var a : vectorInt); far;

implementation

{$R *.dfm}

procedure TForm1.Button3Click(Sender: TObject);
begin
  przedzialowa := false;
  Label2.Caption := 'zmiennopozycyjna'
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Memo2.Clear;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if not przedzialowa then
    Normal()
  else
    Interval()
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  przedzialowa := true;
  Label2.Caption := 'przedzialowa'
end;

procedure TForm1.Normal();
var
  wspolczynnikiStringList: TStringList;    // wsp�czynniki jako stringi
  i: Integer;
  j: Integer;
  x : vector;
  st : Integer;
  tmp: String;
begin
  n := Memo1.Lines.Count;
  SetLength(dane, n+1);
  for i := 1 to n do
  begin
    SetLength(dane[i], n+2);
    wspolczynnikiStringList := TStringList.Create;
    ExtractStrings([';'], [], PChar(Memo1.Lines[i-1]), wspolczynnikiStringList);
    for j := 1 to n+1 do
    begin
      tmp := wspolczynnikiStringList[j-1];
      if tmp.StartsWith('[') then
        begin
        Memo2.Lines.Add('Nie mozna obliczyc w arytmetyce zmiennopozycyjnej');
        exit
        end
      else
      if not TryStrToFloat(wspolczynnikiStringList[j-1],dane[i][j]) then
      begin
         Memo2.Lines.Add('Bledbe dane: nie mozna zamienic na float');
         exit
      end
      else
      dane[i][j] := StrToFloat(wspolczynnikiStringList[j-1]);
    end;
  end;
  SetLength(x,Ceil((n+2)*(n+2)/4)+1);
  GaussJordanNormal(n,oneeqn,x,st);
    Memo2.Lines.Add('Arytmetyka zmiennopozycyjna');
  for i := 1 to n do
  begin
    Memo2.Lines.Add('x[' + IntToStr(i) + '] = ' + FloatToStrF(x[i], ffExponent, 15, 4));
  end;
  Memo2.Lines.Add('st = ' + IntToStr(st));
end;

procedure TForm1.Interval();
var
  wspolczynnikiStringList: TStringList;    // wsp�czynniki jako stringi
  i: Integer;
  j: Integer;
  x : vectorInt;
  st : Integer;
  tmp: String;
  tmpInt: Integer;
  left, right: String;
begin
  n := Memo1.Lines.Count;
  SetLength(daneInt, n+1);
  for i := 1 to n do
  begin
    SetLength(daneInt[i], n+2);
    wspolczynnikiStringList := TStringList.Create;
    ExtractStrings([';'], [], PChar(Memo1.Lines[i-1]), wspolczynnikiStringList);
    tmpInt := 1;
    j := 1;
    while tmpInt <= n+1 do
    begin
      tmp := wspolczynnikiStringList[j-1];
      if tmp.StartsWith('[') then
      begin
        daneInt[i][tmpInt].a := StrToFloat(tmp.Substring(1));
        tmp := wspolczynnikiStringList[j];
        daneInt[i][tmpInt].b := StrToFloat(tmp.Substring(0, tmp.Length-1));
        j := j+2;
      end
      else begin
        daneInt[i][tmpInt] := StrToFloat(tmp);
        j := j+1;
      end;
      tmpInt := tmpInt + 1;
    end;
  end;
  SetLength(x,Ceil((n+2)*(n+2)/4)+1);
  GaussJordanInterval(n,oneeqnInt,x,st);
  Memo2.Lines.Add('Arytmetyka przedzialowa');
  for i := 1 to n do
    begin
      iends_to_strings(x[i], left, right);
      Memo2.Lines.Add('x[' + IntToStr(i) + '] = [' + left + '; ' + right+ '] szer=' + FloatToStr(int_width(x[i])));
    end;
    Memo2.Lines.Add('st = ' + IntToStr(st));

end;


procedure oneeqn(i : Integer;
                 var a : vector1);
var
   j : Integer;
begin
  for j := 1 to n+1 do
  begin
    a[j] := dane[i][j];
  end;
end;

procedure oneeqnInt(i : Integer;
                 var a : vectorInt);
var
   j : Integer;
begin
  for j := 1 to n+1 do
  begin
    a[j] := daneInt[i][j];
  end;
end;

end.
