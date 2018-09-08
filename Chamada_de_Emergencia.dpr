program Chamada_de_Emergencia;

uses
  Vcl.Forms,
  UFrmPrincipal in '..\TrabalhoDelphi\UFrmPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
