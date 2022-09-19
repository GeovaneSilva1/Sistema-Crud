unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, Buttons, DB, DBClient;

type
  TfrmPrincipal = class(TForm)
    pnPrincipal: TPanel;
    pnbotoesPrincipais: TPanel;
    btEmpresas: TBitBtn;
    mnPrincipal: TMainMenu;
    mnArquivo: TMenuItem;
    N1: TMenuItem;
    btMenuSair: TMenuItem;
    mnCadastro: TMenuItem;
    btMenuEmpresas: TMenuItem;
    btMenuFornecedores: TMenuItem;
    btMenuClientes: TMenuItem;
    btFornecedores: TBitBtn;
    btClientes: TBitBtn;
    imgPrincipal: TImage;
    mnConsultas: TMenuItem;
    btMenuConsultaFornecedores: TMenuItem;
    procedure btMenuSairClick(Sender: TObject);
    procedure btEmpresasClick(Sender: TObject);
    procedure btMenuEmpresasClick(Sender: TObject);
    procedure btFornecedoresClick(Sender: TObject);
    procedure btMenuFornecedoresClick(Sender: TObject);
    procedure btMenuConsultaFornecedoresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
implementation

uses uEmpresas, uFornecedores, uConsultFornecedores, uProcedimentosPadroes,
  uDM;

{$R *.dfm}

procedure TfrmPrincipal.btMenuSairClick(Sender: TObject);
begin
 if MessageDlg('Deseja Realmente Sair?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    Application.Terminate;
end;

procedure TfrmPrincipal.btEmpresasClick(Sender: TObject);
var
  wFrmEmpresas: TfrmEmpresas;
  wFrmFornecedores: TfrmFornecedores;
begin
  wFrmEmpresas := TfrmEmpresas.Create(Self);
  wFrmEmpresas.Show;
  wFrmFornecedores := TfrmFornecedores.Create(Self);
end;

procedure TfrmPrincipal.btMenuEmpresasClick(Sender: TObject);
var
  wFrmEmpresas: TfrmEmpresas;
  wFrmFornecedores: TfrmFornecedores;
begin
  wFrmEmpresas := TfrmEmpresas.Create(Self);
  wFrmEmpresas.Show;
  wFrmFornecedores := TfrmFornecedores.Create(Self);
end;

procedure TfrmPrincipal.btFornecedoresClick(Sender: TObject);
var
  wFrmFornecedores: TfrmFornecedores;
begin
  wFrmFornecedores := TfrmFornecedores.Create(Self);
  wFrmFornecedores.Show;
end;

procedure TfrmPrincipal.btMenuFornecedoresClick(Sender: TObject);
var
  wFrmFornecedores: TfrmFornecedores;
begin
  wFrmFornecedores := TfrmFornecedores.Create(Self);
  wFrmFornecedores.Show;
end;

procedure TfrmPrincipal.btMenuConsultaFornecedoresClick(Sender: TObject);
var
  wFrmConsultFornecedores: TfrmConsultFornecedores;
begin
  wFrmConsultFornecedores := TfrmConsultFornecedores.Create(Self);
  wFrmConsultFornecedores.ShowModal;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  DM := TDM.Create(Application.MainForm);
  pCriaTabelaEmpresa;
  pCriaTabelaFornecedores;
end;

end.
