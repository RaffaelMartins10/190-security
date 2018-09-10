unit UFrmCadastroFabricante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , UFabricante
  , URegraCRUDFabricante
  , UUtilitarios
  ;

type
  TFrmCadastroFabricante = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    lbNome: TLabel;
    edNome: TEdit;
  private
    FFABRICANTE: TFABRICANTE;
    FRegraCRUDFabricante: TRegraCRUDFabricante;

  protected
    procedure Inicializa; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;
  end;

var
  FrmCadastroFabricante: TFrmCadastroFabricante;

implementation

uses
    UOpcaoPesquisa
  , UEntidade
  , UMensagens
  ;

{$R *.dfm}

{ TFrmCadastroFabricante }

procedure TFrmCadastroFabricante.HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := FTipoOperacaoUsuario In [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroFabricante.Inicializa;
begin
  inherited;
  DefineEntidade(@FFABRICANTE, TFABRICANTE);
  DefineRegraCRUD(@FRegraCRUDFabricante, TRegraCRUDFabricante);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(TBL_FABRICANTE)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .AdicionaFiltro(FLD_FABRICANTE_NOME)
    .DefineNomePesquisa(STR_FABRICANTE));
end;

procedure TFrmCadastroFabricante.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus;
end;

procedure TFrmCadastroFabricante.PreencheEntidade;
begin
  inherited;
  FFABRICANTE.NOME := edNome.Text;
end;

procedure TFrmCadastroFabricante.PreencheFormulario;
begin
  inherited;
  edNome.Text := FFABRICANTE.NOME;
end;

end.
