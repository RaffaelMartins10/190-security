object frmGrafico: TfrmGrafico
  Left = 0
  Top = 0
  Caption = 'Grafico'
  ClientHeight = 451
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cdbCidadeOcorrencia: TDBChart
    Left = 0
    Top = 0
    Width = 695
    Height = 451
    Gradient.Colors = <
      item
        Color = 5064959
      end
      item
        Color = 9012989
        Offset = 0.191616766467065900
        Transparency = 45
      end
      item
        Color = clWhite
        Offset = 0.407185628742515000
      end
      item
        Color = clWhite
        Offset = 0.598802395209580800
      end
      item
        Color = 9012989
        Offset = 0.829341317365269500
      end
      item
        Color = 5064959
        Offset = 1.000000000000000000
      end>
    Gradient.EndColor = 5064959
    Gradient.MidColor = 9012989
    Gradient.StartColor = 5064959
    Gradient.Visible = True
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Color = clBlack
    Title.Font.Height = -25
    Title.Font.Name = 'Trebuchet MS'
    Title.Font.Style = [fsBold]
    Title.Font.Quality = fqClearType
    Title.Text.Strings = (
      'Gr'#225'fico de Ocorr'#234'ncias por Cidades')
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    Align = alClient
    Color = clWhite
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      18
      15
      18)
    ColorPaletteIndex = 3
    object Series1: TPieSeries
      Marks.Symbol.Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        0000100000000100180000000000000300000000000000000000000000000000
        0000676C6B656A695056578C8B8D9191916D6C6C7F7B7C808181949693939695
        72787AA0A2A2787A7A6C6E6E7274746B6C699194927373727476778685849392
        928A88888D8E8E6B6C6C8D8F908A8F8D82898D7A7B7B7F83847378787475757F
        7E7B70706E99959383817D77797D8C8A8990918F898B8B9FA1A18A8B8C919799
        898A8E909998A4A9A98E8B8B888888787976706E6D8984828685836F71738586
        89878E90777C7C8C8E8E7C7D7E6B72798C90938C8F928692918F939371717170
        7470575C5A858886888D8E7D7F847E81869297996F737297979766686F55585B
        7C7F7F676C6B8286878583848F918D828785545F5F75828885898A7D85869093
        94949798888C909A9998A19F9D88898A8587896A70709595939A9B98898D8C8A
        8D8C8F95967A7F7F8E8F90AAA9A8989B98999A9A959698C0C1C1A2A09A919291
        908F8F8186849A9E9F909898898B877173728F93948B8E8CA3A6A5848689A1A0
        9E96928EA9ABA99BA2A4919596898C8D7A7D7C686D6C898E8F83898B93959268
        6C6C8384838C8B88A2AAAA7C80806D706F808789747E827577778F908FA4A6A5
        8C8F8E717675797E7D6969657F7E787679789A989692908C6F71726765659C9E
        9EA2ACB285919A91908E8785838C8E8D8589898085849A9E9D8E8E8C90969457
        5F629A9D9B959897767C7D78797B8283819A9B9B808685888B89777674878E8D
        8F92939DA4A4A3A5A5999B97898E8C6B73758389899B9F9F6E76779797958381
        7FACACAD9394938B8E8C6D706E848885A6A8A699A1A19294958184879CAFB78D
        97986E7574888B8B8086889EA9AD959897979E9F9291916D6F6D5C6161727678
        898D8B74787485838075777290999B737C79898A887F807E858989777C7C8888
        88848C8D88888880828080837F7277787B80805459587879797478769292906F
        766E797D7B666967777E7D5C63627B7A786F75747375747D817F656D6C6F7573
        8D92916C7271454B4A5C62608D8C8B898E8C494C4A464A475C64635B63636E6D
        6B9296956B6D6C7176747C8282878C89959A997479786F7574686E6B7F858369
        6D6D}
      Title = 'CidadexOcorrencia'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      Data = {0000000000}
      Detail = {0000000000}
    end
  end
end
