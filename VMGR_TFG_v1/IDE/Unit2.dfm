object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'V# editor Initial menu'
  ClientHeight = 222
  ClientWidth = 204
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button2: TButton
    Left = 32
    Top = 80
    Width = 145
    Height = 33
    Caption = 'Cargar Proyecto'
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 32
    Top = 176
    Width = 145
    Height = 33
    Caption = 'Salir'
    TabOrder = 1
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 32
    Top = 127
    Width = 145
    Height = 35
    Caption = 'Proyecto vacio'
    TabOrder = 2
    OnClick = Button4Click
  end
  object Button1: TButton
    Left = 32
    Top = 32
    Width = 145
    Height = 33
    Caption = 'Nuevo Proyecto'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 288
    Top = 234
    Width = 185
    Height = 89
    Lines.Strings = (
      'test de nuevo proyecto'
      '')
    TabOrder = 4
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 264
    Top = 112
  end
  object FileSaveDialog1: TFileSaveDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 280
    Top = 184
  end
end
