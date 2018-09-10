unit UPiloto;

interface

uses
    UEntidade
  , UPais
  ;

type
  TPILOTO = class(TENTIDADE)
  private
    FNome: String;
    FDataNascimento: TDate;
    FPAIS: TPAIS;

  public
    constructor Create; override;
    destructor Destroy; override;

    property NOME: String read FNome write FNome;
    property DATA_NASCIMENTO: TDate read FDataNascimento write FDataNascimento;
    property PAIS: TPAIS read FPais write FPais;
  end;

const
  TBL_PILOTO                 = 'PILOTO';
  FLD_PILOTO_NOME            = 'NOME';
  FLD_PILOTO_DATA_NASCIMENTO = 'DATA_NASCIMENTO';
  FLD_PILOTO_ID_PAIS         = 'ID_PAIS';

  VW_PILOTO      = 'VW_PILOTO';
  VW_PILOTO_ID   = 'Id.';
  VW_PILOTO_NOME = 'Nome';

implementation

uses
    SysUtils
  ;

{ TPILOTO }

constructor TPILOTO.Create;
begin
  Inherited;
  FPAIS := TPAIS.Create;
end;

destructor TPILOTO.Destroy;
begin
  if Assigned(FPAIS) then
  begin
    FreeAndNil(FPAIS);
  end;
  inherited;
end;

end.
