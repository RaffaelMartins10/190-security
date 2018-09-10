object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Automobilismo'
  ClientHeight = 316
  ClientWidth = 620
  Color = clAppWorkSpace
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmPrincipal
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbPrincipal: TStatusBar
    Left = 0
    Top = 297
    Width = 620
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object mmPrincipal: TMainMenu
    Left = 512
    Top = 8
    object miCadastro: TMenuItem
      Caption = 'Cadastro'
      object miPais: TMenuItem
        Caption = 'Pa'#237's'
        OnClick = miPaisClick
      end
      object miFabricante: TMenuItem
        Caption = 'Fabricante'
        OnClick = miFabricanteClick
      end
      object miPiloto: TMenuItem
        Caption = 'Piloto'
        OnClick = miPilotoClick
      end
    end
    object miSair: TMenuItem
      Caption = '&Sair'
      OnClick = miSairClick
    end
  end
end
