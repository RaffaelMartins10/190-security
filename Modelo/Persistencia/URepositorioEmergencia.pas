unit URepositorioEmergencia;

interface

uses
    UEmergencia
  , UEntidade
  , URepositorioDB
  , URepositorioCidadao
  , SqlExpr
  ;

type
  TRepositorioEmergencia = class(TRepositorioDB<TEMERGENCIA>)
  private
    FRepositorioCidadao: TRepositorioCidadao;

  public
    constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade(const coEMERGENCIA: TEMERGENCIA); override;
    procedure AtribuiEntidadeParaDB(const coEMERGENCIA: TEMERGENCIA;
                                    const coSQLQuery: TSQLQuery); override;
  end;

implementation

uses
    UDM
  , UUtilitarios
  , SysUtils
  , UMensagens
  , UCidadao
  ;

{ TRepositorioUsuario }

constructor TRepositorioEmergencia.Create;
begin
  Inherited Create(TEMERGENCIA, TBL_EMERGENCIA, FLD_ENTIDADE_ID, STR_EMERGENCIA);
  FRepositorioCidadao := TRepositorioCidadao.Create;
end;

destructor TRepositorioEmergencia.Destroy;
begin
  FreeAndNil(FRepositorioCidadao);
  inherited;
end;

procedure TRepositorioEmergencia.AtribuiDBParaEntidade(const coEMERGENCIA: TEMERGENCIA);
begin
  inherited;
  with FSQLSelect do
  begin
    coEMERGENCIA.DATA_HORA := FieldByName(FLD_EMERGENCIA_DATA_HORA).AsDateTime;
    coEMERGENCIA.SITUACAO  := TSituacaoEmergencia(FieldByName(FLD_EMERGENCIA_SITUACAO).AsInteger);
    coEMERGENCIA.CIDADAO   := TCIDADAO(FRepositorioCidadao.Retorna(FieldByName(FLD_EMERGENCIA_ID_CIDADAO).AsInteger));
  end;
end;

procedure TRepositorioEmergencia.AtribuiEntidadeParaDB(const coEMERGENCIA: TEMERGENCIA;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_EMERGENCIA_DATA_HORA ).AsDateTime := coEMERGENCIA.DATA_HORA;
    ParamByName(FLD_EMERGENCIA_SITUACAO  ).AsInteger  := Integer(coEMERGENCIA.SITUACAO);
    ParamByName(FLD_EMERGENCIA_ID_CIDADAO).AsInteger  := coEMERGENCIA.CIDADAO.ID;
  end;
end;

end.
