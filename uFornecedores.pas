unit uFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, Buttons, Mask, Grids, DBGrids;

type
  TfrmFornecedores = class(TForm)
    Panel1: TPanel;
    gbCadastroFornecedores: TGroupBox;
    grFornecedores: TDBGrid;
    edIdFornecedores: TEdit;
    Label1: TLabel;
    edNomeFornecedores: TEdit;
    Label2: TLabel;
    cbEmpresa: TComboBox;
    Label3: TLabel;
    edRg: TEdit;
    edDtHora: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edCpf: TMaskEdit;
    edCnpjFornecedor: TMaskEdit;
    edTelefone: TMaskEdit;
    edDtNascimento: TMaskEdit;
    btSalvarFornecedores: TBitBtn;
    rgCnpjCpf: TRadioGroup;
    procedure btSalvarFornecedoresClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edIdFornecedoresExit(Sender: TObject);
    procedure edNomeFornecedoresExit(Sender: TObject);
    procedure cbEmpresaExit(Sender: TObject);
    procedure edRgExit(Sender: TObject);
    procedure edCpfExit(Sender: TObject);
    procedure edCnpjFornecedorExit(Sender: TObject);
    procedure edTelefoneExit(Sender: TObject);
    procedure edDtNascimentoExit(Sender: TObject);
    procedure rgCnpjCpfClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFornecedores: TfrmFornecedores;

implementation

uses uEmpresas, uPrincipal, uProcedimentosPadroes, uDM,
  uConsultFornecedores, uFiltro;

{$R *.dfm}

procedure TfrmFornecedores.btSalvarFornecedoresClick(Sender: TObject);
var
  wTextoCbForn: String;

  wdate: TDate;
begin
  //inicio da rotina para verificar se a empresa é do PR e se é menor de idade
  if rgCnpjCpf.ItemIndex = 1 then
     begin
       wTextoCbForn := cbEmpresa.Text;
       Dm.tbEmpresas.First;
       while not Dm.tbEmpresas.Eof do
         begin
           if wtextoCbForn = Dm.TbEmpresas.FieldByName('bdNOMEFANTASIA').AsString then
              begin
                if dm.tbEmpresas.FieldByName('bdUF').AsInteger = 14 then
                   begin
                     if strToInt(fVerificaIdade(edDtNascimento.Text, edDtHora.Text)) < 18 then
                        begin
                          MessageDlg('Não é possível fornecedores Menores de Idade Vinculados a empresas do PR.',
                                     mtWarning, [mbOK], 0);
                          cbEmpresa.SetFocus;
                          exit;
                        end;
                   end;
              end;
           Dm.tbEmpresas.Next;
         end;
     end;
  //Fim da rotina

  if fEntradaValoresEmCampos(edNomeFornecedores.Text, 5) then
    begin
      edNomeFornecedores.SetFocus;
      exit;
    end;

  if fEntradaValoresEmCampos(cbEmpresa.Text, 5) then
     begin
       cbEmpresa.SetFocus;
       exit;
     end;

  if rgCnpjCpf.ItemIndex = 1 then
     begin
       edDtNascimento.EditMask := '99/99/9999;1;_';

       if fEntradaValoresEmCampos(edRg.Text, 5) then
          begin
            edRg.SetFocus;
            exit;
          end;

       if fEntradaValoresEmCampos(edCpf.Text, 5) then
          begin
            edCpf.SetFocus;
            exit;
          end;

       if edDtNascimento.Text = '  /  /    ' then
          begin
            MessageDlg('Não é permitido Campos vazios', mtWarning, [mbOk], 0);
            edDtNascimento.SetFocus;
            exit;
          end;
     end;

  if rgCnpjCpf.ItemIndex = 0 then
     begin
       if fEntradaValoresEmCampos(edCnpjFornecedor.Text, 5) then
          begin
            edCnpjFornecedor.SetFocus;
            exit;
          end;

       edDtNascimento.EditMask := '99/99/9999;0;_';
     end;

  if fEntradaValoresEmCampos(edTelefone.Text, 5) then
     begin
       edTelefone.SetFocus;
       exit;
     end;



  DM.tbFornecedores.IndexFieldNames := 'bdIDFORNECEDORES';
  if DM.tbFornecedores.FindKey([edIdFornecedores.Text]) then
     DM.tbFornecedores.Edit
  else
     DM.tbFornecedores.Insert;

  DM.tbFornecedores.FieldByName('bdIDFORNECEDORES').AsInteger := StrToInt(edIdFornecedores.Text);

  DM.tbFornecedores.FieldByName('bdNOMEFORNECEDORES').AsString := fRemoveEspaco(edNomeFornecedores.Text);

  DM.tbFornecedores.FieldByName('bdEMPRESAS').AsString := cbEmpresa.Text;

  if Length(edCnpjFornecedor.Text) = 14 then
     begin
       DM.tbFornecedores.FieldByName('bdRG').AsString := 'null';
       DM.tbFornecedores.FieldByName('bdCPF').AsString := 'null';
       DM.tbFornecedores.FieldByName('bdDATANASCIMENTO').AsString := 'null';
       DM.tbFornecedores.FieldByName('bdCNPJFORNECEDORES').AsString := edCnpjFornecedor.Text;
     end
  else
     begin
       if Length(edCpf.Text) = 11 then
          begin
            DM.tbFornecedores.FieldByName('bdCNPJFORNECEDORES').AsString := 'null';
            DM.tbFornecedores.FieldByName('bdRG').AsString := edRg.Text;
            DM.tbFornecedores.FieldByName('bdCPF').AsString := edCpf.Text;
            DM.tbFornecedores.FieldByName('bdDATANASCIMENTO').AsString := edDtNascimento.Text;
          end;
     end;

  DM.tbFornecedores.FieldByName('bdTELEFONE').AsString := edTelefone.Text;

  edDtHora.Text := DateTimeToStr(Now);
  DM.tbFornecedores.FieldByName('bdDATAHORACAD').AsString := edDtHora.Text;

  DM.tbFornecedores.FieldByName('bdDATACAD').AsDateTime := strToDate(copy(edDtHora.Text,1, 10));

  DM.tbFornecedores.Post;
  MessageDlg('Salvo Com Sucesso', mtInformation, [mbOK], 0);

