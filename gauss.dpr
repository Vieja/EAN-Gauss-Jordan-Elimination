program gauss;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  gjordan in 'gjordan.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
