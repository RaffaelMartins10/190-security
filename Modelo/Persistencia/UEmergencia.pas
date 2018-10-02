unit UEmergencia;

interface

uses
    UENTIDADE
  , UCIDADAO
  , Graphics
  ;

type
  TSituacaoEmergencia = (sePendente, seEmAtendimento, seConcluida);

  TEMERGENCIA = class(TENTIDADE)
  private
    FDataHora: TDateTime;
    FSituacao: TSituacaoEmergencia;
    FCidadao: TCIDADAO;

  public
    constructor Create; override;
    destructor Destroy; override;

    property DATA_HORA: TDateTime read FDataHora write FDataHora;
    property SITUACAO: TSituacaoEmergencia read FSituacao write FSituacao;
    property CIDADAO: TCIDADAO read FCidadao write FCidadao;
  end;

const
  CNT_SITUACAO_EMERGENCIA_CORES: Array[TSituacaoEmergencia] of TColor =
    ($008C8CF4 //sePendente
   , $00A3EDF3 //seEmAtendimento
   , $0099FDB3 //seConcluida
   );

  TBL_EMERGENCIA            = 'EMERGENCIA';
  FLD_EMERGENCIA_DATA_HORA  = 'DATA_HORA';
  FLD_EMERGENCIA_SITUACAO   = 'SITUACAO';
  FLD_EMERGENCIA_ID_CIDADAO = 'ID_CIDADAO';

  VW_EMERGENCIA          = 'VW_EMERGENCIA';
  VW_EMERGENCIA_ID       = 'Id.';
  VW_EMERGENCIA_SITUACAO = 'Situação';
  VW_EMERGENCIA_ENDERECO = 'Endereço';

implementation

uses
    SysUtils
  ;

{ TEMERGENCIA }

constructor TEMERGENCIA.Create;
begin
  inherited;
  FCidadao := TCIDADAO.Create;
end;

destructor TEMERGENCIA.Destroy;
begin
  if Assigned(FCidadao) then
  begin
    FreeAndNil(FCidadao);
  end;

  inherited;
end;

end.
