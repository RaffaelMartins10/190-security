unit URepositorioPais;

interface

uses
    URepositorioDB
  , UPais
  , SqlExpr
  ;

type
  TRepositorioPais = class(TRepositorioDB<TPAIS>)
  protected
    //Atribui os dados do banco no objeto
    procedure AtribuiDBParaEntidade(const coPAIS: TPAIS); override;
    //Atribui os dados do objeto no banco
    procedure AtribuiEntidadeParaDB(const coPAIS: TPAIS;
                                    const coSQLQuery: TSQLQuery); override;
  public
    constructor Create;
  end;

implementation

uses
    UEntidade
  , UMensagens
  ;

{ TRepositorioPais }

constructor TRepositorioPais.Create;
begin
  Inherited Create(TPAIS, TBL_PAIS, FLD_ENTIDADE_ID, STR_PAIS);
end;

procedure TRepositorioPais.AtribuiDBParaEntidade(const coPAIS: TPAIS);
begin
  inherited;
  coPAIS.NOME := FSQLSelect.FieldByName(FLD_PAIS_NOME).AsString;
end;

procedure TRepositorioPais.AtribuiEntidadeParaDB(const coPAIS: TPAIS;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  coSQLQuery.ParamByName(FLD_PAIS_NOME).AsString := coPAIS.NOME;
end;

end.
