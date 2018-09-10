program Automobilismo;

uses
  Forms,
  UFrmCRUD in 'VisaoControle\UFrmCRUD.pas' {FrmCRUD},
  UUtilitarios in 'Modelo\UUtilitarios.pas',
  UMensagens in 'Modelo\UMensagens.pas',
  UConstantes in 'Modelo\UConstantes.pas',
  UDialogo in 'Modelo\UDialogo.pas',
  UOpcaoPesquisa in 'Modelo\UOpcaoPesquisa.pas',
  UDM in 'Modelo\Persistencia\UDM.pas' {dmEntra21: TDataModule},
  UEntidade in 'Modelo\Persistencia\UEntidade.pas',
  URepositorio in 'Modelo\Persistencia\URepositorio.pas',
  URepositorioDB in 'Modelo\Persistencia\URepositorioDB.pas',
  URegraCRUD in 'Modelo\Regra\URegraCRUD.pas',
  UFabricante in 'Modelo\Persistencia\UFabricante.pas',
  UPais in 'Modelo\Persistencia\UPais.pas',
  URepositorioFabricante in 'Modelo\Persistencia\URepositorioFabricante.pas',
  URepositorioPais in 'Modelo\Persistencia\URepositorioPais.pas',
  URegraCRUDFabricante in 'Modelo\Regra\URegraCRUDFabricante.pas',
  URegraCRUDPais in 'Modelo\Regra\URegraCRUDPais.pas',
  UFrmCadastroFabricante in 'VisaoControle\UFrmCadastroFabricante.pas' {FrmCadastroFabricante},
  UFrmCadastroPais in 'VisaoControle\UFrmCadastroPais.pas' {FrmCadastroPais},
  UFrmPrincipal in 'VisaoControle\UFrmPrincipal.pas' {FrmPrincipal},
  UPiloto in 'Modelo\Persistencia\UPiloto.pas',
  URepositorioPiloto in 'Modelo\Persistencia\URepositorioPiloto.pas',
  URegraCRUDPiloto in 'Modelo\Regra\URegraCRUDPiloto.pas',
  UFrmCadastroPiloto in 'VisaoControle\UFrmCadastroPiloto.pas' {FrmCadastroPiloto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TdmEntra21, dmEntra21);
  Application.Run;
end.