unit URegraSituacaoEmergencia;

interface

uses
    URepositorioEmergencia
  ;

type
  TRegraSituacaoEmergencia = class
  private
    FRepositorioEmergencia: TRepositorioEmergencia;

  public
    constructor Create;
    destructor Destroy; override;

    procedure ProximaSituacao(const IdEmergencia: Integer);
    procedure SituacaoAnterior(const IdEmergencia: Integer);
  end;

implementation

uses
    SysUtils
  , UEMERGENCIA
  ;

{ TRegraSituacaoEmergencia }

constructor TRegraSituacaoEmergencia.Create;
begin
  FRepositorioEmergencia := TRepositorioEmergencia.Create;
end;

destructor TRegraSituacaoEmergencia.Destroy;
begin
  FreeAndNil(FRepositorioEmergencia);
  inherited;
end;

procedure TRegraSituacaoEmergencia.SituacaoAnterior(const IdEmergencia: Integer);
var
  EMERGENCIA: TEMERGENCIA;
begin
  EMERGENCIA := TEMERGENCIA(FRepositorioEmergencia.Retorna(IdEmergencia));
  case EMERGENCIA.SITUACAO of
         sePendente: raise Exception.Create('Emergencia ainda está pendente');
    seEmAtendimento: EMERGENCIA.SITUACAO := sePendente;
        seConcluida: EMERGENCIA.SITUACAO := seEmAtendimento;
  end;

  FRepositorioEmergencia.Atualiza(EMERGENCIA);
end;

procedure TRegraSituacaoEmergencia.ProximaSituacao(const IdEmergencia: Integer);
var
  EMERGENCIA: TEMERGENCIA;
begin
  EMERGENCIA := TEMERGENCIA(FRepositorioEmergencia.Retorna(IdEmergencia));
  case EMERGENCIA.SITUACAO of
         sePendente: EMERGENCIA.SITUACAO := seEmAtendimento;
    seEmAtendimento: EMERGENCIA.SITUACAO := seConcluida;
        seConcluida: raise Exception.Create('Emergencia já foi concluída');
  end;

  FRepositorioEmergencia.Atualiza(EMERGENCIA);
end;

end.
