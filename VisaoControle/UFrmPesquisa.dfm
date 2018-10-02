object frmPesquisa: TfrmPesquisa
  Left = 226
  Top = 187
  ActiveControl = cbOpcoes
  BorderStyle = bsNone
  Caption = 'Pesquisa'
  ClientHeight = 499
  ClientWidth = 780
  Color = clSilver
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBotoes: TPanel
    Left = 0
    Top = 458
    Width = 780
    Height = 41
    Align = alBottom
    Color = clMaroon
    ParentBackground = False
    TabOrder = 3
    DesignSize = (
      780
      41)
    object btnSair: TBitBtn
      Left = 661
      Top = 4
      Width = 115
      Height = 33
      Anchors = [akRight, akBottom]
      Caption = '&Sair'
      TabOrder = 1
      OnClick = btnSairClick
    end
    object btnConfirmar: TBitBtn
      Left = 545
      Top = 4
      Width = 115
      Height = 33
      Anchors = [akRight, akBottom]
      Caption = '&Confirmar'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
  end
  object gbParametros: TGroupBox
    Left = 0
    Top = 28
    Width = 780
    Height = 58
    Align = alTop
    Caption = ' Par'#226'metros '
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object lbOpcao: TLabel
      Left = 19
      Top = 24
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Op'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbIgualA: TLabel
      Left = 172
      Top = 24
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Igual a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edPesquisa: TEdit
      Left = 210
      Top = 21
      Width = 233
      Height = 19
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyDown = dbgClienteKeyDown
      OnKeyUp = edPesquisaKeyUp
    end
    object cbOpcoes: TComboBox
      Left = 57
      Top = 21
      Width = 109
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      Style = csDropDownList
      Color = clInfoBk
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnChange = cbOpcoesChange
      OnKeyDown = dbgClienteKeyDown
    end
  end
  object pnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 28
    Align = alTop
    BorderStyle = bsSingle
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = -6
    object lbCabecalho: TLabel
      Left = -1
      Top = 2
      Width = 84
      Height = 19
      Caption = 'PESQUISA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object dbgCliente: TDBGrid
    Left = 0
    Top = 86
    Width = 780
    Height = 372
    Align = alClient
    FixedColor = clGradientInactiveCaption
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgClienteDblClick
    OnKeyDown = dbgClienteKeyDown
  end
end
