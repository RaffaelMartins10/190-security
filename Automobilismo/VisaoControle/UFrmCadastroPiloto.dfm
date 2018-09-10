inherited FrmCadastroPiloto: TFrmCadastroPiloto
  Caption = 'Cadastro de Piloto'
  ClientHeight = 356
  ClientWidth = 634
  ExplicitWidth = 650
  ExplicitHeight = 394
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 634
    ExplicitWidth = 116
  end
  inherited gbLocalizar: TGroupBox
    Width = 634
    ExplicitWidth = 116
  end
  inherited pnlBotoes: TPanel
    Top = 315
    Width = 634
    ExplicitTop = -41
    ExplicitWidth = 116
    inherited btnLimpar: TBitBtn
      Left = 399
      ExplicitLeft = -119
    end
    inherited btnExcluir: TBitBtn
      Left = 282
      ExplicitLeft = -236
    end
    inherited btnGravar: TBitBtn
      Left = 165
      ExplicitLeft = -353
    end
    inherited btnSair: TBitBtn
      Left = 516
      ExplicitLeft = -2
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 634
    Height = 229
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
    ExplicitWidth = 116
    ExplicitHeight = 252
    object lbNome: TLabel
      Left = 114
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
    object lbDataNascimento: TLabel
      Left = 45
      Top = 50
      Width = 96
      Height = 13
      Caption = 'Data de Nascimento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbPais: TLabel
      Left = 121
      Top = 75
      Width = 19
      Height = 13
      Caption = 'Pa'#237's'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnLocalizarPais: TButton
      Left = 266
      Top = 73
      Width = 30
      Height = 19
      Cursor = crHandPoint
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TabStop = False
      OnClick = btnLocalizarPaisClick
    end
    object edNome: TEdit
      Left = 146
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
    end
    object dtpDataNascimento: TDateTimePicker
      Left = 146
      Top = 46
      Width = 117
      Height = 21
      Date = 43343.809552905090000000
      Time = 43343.809552905090000000
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edCodigoPais: TIntegerEdit
      Left = 146
      Top = 73
      Width = 117
      Height = 19
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnExit = edCodigoPaisExit
      OnKeyDown = edCodigoPaisKeyDown
      IntegerNumber = 0
    end
    object stNomePais: TStaticText
      Left = 301
      Top = 73
      Width = 214
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'stNomePais'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 4
      Transparent = False
    end
  end
end
