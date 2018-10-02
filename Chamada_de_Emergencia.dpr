program Chamada_de_Emergencia;

uses
  MidasLib,
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Vcl.Controls,
  System.SysUtils,
  UConstantes in 'Modelo\UConstantes.pas',
  UDialogo in 'Modelo\UDialogo.pas',
  UMensagens in 'Modelo\UMensagens.pas',
  UOpcaoPesquisa in 'Modelo\UOpcaoPesquisa.pas',
  UUtilitarios in 'Modelo\UUtilitarios.pas',
  URegraCRUD in 'Modelo\Regra\URegraCRUD.pas',
  UFrmCRUD in 'VisaoControle\UFrmCRUD.pas' {FrmCRUD},
  UFrmPesquisa in 'VisaoControle\UFrmPesquisa.pas' {frmPesquisa},
  UFrmPrincipal in 'VisaoControle\UFrmPrincipal.pas' {frmPrincipal},
  UListaVisualizacao in 'Modelo\UListaVisualizacao.pas',
  UFrmLogin in 'VisaoControle\UFrmLogin.pas' {frmLogin},
  UUsuarioLogado in 'Modelo\UUsuarioLogado.pas',
  URegraCRUDUsuario in 'Modelo\Regra\URegraCRUDUsuario.pas',
  UFrmCadastroUsuario in 'VisaoControle\UFrmCadastroUsuario.pas' {FrmCadastroUsuario},
  URegraSituacaoEmergencia in 'Modelo\Regra\URegraSituacaoEmergencia.pas',
  UCidadao in 'Modelo\Persistencia\UCidadao.pas',
  UDM in 'Modelo\Persistencia\UDM.pas' {dmEntra21: TDataModule},
  UEmergencia in 'Modelo\Persistencia\UEmergencia.pas',
  UEntidade in 'Modelo\Persistencia\UEntidade.pas',
  URepositorio in 'Modelo\Persistencia\URepositorio.pas',
  URepositorioCidadao in 'Modelo\Persistencia\URepositorioCidadao.pas',
  URepositorioDB in 'Modelo\Persistencia\URepositorioDB.pas',
  URepositorioEmergencia in 'Modelo\Persistencia\URepositorioEmergencia.pas',
  URepositorioUsuario in 'Modelo\Persistencia\URepositorioUsuario.pas',
  USituacaoEmergencia in 'Modelo\Persistencia\USituacaoEmergencia.pas',
  UUsuario in 'Modelo\Persistencia\UUsuario.pas',
  UFrmGrafico in 'VisaoControle\UFrmGrafico.pas' {frmGrafico};

{$R *.res}

begin
  {$DEFINE PROD}

  Application.Initialize;
  Application.CreateForm(TdmEntra21, dmEntra21);
  {$IFDEF PROD}
  FrmLogin := TFrmLogin.Create(nil);
  if FrmLogin.ShowModal = mrYes then
    begin
      FreeAndNil(FrmLogin);
      Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmCadastroUsuario, FrmCadastroUsuario);
  Application.CreateForm(TFrmCadastroUsuario, FrmCadastroUsuario);
  Application.Run;
    end
  else
    begin
      Application.CreateForm(TdmEntra21, dmEntra21);
      Application.Run;
      Application.Terminate;
    end;
  {$ELSE}
  TUsuarioLogado.Unico.RealizaLogin('admin', 'adminadmin');
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
  {$ENDIF}
end.
