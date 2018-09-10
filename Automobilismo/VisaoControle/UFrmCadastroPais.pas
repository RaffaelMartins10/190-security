unit UFrmCadastroPais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , UPais
  , URegraCRUDPais
  , UUtilitarios, PwCtrls
  ;

type
  TFrmCadastroPais = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    lbNome: TLabel;
    edNome: TEdit;
    procedure edNomeExit(Sender: TObject);
  private
    FPAIS: TPAIS;
    FRegraCRUDPais: TRegraCRUDPais;

  protected
    procedure Inicializa; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;
  end;

var
  FrmCadastroPais: TFrmCadastroPais;

implementation

uses
    UOpcaoPesquisa
  , UEntidade
  , UMensagens
  , UDialogo
  ;

{$R *.dfm}

{ TFrmCadastroPais }

procedure TFrmCadastroPais.edNomeExit(Sender: TObject);
begin
  inherited;
  try
    FRegraCRUDPais.ValidaNomeDuplicidade(edNome.Text
                                       , edCodigo.IntegerNumber);
  except
    on E: Exception do
    begin
      TDialogo.Excecao(E);
      edNome.SetFocus;
    end;
  end;
end;

procedure TFrmCadastroPais.HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := FTipoOperacaoUsuario In [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroPais.Inicializa;
begin
  inherited;
  DefineEntidade(@FPAIS, TPAIS);
  DefineRegraCRUD(@FRegraCRUDPais, TRegraCRUDPais);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(TBL_PAIS)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .AdicionaFiltro(FLD_PAIS_NOME)
    .DefineNomePesquisa(STR_PAIS));
end;

procedure TFrmCadastroPais.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus;
end;

procedure TFrmCadastroPais.PreencheEntidade;
begin
  inherited;
  FPAIS.NOME := edNome.Text;
end;

procedure TFrmCadastroPais.PreencheFormulario;
begin
  inherited;
  edNome.Text := FPAIS.NOME;
end;

end.
