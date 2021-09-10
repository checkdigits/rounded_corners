unit rcorners_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Notification;

type
  TForm1 = class(TForm)
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    NotificationCenter1: TNotificationCenter;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses delphi_rounded_corners;

procedure TForm1.Button1Click(Sender: TObject);
var
  MyNot: TNotification;
begin
  SetRoundedCorners(Self.Handle, TRoundedWindowCornerType(RadioGroup1.ItemIndex));
  if NotificationCenter1.Supported then
  begin
    MyNot           := NotificationCenter1.CreateNotification('Rounder Corners Demo',
                                                              'Corners set to ' + RadioGroup1.Items[RadioGroup1.ItemIndex].ToLower + '.',
                                                              Now);
    MyNot.Title     := 'Rounded Corner Test';
    MyNot.ChannelId := 'RoundedCornerTest';
    NotificationCenter1.PresentNotification(MyNot);
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  NotificationCenter1.CancelAll;
end;

end.
