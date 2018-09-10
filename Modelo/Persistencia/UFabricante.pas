unit UFabricante;

interface

uses
    UEntidade
  ;

type
  TFABRICANTE = class(TENTIDADE)
  private
    FNome: String;

  public
    property NOME: String read FNome write FNome;

  end;

const
  TBL_FABRICANTE      = 'FABRICANTE';
  FLD_FABRICANTE_NOME = 'NOME';

implementation

end.
