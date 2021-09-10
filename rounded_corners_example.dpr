program rounded_corners_example;

uses
  Vcl.Forms,
  rcorners_form in 'rcorners_form.pas' {Form1},
  delphi_rounded_corners in 'delphi_rounded_corners.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Rounded corners test';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