end;

procedure TfrmFornecedores.FormShow(Sender: TObject);
begin
  edDtHora.Text := DateTimeToStr(Now);

  edCpf.Enabled := False;
  edRg.Enabled := False;
  edDtNascimento.Enabled := False;
  Label5.Enabled := False;
  Label4.Enabled := False;
  Label8.Enabled := False;
end;

procedure TfrmFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cbEmpresa.Items.Clear;
end;

procedure TfrmFornecedores.edIdFornecedoresExit(Sender: TObject);
var
  wI: integer;
begin
  if fEntradaValoresEmCampos(edIdFornecedores.Text, 5) then
     begin
       edIdFornecedores.SetFocus;
       exit;
     end;

  if fEntradaValoresEmCampos(edIdFornecedores.Text, 1) then
     begin
       edIdFornecedores.SetFocus;
       exit;
     end;

  if fEntradaValoresEmCampos(edIdFornecedores.Text, 2, edIdFornecedores.Text) then
     begin
       edIdFornecedores.SetFocus;
       exit;
     end;

  if strToInt(edIdFornecedores.Text) = 0 then
     begin
       MessageDlg('Não pode valor 0 no campo', mtWarning, [mbOK], 0);
       edIdFornecedores.SetFocus;
       Exit;
     end;

end;

procedure TfrmFornecedores.edNomeFornecedoresExit(Sender: TObject);
begin
  if fEntradaValoresEmCampos(edNomeFornecedores.Text, 0) then                       //não pode numero
     begin
       edNomeFornecedores.SetFocus;
       exit;
     end;

  if fEntradaValoresEmCampos(edNomeFornecedores.Text, 5) then                       //não pode campo vazio
     begin
       edNomeFornecedores.SetFocus;
       exit;
     end;

  if fEntradaValoresEmCampos(edNomeFornecedores.TExt, 7) then
     begin
       edNomeFornecedores.SetFocus;
       exit;
     end;

end;

procedure TfrmFornecedores.cbEmpresaExit(Sender: TObject);
begin
  if fEntradaValoresEmCampos(cbEmpresa.Text, 5) then
     begin
       cbEmpresa.SetFocus;
       exit;
     end;
end;

procedure TfrmFornecedores.edRgExit(Sender: TObject);
begin
  if rgCnpjCpf.ItemIndex = 1 then
     begin
       if fEntradaValoresEmCampos(edRg.Text, 1) then
          begin
            edRg.SetFocus;
            exit;
          end
       else if fEntradaValoresEmCampos(edRg.Text, 3, edRg.Text) then
          begin
            edRg.SetFocus;
            exit;
          end
       else if fEntradaValoresEmCampos(edRg.Text, 5) then
          begin
            edRg.SetFocus;
            exit;
          end;
     end;

