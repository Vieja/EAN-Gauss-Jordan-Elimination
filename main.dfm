object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 561
  ClientWidth = 882
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = Button3Click
  PixelsPerInch = 120
  TextHeight = 16
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 61
    Height = 16
    Caption = 'Macierz A:'
  end
  object Label1: TLabel
    Left = 460
    Top = 104
    Width = 69
    Height = 16
    Caption = 'Arytmetyka:'
  end
  object Label2: TLabel
    Left = 535
    Top = 104
    Width = 4
    Height = 16
  end
  object Label4: TLabel
    Left = 16
    Top = 184
    Width = 42
    Height = 16
    Caption = 'Wyniki:'
  end
  object Memo1: TMemo
    Left = 8
    Top = 24
    Width = 409
    Height = 145
    Lines.Strings = (
      '3;1;6;2'
      '2;1;3;7'
      '1;1;1;4')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 674
    Top = 125
    Width = 103
    Height = 25
    Caption = 'Oblicz'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 658
    Top = 61
    Width = 135
    Height = 24
    Caption = 'Przedzia'#322'owa'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 658
    Top = 31
    Width = 135
    Height = 24
    Caption = 'Zmiennopozycyjna'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Memo2: TMemo
    Left = 16
    Top = 203
    Width = 821
    Height = 254
    ReadOnly = True
    TabOrder = 4
  end
  object Button4: TButton
    Left = 384
    Top = 480
    Width = 75
    Height = 25
    Caption = 'Wyszysc'
    TabOrder = 5
    OnClick = Button4Click
  end
end
