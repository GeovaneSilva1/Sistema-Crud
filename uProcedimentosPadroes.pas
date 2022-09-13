unit uProcedimentosPadroes;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, Buttons, DB, DBClient, DBTables;

function fEntradaValoresEmCampos(prTextoEdit: String; prTipoFiltro: Integer;
                                 prTamCampo: string = '0'): Boolean;

function fRemoveEspaco(const prStr: String): string;

function fVerificaIdade(prDtNascimento: string; prDtHora: String): string;

procedure pCriaTabelaEmpresa;

procedure pCriaTabelaFornecedores;

procedure pCriaQuery;

var
  wSlSalvaBancoEmpresas: TStringList;

implementation


uses uPrincipal, uConsultFornecedores, uEmpresas, uFornecedores, uDM,
  DateUtils;

function fEntradaValoresEmCampos(prTextoEdit: String; prTipoFiltro: Integer;    //1º fUNÇÃO
                                 prTamCampo: string = '0'): Boolean;

var
  wI,
  wTextoCheio,
  wTextoCortado: Integer;
begin
  Result := False;
  wTextoCheio := Length(prTextoEdit);
  wTextoCortado := Length(TrimLeft(prTextoEdit));
  case prTipoFiltro of
    0: for wI := 1 to length(prTextoEdit) do
         begin
           if ((prTextoEdit[wI] >= '0') and (prTextoEdit[wI] <= '9')) then      //só letras
              begin
                Result := True;
                MessageDlg('Valor Inválido para esse campo.', mtWarning, [mbOK], 0);
                exit;
              end
           else
              Result := False;
         end;

    1: for wI := 1 to Length(prTextoEdit) do                                    //só número
         begin
           if not (prTextoEdit[wI] in ['0'..'9']) then
              begin
                Result := True;
                MessageDlg('Valor Inválido para esse Campo', mtWarning, [mbOK], 0);
                Exit;
              end
           else
              Result := False;
         end;

    2: if Length(prTamCampo) > 3 then                                           //campo aceita apenas 3 digitos.
          begin
             Result := True;
             MessageDlg('É permitido apenas 3 caracteres nesse Campo', mtWarning, [mbOK], 0);
             exit;
          end;

    3: if Length(prTamCampo) > 11 then                                           //campo aceita apenas 11 caracter.
          begin
            Result := True;
            MessageDlg('É permitido no máximo 11 caracteres nesse Campo', mtWarning, [mbOK], 0);
            exit;
          end
       else
          Result := False;

    4: if prTextoEdit = 'Nenhum' then                                           //solução para Cbox
          begin
            Result := True;
            MessageDlg('Escolha Inválida', mtWarning, [mbOK], 0);
            exit;
          end
       else
          Result := False;

    5: if prTextoEdit = '' then                                                 //se o campo for vazio
          begin
            Result := True;
            MessageDlg('Não é permitido Campos Vazios', mtWarning, [mbOK], 0);
            exit;
          end;

    6: for wI := 0 to Length(prTextoEdit) do                                    //Não pode nenhum espaços
         begin
           if (prTextoEdit[wI] in [' ']) then
              begin
                Result := True;
                MessageDlg('Campo Incompleto', mtWarning, [mbOK], 0);
                exit;
              end;
         end;

    7: if wTextoCheio <> wTextoCortado then                                     //não pode somente espaço no campo nem a esquerda
          begin
            Result := True;
            MessageDlg('Não são permitidos espaços sobressalentes', mtWarning, [mbOK], 0);
            exit;
          end;


  end;

end;

function fRemoveEspaco(const prStr: String): string;                            // 2º FUNÇÃO
const
  cDouble = '  ';
  cOne = ' ';
begin
  result := prStr;
   while pos(cDouble,result) > 0 do
      result := StringReplace(result, cDouble, cOne,[rfReplaceAll]);

end;

function fVerificaIdade(prDtNascimento: string; prDtHora: String): string;      // 3º FUNÇÃO
var
  wAnoAtual,
  wMesAtual,
  wDiaAtual,
  wAnoNascimento,
  wMesNascimento,
  wDiaNascimento: String;

  wIdade: Integer;
