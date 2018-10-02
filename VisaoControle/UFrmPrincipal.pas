unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, UFrmPesquisa,UCidadao, Data.DB,
  Vcl.DBGrids, Vcl.ComCtrls
  , UListaVisualizacao
  , UFrmCadastroUsuario
  , URegraSituacaoEmergencia
  ;

type
  TfrmPrincipal = class(TForm)
    btnRelatorioUsuario: TImage;
    lbRelatorioUsuario: TLabel;
    pnlBotoes: TPanel;
    btnRelatorioOcorrencia: TImage;
    lbRelatorioDeOcorrencia: TLabel;
    pnlEmergencias: TPanel;
    tmEmergencia: TTimer;
    dbgEmergencias: TDBGrid;
    btnCadastroDePolicial: TImage;
    lbCadastroDePolicial: TLabel;
    sbPrincipal: TStatusBar;
    timerDataHora: TTimer;
    btnLogout: TImage;
    lbLogout: TLabel;
    pmSituacaoEmergencia: TPopupMenu;
    miProximo: TMenuItem;
    miAnterior: TMenuItem;
    Image1: TImage;
    btnGrafico: TImage;
    lbGrafico: TLabel;
    Panel4: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tmEmergenciaTimer(Sender: TObject);
    procedure btnCadastroDePolicialClick(Sender: TObject);
    procedure AtualizaUsuarioLogado;
    procedure timerDataHoraTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRelatorioOcorrenciaClick(Sender: TObject);
    procedure btnRelatorioUsuarioClick(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure dbgEmergenciasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure miProximoClick(Sender: TObject);
    procedure miAnteriorClick(Sender: TObject);
    procedure btnGraficoClick(Sender: TObject);
  private
    FListaVisualizacao: TListaVisualizacao;
    FRegraSituacaoEmergencia: TRegraSituacaoEmergencia;
  end;

var
  frmPrincipal: TfrmPrincipal;
  frmPesquisa:TfrmPesquisa;

implementation

uses
    UEntidade
  , UMensagens
  , UOpcaoPesquisa
  , UEmergencia
  , UDM
  , UUsuarioLogado
  , UFrmLogin
  ,UFrmGrafico
  ;

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.AtualizaUsuarioLogado;
begin
  sbPrincipal.Panels[1].Text :=
    'Usuário: ' + TUsuarioLogado.USUARIO.NOME;
end;

procedure TfrmPrincipal.btnCadastroDePolicialClick(Sender: TObject);
begin
  TFrmCadastroUsuario.Create(Self);
end;

procedure TfrmPrincipal.btnGraficoClick(Sender: TObject);
begin
  TfrmGrafico.Create(self).Show;
end;

procedure TfrmPrincipal.btnLogoutClick(Sender: TObject);
begin
  TUsuarioLogado.Logoff;
  Application.CreateForm(TFrmLogin, FrmLogin);
  frmPrincipal.visible:= false;
  if FrmLogin.ShowModal = mrYes then
  begin
    FreeAndNil(FrmLogin);
    frmPrincipal.visible:= true;
    AtualizaUsuarioLogado;
  end
  else
  begin
    Close;
  end;
end;

procedure TfrmPrincipal.btnRelatorioOcorrenciaClick(Sender: TObject);
begin
  TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa.Create
   .DefineVisao(VW_EMERGENCIA)
   .AdicionaFiltro(VW_EMERGENCIA_ENDERECO)
   .DefineNomePesquisa('Relatório de Ocorrências'));
end;

procedure TfrmPrincipal.btnRelatorioUsuarioClick(Sender: TObject);
begin
  TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa.Create
   .DefineVisao('VW_CIVIL')
   .AdicionaFiltro('cpf')
   .DefineNomePesquisa('Relatório de Cidadão'));
end;

procedure TfrmPrincipal.dbgEmergenciasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  SituacaoEmergencia: TSituacaoEmergencia;
begin
  if not (gdSelected in State) then
  begin
    with dbgEmergencias do
    begin
     SituacaoEmergencia := TSituacaoEmergencia(DataSource.DataSet.FieldByName(VW_EMERGENCIA_SITUACAO).AsInteger);
     Canvas.Brush.Color := CNT_SITUACAO_EMERGENCIA_CORES[SituacaoEmergencia];
    end;
  end;

  dbgEmergencias.DefaultDrawDataCell(Rect, dbgEmergencias.columns[DataCol].field, State);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FListaVisualizacao := TListaVisualizacao.Create(dbgEmergencias);
  FListaVisualizacao.CarregaPesquisa(TOpcaoPesquisa.Create
    .DefineVisao('VW_EMERGENCIA'));

  FRegraSituacaoEmergencia := TRegraSituacaoEmergencia.Create;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNIl(FRegraSituacaoEmergencia);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  AtualizaUsuarioLogado;
end;

procedure TfrmPrincipal.miAnteriorClick(Sender: TObject);
var
  IdEmergencia: Integer;
begin
  IdEmergencia := dbgEmergencias.DataSource.DataSet.FieldByName(VW_EMERGENCIA_ID).AsInteger;

  FRegraSituacaoEmergencia.SituacaoAnterior(IdEmergencia);
  FListaVisualizacao.AtualizaPesquisa;
end;

procedure TfrmPrincipal.miProximoClick(Sender: TObject);
var
  IdEmergencia: Integer;
begin
  IdEmergencia := dbgEmergencias.DataSource.DataSet.FieldByName(VW_EMERGENCIA_ID).AsInteger;

  FRegraSituacaoEmergencia.ProximaSituacao(IdEmergencia);
  FListaVisualizacao.AtualizaPesquisa;
end;

procedure TfrmPrincipal.timerDataHoraTimer(Sender: TObject);
begin
  sbPrincipal.Panels[0].Text:= AnsiUpperCase(formatdatetime('hh:mm:ss',now))
   + '     '+formatdatetime('dddd","dd" de "mmm" de "yyyy',now)  ;
  sbPrincipal.Color := clBlue;
end;

procedure TfrmPrincipal.tmEmergenciaTimer(Sender: TObject);
begin
  FListaVisualizacao.AtualizaPesquisa;
end;

end.
