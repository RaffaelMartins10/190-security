unit URepositorioFabricante;

interface

uses
    URepositorioDB
  , UFabricante
  , SqlExpr
  ;

type
  TRepositorioFabricante = class(TRepositorioDB<TFABRICANTE>)
  protected
    //Atribui os dados do banco no objeto
    procedure AtribuiDBParaEntidade(const coFABRICANTE: TFABRICANTE); override;
    //Atribui os dados do objeto no banco
    procedure AtribuiEntidadeParaDB(const coFABRICANTE: TFABRICANTE;
                                    const coSQLQuery: TSQLQuery); override;
  public
    constructor Create;
  end;

implementation

uses
    UEntidade
  , UMensagens
  ;

{ TRepositorioFabricante }

constructor TRepositorioFabricante.Create;
begin
  Inherited Create(TFABRICANTE, TBL_FABRICANTE, FLD_ENTIDADE_ID, STR_FABRICANTE);
end;

procedure TRepositorioFabricante.AtribuiDBParaEntidade(const coFABRICANTE: TFABRICANTE);
begin
  inherited;
  coFABRICANTE.NOME := FSQLSelect.FieldByName(FLD_FABRICANTE_NOME).AsString;
end;

procedure TRepositorioFabricante.AtribuiEntidadeParaDB(const coFABRICANTE: TFABRICANTE;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  coSQLQuery.ParamByName(FLD_FABRICANTE_NOME).AsString := coFABRICANTE.NOME;
end;

end.