end;

procedure TfrmFornecedores.edCpfExit(Sender: TObject);
begin
  if rgCnpjCpf.ItemIndex = 1 then
     begin
       if Length(edCpf.Text) < 11 then
          begin
            MessageDlg('Campo Incompleto', mtWarning, [mbOk], 0);
            edCpf.SetFocus;
            exit;
          end;
     end;

end;

procedure TfrmFornecedores.edCnpjFornecedorExit(Sender: TObject);
begin
  if rgCnpjCpf.ItemIndex = 0 then
     begin
       if Length(edCnpjFornecedor.Text) < 14 then
          begin
            MessageDlg('Campo Incompleto', mtWarning, [mbOk], 0);
            edCnpjFornecedor.SetFocus;
            exit;
          end;
     end;

end;

procedure TfrmFornecedores.edTelefoneExit(Sender: TObject);
begin
  if Length(edTelefone.Text) < 11 then
     begin
       MessageDlg('Campo Incompleto', mtWarning, [mbOk], 0);
       edTelefone.SetFocus;
       exit;
     end;
end;

procedure TfrmFornecedores.edDtNascimentoExit(Sender: TObject);
var
  wMesNascimento,
  wDiaNascimento: String;
begin
  if rgCnpjCpf.ItemIndex = 1 then
     begin
       edDtNascimento.EditMask := '99/99/9999;1;_';

       if edDtNascimento.Text = '  /  /    ' then
          begin
            MessageDlg('Não é permitido Campos vazios', mtWarning, [mbOk], 0);
            edDtNascimento.SetFocus;
            exit;
          end;

       if fEntradaValoresEmCampos(edDtNascimento.Text, 6) then
          begin
            edDtNascimento.SetFocus;
            exit;
          end;

       if (strToInt(fVerificaIdade(edDtNascimento.Text, edDtHora.Text)) = 0)   or
          (strToInt(fVerificaIdade(edDtNascimento.Text, edDtHora.Text)) > 120) then
          begin
            MessageDlg('Data Inválida', mtWarning, [mbOk], 0);
            edDtNascimento.SetFocus;
            exit;
          end;

       wMesNascimento := Copy(edDtNascimento.Text, 4, 2);
       wDiaNascimento := Copy(edDtNascimento.Text, 1, 2);

       if (strToInt(wMesNascimento) = 0) or (strToInt(wMesNascimento) > 12) then
          begin
            MessageDlg('Data Inválida', mtWarning, [mbOK], 0);
            edDtNascimento.SetFocus;
            exit;
          end;

       if (StrToInt(wDiaNascimento) = 0) or (StrToInt(wDiaNascimento) > 31) then
          begin
            MessageDlg('Data Inválida', mtWarning, [mbOK], 0);
            edDtNascimento.SetFocus;
            exit;
          end;

     end;
end;

procedure TfrmFornecedores.rgCnpjCpfClick(Sender: TObject);
begin
  if rgCnpjCpf.ItemIndex = 0 then
     begin
       edCpf.Enabled := False;
       edRg.Enabled := False;
       edDtNascimento.Enabled := False;
       Label5.Enabled := False;
       Label4.Enabled := False;
       Label8.Enabled := False;

       edCpf.Clear;
       edRg.Clear;
       edDtNascimento.Clear;

       edCnpjFornecedor.Enabled := True;
       Label6.Enabled := True;
     end
  else
     begin
       edCpf.Enabled := True;
       edRg.Enabled := True;
       edDtNascimento.Enabled := True;

       Label5.Enabled := True;
       Label4.Enabled := True;
       Label8.Enabled := True;

       edCnpjFornecedor.Enabled := False;
       Label6.Enabled := False;

       edCnpjFornecedor.Clear;

     end;
end;

procedure TfrmFornecedores.FormActivate(Sender: TObject);
begin
  cbEmpresa.Items.Clear;

  DM.tbEmpresas.First;
  while not DM.tbEmpresas.Eof do
    begin
      cbEmpresa.Items.Add(DM.tbEmpresas.FieldByName('bdNOMEFANTASIA').AsString);
      DM.tbEmpresas.Next;
    end;

end;

end.
