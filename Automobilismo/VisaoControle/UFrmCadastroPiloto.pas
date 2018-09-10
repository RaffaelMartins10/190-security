unit UFrmCadastroPiloto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, ComCtrls, Menus, Buttons, StdCtrls, ExtCtrls, PwCtrls
  , UUtilitarios
  , UPiloto
  , URegraCRUDPiloto
  , URegraCRUDPais
  ;

type
  TFrmCadastroPiloto = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    lbNome: TLabel;
    btnLocalizarPais: TButton;
    edNome: TEdit;
    dtpDataNascimento: TDateTimePicker;
    lbDataNascimento: TLabel;
    edCodigoPais: TIntegerEdit;
    lbPais: TLabel;
    stNomePais: TStaticText;
    procedure edCodigoPaisExit(Sender: TObject);
    procedure btnLocalizarPaisClick(Sender: TObject);
    procedure edCodigoPaisKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FPILOTO: TPILOTO;
    FRegraCRUDPiloto: TRegraCRUDPiloto;

  protected
    procedure Inicializa; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;
  end;

var
  FrmCadastroPiloto: TFrmCadastroPiloto;

implementation

{$R *.dfm}

uses
    UDialogo
  , UPais
  , UOpcaoPesquisa
  , UMensagens
  , UFrmPesquisa
  , UEntidade
  ;

{ TFrmCadastroPiloto }

procedure TFrmCadastroPiloto.btnLocalizarPaisClick(Sender: TObject);
begin
  edCodigoPais.IntegerNumber := TfrmPesquisa.MostrarPesquisa(
    TOpcaoPesquisa.Create
      .DefineVisao(TBL_PAIS)
      .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
      .DefineNomePesquisa(STR_PAIS)
      .AdicionaFiltro(FLD_PAIS_NOME)
  );
  edCodigoPais.OnExit(Self);
end;

procedure TFrmCadastroPiloto.edCodigoPaisExit(Sender: TObject);
begin
  stNomePais.Caption := EmptyStr;
  FPILOTO.PAIS.ID    := 0;

  if edCodigoPais.IntegerNumber <> 0 then
  begin
    try
      FRegraCRUDPiloto.ValidaPais(edCodigoPais.IntegerNumber);
      FPILOTO.PAIS := FRegraCRUDPiloto.RetornaPais(edCodigoPais.IntegerNumber);

      stNomePais.Caption := FPILOTO.PAIS.NOME;
    except
      on E: Exception do
      begin
        TDialogo.Excecao(E);
        edCodigoPais.SetFocus;
      end;
    end;
  end;
end;

procedure TFrmCadastroPiloto.edCodigoPaisKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F7 then
  begin
    btnLocalizarPais.Click;
  end;
end;

procedure TFrmCadastroPiloto.Inicializa;
begin
  inherited;
  DefineEntidade(@FPILOTO, TPILOTO);
  DefineRegraCRUD(@FRegraCRUDPiloto, TRegraCRUDPiloto);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_PILOTO)
    .DefineNomeCampoRetorno(VW_PILOTO_ID)
    .AdicionaFiltro(VW_PILOTO_NOME)
    .DefineNomePesquisa(STR_PILOTO));
end;

procedure TFrmCadastroPiloto.HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := FTipoOperacaoUsuario in [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroPiloto.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus;
end;

procedure TFrmCadastroPiloto.PreencheEntidade;
begin
  inherited;
  FPILOTO.NOME            := edNome.Text;
  FPILOTO.DATA_NASCIMENTO := dtpDataNascimento.Date;
end;

procedure TFrmCadastroPiloto.PreencheFormulario;
begin
  inherited;
  edNome.Text                := FPILOTO.NOME;
  dtpDataNascimento.Date     := FPILOTO.DATA_NASCIMENTO;
  edCodigoPais.IntegerNumber := FPILOTO.PAIS.ID;
  stNomePais.Caption         := FPILOTO.PAIS.NOME;
end;

end.
