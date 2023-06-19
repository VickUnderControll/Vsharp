object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'V# Editor'
  ClientHeight = 571
  ClientWidth = 1095
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 311
    Top = 551
    Width = 3
    Height = 13
  end
  object FileListBox1: TFileListBox
    Left = 8
    Top = 296
    Width = 289
    Height = 249
    ItemHeight = 13
    TabOrder = 0
    OnClick = FileListBox1Change
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 8
    Top = 8
    Width = 289
    Height = 282
    FileList = FileListBox1
    TabOrder = 1
  end
  object RichEdit1: TRichEdit
    Left = 311
    Top = 8
    Width = 762
    Height = 537
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
    Zoom = 100
    OnSelectionChange = RichEdit1SelectionChange
  end
  object MainMenu1: TMainMenu
    Left = 1024
    Top = 320
    object File1: TMenuItem
      Caption = 'File'
      object menubtnguardar: TMenuItem
        Caption = 'Guardar'
        ShortCut = 16467
        OnClick = menubtnguardarClick
      end
      object menubtncargar: TMenuItem
        Caption = 'Cargar'
        ShortCut = 16463
        OnClick = menubtncargarClick
      end
      object Nuevo1: TMenuItem
        Caption = 'Nuevo'
        ShortCut = 16462
        OnClick = Nuevo1Click
      end
    end
    object Nuevo2: TMenuItem
      Caption = 'Editor'
      object Salir1: TMenuItem
        Caption = 'Salir'
        ShortCut = 32883
        OnClick = Salir1Click
      end
    end
    object Project1: TMenuItem
      Caption = 'Project'
      object Run1: TMenuItem
        Caption = 'Run'
        ImageName = '4028901.png'
        ShortCut = 8313
        OnClick = Run1Click
      end
      object Cargarultimo1: TMenuItem
        Caption = 'Cargar ultimo'
        ShortCut = 8314
        OnClick = Cargarultimo1Click
      end
    end
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 1024
    Top = 392
  end
  object SaveDialog1: TSaveDialog
    Left = 1008
    Top = 456
  end
end
