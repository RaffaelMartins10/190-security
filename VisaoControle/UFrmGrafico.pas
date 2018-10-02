unit UFrmGrafico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Data.DB,
  VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, SQLExpr
  , VCLTee.Series, Vcl.Menus
  ;

type
  TfrmGrafico = class(TForm)
    cdbCidadeOcorrencia: TDBChart;
    Series1: TPieSeries;
    procedure FormShow(Sender: TObject);
  end;

var
  frmGrafico: TfrmGrafico;

implementation

{$R *.dfm}
uses
    UDM
  , DateUtils
  ;
{ TForm1 }

procedure TfrmGrafico.FormShow(Sender: TObject);
begin
  dmEntra21.SQLSelect.Close;
  dmEntra21.SQLSelect.CommandText := 'select cidade, count(nome) total_ocorrencias from cidadao group by cidade';
  dmEntra21.SQLSelect.Open;
  while not dmEntra21.SQLSelect.Eof do
  begin
    Series1.Add(dmEntra21.SQLSelect.FieldByName('total_ocorrencias').AsFloat
             , dmEntra21.SQLSelect.FieldByName('Cidade').AsString);

    dmEntra21.SQLSelect.Next;
  end;
end;
end.
