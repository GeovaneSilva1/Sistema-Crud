unit uFiltro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DB, DBTables;

type
  TfrmFiltro = class(TForm)
    Panel1: TPanel;
    edFiltroNome: TEdit;
    edFiltroCpfCnpj: TMaskEdit;
    Label1: TLabel;
    rgCpfCnpj: TRadioGroup;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edFiltroDataDe: TMaskEdit;
    edFiltroDataAte: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    btFiltrar: TBitBtn;
    btLimparFiltro: TBitBtn;
    procedure rgCpfCnpjClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure btLimparFiltroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltro: TfrmFiltro;

implementation

uses uConsultFornecedores, uDM, uEmpresas, uFornecedores, uPrincipal,
  uProcedimentosPadroes;

{$R *.dfm}

procedure TfrmFiltro.rgCpfCnpjClick(Sender: TObject);
begin
  if rgCpfCnpj.ItemIndex = 0 then
     edFiltroCpfCnpj.EditMask := '999.999.999-99;0;_'
  else
     edFiltroCpfCnpj.EditMask := '99.999.999/9999-99;0;_';

end;

procedure TfrmFiltro.FormCreate(Sender: TObject);
begin
  edFiltroCpfCnpj.EditMask := '999.999.999-99;0;_';
end;

procedure TfrmFiltro.btFiltrarClick(Sender: TObject);
var
  wFiltroConsulta: string;
begin
  wFiltroConsulta := '';
  DM.tbFornecedores.Filtered := false;
  //filtro Nome do fornecedor
  if edFiltroNome.text <> '' then
     wFiltroConsulta := 'bdNOMEFORNECEDORES = ' + QuotedStr(edFiltroNome.Text) + 'AND ';

  //filtro cpf/cnpj
  if (rgCpfCnpj.ItemIndex = 0) and (edFiltroCpfCnpj.Text <> '') then
     wFiltroConsulta := wFiltroConsulta + 'bdCPF =' + QuotedStr(edFiltroCpfCnpj.Text) + 'AND '
  else if (rgCpfCnpj.ItemIndex = 1) and (edFiltroCpfCnpj.Text <> '') then
     wFiltroConsulta := wFiltroConsulta + 'bdCNPJFORNECEDORES =' + QuotedStr(edFiltroCpfCnpj.Text) + 'AND ';

  //filtro data de cadastro
  if (edFiltroDataDe.Text <> '  /  /    ') and (edFiltroDataAte.Text = '  /  /    ') then
     wFiltroConsulta := wFiltroConsulta + 'bdDATACAD =' + QuotedStr(edFiltroDataDe.Text)   + 'AND ';

  if (edFiltroDataDe.Text = '  /  /    ') and (edFiltroDataAte.Text <> '  /  /    ') then
     wFiltroConsulta := wFiltroConsulta + 'bdDATACAD <=' + QuotedStr(edFiltroDataAte.Text) + 'AND ';

  if (edFiltroDataDe.Text <> '  /  /    ') and (edFiltroDataAte.Text <> '  /  /    ')  then
     wFiltroConsulta := wFiltroConsulta + 'bdDATACAD >=' + QuotedStr(edFiltroDataDe.Text)  + 'AND '
                                        + 'bdDATACAD <=' + QuotedStr(edFiltroDataAte.Text) + 'AND ';

  //retirando o AND do final de todo o filtro
  wFiltroConsulta := Copy(wFiltroConsulta, 0, length(wFiltroConsulta)-4);

  if wFiltroConsulta <> '' then
     begin
       DM.tbFornecedores.Filter := wFiltroConsulta;
       Dm.tbFornecedores.Filtered := True;
     end;

end;

procedure TfrmFiltro.btLimparFiltroClick(Sender: TObject);
begin
  DM.tbFornecedores.Filtered := False;

  edFiltroNome.Clear;

  edFiltroCpfCnpj.Clear;

  edFiltroDataDe.Clear;

  edFiltroDataAte.Clear;
end;

end.
