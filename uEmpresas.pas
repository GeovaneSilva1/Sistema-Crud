unit uEmpresas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, MaskUtils, Grids, DBGrids,DB, DBTables, DBClient, Menus;

type
  TfrmEmpresas = class(TForm)
    pnEmpresas: TPanel;
    gbEmpresas: TGroupBox;
    edIdEmpresa: TEdit;
    cbUf: TComboBox;
    edNomeFantasia: TEdit;
    grEmpresas: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btSalvarEmpresas: TBitBtn;
    edCnpj: TMaskEdit;
    procedure btSalvarEmpresasClick(Sender: TObject);
    procedure edIdEmpresaExit(Sender: TObject);
    procedure edNomeFantasiaExit(Sender: TObject);
    procedure edCnpjExit(Sender: TObject);
    procedure cbUfKeyPress(Sender: TObject; var Key: Char);
    procedure cbUfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbUfKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmEmpresas: TfrmEmpresas;

implementation

uses uPrincipal, uFornecedores, uProcedimentosPadroes,
  uConsultFornecedores, uDM;

{$R *.dfm}

procedure TfrmEmpresas.btSalvarEmpresasClick(Sender: TObject);

begin
  if cbUf.Text = '' then
     begin
       MessageDlg('Campo UF não selecionado', mtWarning, [mbOK], 0);
       cbUf.SetFocus;
       exit;
     end;

  if fEntradaValoresEmCampos(edNomeFantasia.Text, 5) then
     begin
       edNomeFantasia.Setfocus;
       exit;
     end;

  if fEntradaValoresEmCampos(edCnpj.Text, 5) then
     begin
       edCnpj.SetFocus;
       exit;
     end
  else if Length(edCnpj.Text) < 14 then
     begin
       MessageDlg('Campo Incompleto', mtWarning, [mbOk], 0);
       edCnpj.SetFocus;
       exit;
     end;

  DM.tbEmpresas.IndexFieldNames := 'bdIDEMPRESA';                               //inserção dos dados na tbEmpresas
  if DM.tbEmpresas.FindKey([edIdEmpresa.Text]) then
     DM.tbEmpresas.Edit
  else
     DM.tbEmpresas.Insert;

  DM.tbEmpresas.FieldByName('bdIDEMPRESA').AsInteger := StrToInt(edIdEmpresa.Text);
  DM.tbEmpresas.FieldByName('bdUF').AsInteger := cbUf.ItemIndex;
  DM.tbEmpresas.fieldByname('bdNOMEFANTASIA').AsString := fRemoveEspaco(edNomeFantasia.Text);
  DM.tbEmpresas.FieldByName('bdCNPJ').AsString := edCnpj.Text;
  DM.tbEmpresas.Post;
  MessageDlg('Salvo Com Sucesso.', mtConfirmation, [mbOK], 0);

  

end;


procedure TfrmEmpresas.edIdEmpresaExit(Sender: TObject);                        //validações nos campos
begin

  if fEntradaValoresEmCampos(edIdEmpresa.Text, 5) then
     begin
       edIdEmpresa.SetFocus;
       exit;
     end;

  if fEntradaValoresEmCampos(edIdEmpresa.Text, 1) then
     begin
       edIdEmpresa.SetFocus;
       exit;
     end;

  if fEntradaValoresEmCampos(edIdEmpresa.Text, 2, edIdEmpresa.Text) then
     begin
     edIdEmpresa.SetFocus;
     exit;
     end;

  if strToInt(edIdEmpresa.Text) = 0 then
     begin
       MessageDlg('Não pode valor 0 no campo', mtWarning, [mbOK], 0);
       edIdEmpresa.SetFocus;
       Exit;
     end;

  dm.tbEmpresas.IndexFieldNames := 'bdIDEMPRESA';
  if dm.tbEmpresas.FindKey([edIdEmpresa.Text]) then
     begin
       cbUf.Style := csDropDown;
       cbUf.Text := cbUf.Items[DM.tbEmpresas.FieldByName('bdUF').AsInteger];    //fazendo o Cbox receber o seus proprios itens pelo index salvo na tabela

       edNomeFantasia.Text := DM.tbEmpresas.FieldByName('bdNOMEFANTASIA').AsString;
       edCnpj.Text := DM.tbEmpresas.FieldByName('bdCNPJ').AsString;
     end;

end;

procedure TfrmEmpresas.edNomeFantasiaExit(Sender: TObject);
begin
  if fEntradaValoresEmCampos(edNomeFantasia.Text, 0) then                       //não pode numero
     begin
       edNomeFantasia.SetFocus;
       exit;
     end;

  if fEntradaValoresEmCampos(edNomeFantasia.Text, 5) then                       //não pode campo vazio
     begin
       edNomeFantasia.SetFocus;
       exit;
     end;

  if fEntradaValoresEmCampos(edNomeFantasia.Text, 7) then                       //não pode espaço a esquerda nem campo só com espaço
     begin
       edNomeFantasia.SetFocus;
       exit;
     end;

  

end;

procedure TfrmEmpresas.edCnpjExit(Sender: TObject);

begin
  if Length(edCnpj.Text) < 14 then
     begin
       MessageDlg('Campo Incompleto', mtError, [mbOk], 0);
       edCnpj.SetFocus;
       exit;
     end;
end;

procedure TfrmEmpresas.cbUfKeyPress(Sender: TObject; var Key: Char);
begin
  if Length(cbUf.Text) = 2 then
     begin
       Key := #13;
     end
end;

procedure TfrmEmpresas.cbUfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Delete then
     abort;
end;

procedure TfrmEmpresas.cbUfKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Delete then
     abort;
end;

end.
