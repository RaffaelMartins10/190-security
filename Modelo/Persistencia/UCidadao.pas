unit UCidadao;

interface

uses
    UEntidade
  ;

type
  TCIDADAO = class(TENTIDADE)
  protected
    FNOME:String;
    FCPF:String;
    FTELEFONE:String;
    FENDERECO:String;
    FCIDADE:String;
    FESTADO:String;

  public
    property NOME: String read FNOME write FNOME;
    property CPF: String read FCPF write FCPF;
    property TELEFONE: String read FTELEFONE write FTELEFONE;
    property ENDERECO: String read FENDERECO write FENDERECO;
    property CIDADE: String read FCIDADE write FCIDADE;
    property ESTADO: String read FESTADO write FESTADO;

  end;

const
  TBL_CIDADAO           = 'CIDADAO' ;
  FLD_CIDADAO_NOME      = 'NOME';
  FLD_CIDADAO_CPF       = 'CPF';
  FLD_CIDADAO_TELEFONE  = 'TELEFONE';
  FLD_CIDADAO_ENDERECO  = 'ENDERECO';
  FLD_CIDADAO_CIDADE    = 'CIDADE';
  FLD_CIDADAO_ESTADO    = 'ESTADO';


implementation

{ TCIDADAO }

end.
