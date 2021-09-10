object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Windows 11 rounded corners demo'
  ClientHeight = 283
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 17
  object Label1: TLabel
    Left = 15
    Top = 8
    Width = 400
    Height = 51
    Caption = 
      'This app demonstrates the Windows 11 possible application window' +
      ' rounded corner settings. This setting will have no effect on Wi' +
      'ndows 10 or older.'
    WordWrap = True
  end
  object Button1: TButton
    Left = 287
    Top = 116
    Width = 137
    Height = 57
    Caption = 'Update form corners'
    TabOrder = 0
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 111
    Width = 273
    Height = 169
    Caption = 'What kind of corners do you want?'
    ItemIndex = 0
    Items.Strings = (
      'Default behavior'
      'Turn off rounded corners'
      'Turn on rounded corners'
      'Turn on '#39'small'#39' rounded corners')
    TabOrder = 1
  end
  object NotificationCenter1: TNotificationCenter
    Left = 344
    Top = 192
  end
end