begin
  wDiaNascimento := Copy(prDtNascimento, 1, 2);  //prDataNascimento(string)
  wMesNascimento := Copy(prDtNascimento, 4, 2);
  wAnoNascimento := Copy(prDtNascimento, 7, 4);

  wDiaAtual := Copy(prDtHora, 1, 2); //prDataAtual(string)
  wMesAtual := Copy(prDtHora, 4, 2);
  wAnoAtual := Copy(prDtHora, 7, 4);

  wIdade := 0;

  if strToInt(wAnoNascimento) < strToInt(wAnoAtual) then
     begin
       wIdade := strToInt(wAnoAtual) - strToInt(wAnoNascimento); //27
       if strToInt(wMesNascimento) >= strToInt(wMesAtual) then
          begin
            if wMesNascimento > wMesAtual then
               Dec(wIdade)                      //26
            else if strToInt(wDiaNascimento) > strToInt(wDiaAtual) then
               Dec(wIdade)
            else
               wIdade := wIdade;
          end;
     end;

  Result := IntToStr(wIdade);


end;

procedure pCriaTabelaEmpresa;                                                   //tabelaEmpresa
begin
  if FileExists('C:\Users\qualvisual18\Documents\Portifólio\CRUD\bd\tbEmpresas.db') And (DM.tbEmpresas.Active) then
     exit;

  DM.tbEmpresas.Active := False;
  DM.tbEmpresas.Close;

  DM.tbEmpresas.DatabaseName := 'C:\Users\qualvisual18\Documents\Portifólio\CRUD\bd\';
  DM.tbEmpresas.TableName := 'tbEmpresas.db';
  DM.tbEmpresas.TableType := ttParadox;

  with DM.tbEmpresas.FieldDefs do
    begin
      Clear;
      Add('bdIDEMPRESA',    ftInteger, 0, False);
      Add('bdUF',           ftInteger, 0, False);
      Add('bdNOMEFANTASIA', ftString, 50, False);
      Add('bdCNPJ',         ftstring, 14, False);
    end;

  DM.tbEmpresas.IndexDefs.Add('iIDEMPRESA', 'bdIDEMPRESA', [ixPrimary, ixUnique]);

  if not DM.tbEmpresas.Exists then
     dm.tbEmpresas.CreateTable;

  DM.tbEmpresas.Active := True;
  DM.tbEmpresas.Open;

end;

procedure pCriaTabelaFornecedores;                                              //tabelaFornecedores
begin
  if FileExists('C:\Users\qualvisual18\Documents\Portifólio\CRUD\bd\tbFornecedores.db') and (dm.tbFornecedores.Active) then
     exit;

  DM.tbFornecedores.Active := False;
  DM.tbFornecedores.Close;

  DM.tbFornecedores.DatabaseName := 'C:\Users\qualvisual18\Documents\Portifólio\CRUD\bd\';
  DM.tbFornecedores.TableName := 'tbFornecedores.db';
  DM.tbFornecedores.TableType := ttParadox;

  with DM.tbFornecedores.FieldDefs do
    begin
      Add('bdIDFORNECEDORES',   ftInteger,   0, False);
      Add('bdEMPRESAS',         ftString,   50, False);
      Add('bdNOMEFORNECEDORES', ftString,   50, False);
      Add('bdRG',               ftString,   11, False);
      Add('bdCPF',              ftString,   11, False);
      Add('bdCNPJFORNECEDORES', ftString,   14, False);
      Add('bdTELEFONE',         ftString,   11, False);
      Add('bdDATANASCIMENTO',   ftString,   10, False); //salva literal
      Add('bdDATAHORACAD',      ftString,   20, False); //salva literal
      Add('bdDATACAD',          ftString,   20, False); //salva literal
    end;

  DM.tbFornecedores.IndexDefs.Add('iIDFORNECEDORES','bdIDFORNECEDORES', [ixPrimary, ixUnique]);

  if not DM.tbFornecedores.Exists then
     DM.tbFornecedores.CreateTable;

  DM.tbFornecedores.Active := True;
  DM.tbFornecedores.Open;

end;

procedure pCriaQuery;
begin

end;

end.
