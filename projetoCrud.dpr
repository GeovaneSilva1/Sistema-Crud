program projetoCrud;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uEmpresas in 'uEmpresas.pas' {frmEmpresas},
  uFornecedores in 'uFornecedores.pas' {frmFornecedores},
  uConsultFornecedores in 'uConsultFornecedores.pas' {frmConsultFornecedores},
  uProcedimentosPadroes in 'uProcedimentosPadroes.pas',
  uDM in 'uDM.pas' {DM: TDataModule},
  uFiltro in 'uFiltro.pas' {frmFiltro};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmFiltro, frmFiltro);
  Application.Run;
end.
