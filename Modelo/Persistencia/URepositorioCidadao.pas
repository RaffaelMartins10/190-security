unit URepositorioCidadao;

interface

uses
    UCidadao
  , UEntidade
  , URepositorioDB
  , SqlExpr
  ;

type
  TRepositorioCidadao = class(TRepositorioDB<TCIDADAO>)
  public
    constructor Create;

    procedure AtribuiDBParaEntidade(const coCIDADAO: TCIDADAO); override;
    procedure AtribuiEntidadeParaDB(const coCIDADAO: TCIDADAO;
                                    const coSQLQuery: TSQLQuery); override;
  end;

implementation

uses
    UDM
  , UUtilitarios
  , SysUtils
  , UMensagens
  ;

{ TRepositorioCidadao }

constructor TRepositorioCidadao.Create;
begin
  Inherited Create(TCIDADAO, TBL_CIDADAO, FLD_ENTIDADE_ID, STR_CIDADAO);
end;

procedure TRepositorioCidadao.AtribuiDBParaEntidade(const coCIDADAO: TCIDADAO);
begin
  inherited;
  with FSQLSelect do
  begin
    coCIDADAO.NOME     := FieldByName(FLD_CIDADAO_NOME).AsString;
    coCIDADAO.CPF      := FieldByName(FLD_CIDADAO_CPF).AsString;
    coCIDADAO.TELEFONE := FieldByName(FLD_CIDADAO_TELEFONE).AsString;
    coCIDADAO.ENDERECO := FieldByName(FLD_CIDADAO_ENDERECO).AsString;
    coCIDADAO.CIDADE   := FieldByName(FLD_CIDADAO_CIDADE).AsString;
    coCIDADAO.ESTADO   := FieldByName(FLD_CIDADAO_ESTADO).AsString;
  end;
end;

procedure TRepositorioCidadao.AtribuiEntidadeParaDB(const coCIDADAO: TCIDADAO;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_CIDADAO_NOME).AsString     := coCIDADAO.NOME;
    ParamByName(FLD_CIDADAO_CPF).AsString      := coCIDADAO.CPF;
    ParamByName(FLD_CIDADAO_TELEFONE).AsString := coCIDADAO.TELEFONE;
    ParamByName(FLD_CIDADAO_ENDERECO).AsString := coCIDADAO.ENDERECO;
    ParamByName(FLD_CIDADAO_CIDADE).AsString   := coCIDADAO.CIDADE;
    ParamByName(FLD_CIDADAO_ESTADO).AsString   := coCIDADAO.ESTADO;
  end;
end;

end.
