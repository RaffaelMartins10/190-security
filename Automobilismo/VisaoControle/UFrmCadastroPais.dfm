inherited FrmCadastroPais: TFrmCadastroPais
  Caption = 'Cadastro de Pa'#237's'
  ClientHeight = 183
  ClientWidth = 627
  ExplicitWidth = 643
  ExplicitHeight = 221
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 627
    ExplicitWidth = 627
  end
  inherited gbLocalizar: TGroupBox
    Width = 627
    ExplicitWidth = 627
  end
  inherited pnlBotoes: TPanel
    Top = 142
    Width = 627
    ExplicitTop = 142
    ExplicitWidth = 627
    inherited btnLimpar: TBitBtn
      Left = 392
      ExplicitLeft = 392
    end
    inherited btnExcluir: TBitBtn
      Left = 275
      ExplicitLeft = 275
    end
    inherited btnGravar: TBitBtn
      Left = 158
      ExplicitLeft = 158
    end
    inherited btnSair: TBitBtn
      Left = 509
      ExplicitLeft = 509
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 627
    Height = 56
    Align = alClient
    Caption = ' Informa'#231#245'es '
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
    object lbNome: TLabel
      Left = 71
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Nome'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edNome: TEdit
      Left = 104
      Top = 21
      Width = 369
      Height = 19
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 60
      ParentFont = False
      TabOrder = 0
      OnExit = edNomeExit
    end
  end
end
