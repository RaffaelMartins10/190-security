program Chamada_de_EmergenciaWorkspace;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Vcl.Controls,
  System.SysUtils,
  UFrmPrincipal in 'VisaoControle\UFrmPrincipal.pas' {FrmPrincipal},
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
  UFrmPesquisa in 'VisaoControle\UFrmPesquisa.pas' {frmPesquisa},
  UListaVisualizacao in 'Modelo\UListaVisualizacao.pas',
  URegraCRUDUsuario in 'Modelo\Regra\URegraCRUDUsuario.pas',
  URepositorioUsuario in 'Modelo\Persistencia\URepositorioUsuario.pas',
  UUsuario in 'Modelo\Persistencia\UUsuario.pas',
  UUsuarioLogado in 'Modelo\UUsuarioLogado.pas',
  UFrmCadastroUsuario in 'VisaoControle\UFrmCadastroUsuario.pas' {FrmCadastroUsuario},
  UFrmLogin in 'VisaoControle\UFrmLogin.pas' {FrmLogin},
  UCidadao in 'Modelo\Persistencia\UCidadao.pas',
  UEmergencia in 'Modelo\Persistencia\UEmergencia.pas',
  URegraSituacaoEmergencia in 'Modelo\Regra\URegraSituacaoEmergencia.pas',
  USituacaoEmergencia in 'Modelo\Persistencia\USituacaoEmergencia.pas',
  URepositorioEmergencia in 'Modelo\Persistencia\URepositorioEmergencia.pas',
  URepositorioCidadao in 'Modelo\Persistencia\URepositorioCidadao.pas';

{$R *.res}

begin
  {$DEFINE DEV}
  Application.Initialize;
  Application.CreateForm(TdmEntra21, dmEntra21);
  {$IFDEF PROD}
  FrmLogin := TFrmLogin.Create(nil);
  if FrmLogin.ShowModal = mrYes then
    begin
      FreeAndNil(FrmLogin);
      Application.CreateForm(TFrmPrincipal, FrmPrincipal);
      Application.Run;
    end
  else
    begin
      Application.Run;
      Application.Terminate;
    end;
  {$ELSE}
  TUsuarioLogado.Unico.RealizaLogin('admin', 'adminadmin');
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
  {$ENDIF}
end.
