unit uConsultFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, Menus, StdCtrls;

type
  TfrmConsultFornecedores = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    Filtros1: TMenuItem;
    Abrir1: TMenuItem;
    mnSalvar: TMenuItem;
    Filtros2: TMenuItem;
    FiltrosAvandos1: TMenuItem;
    grConsultaFornecedores: TDBGrid;
    sdSalvaArquivotxt: TSaveDialog;
    odAbreArquivo: TOpenDialog;
    procedure FiltrosAvandos1Click(Sender: TObject);
    procedure mnSalvarClick(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
  private
    { Private declarations }
    wSLSalvaDadosTxt,
    wSLRecebeDadosTxt: TStringList;

  public
    { Public declarations }
  end;

var
  frmConsultFornecedores: TfrmConsultFornecedores;

implementation

uses uDM, uEmpresas, uFornecedores, uPrincipal, uProcedimentosPadroes,
  uFiltro;

{$R *.dfm}

procedure TfrmConsultFornecedores.FiltrosAvandos1Click(Sender: TObject);
var
  wFiltro: TfrmFiltro;
begin
  wFiltro := TfrmFiltro.Create(Self);
  wFiltro.Show;
end;

procedure TfrmConsultFornecedores.mnSalvarClick(Sender: TObject);
var
  wRecebeCaminho: String;
begin //inicio da Exportação
  wRecebeCaminho := '';

  sdSalvaArquivotxt.DefaultExt    := 'txt';
  sdSalvaArquivotxt.Filter        := 'Arquivo de Texto'+'*.txt';

  if sdSalvaArquivotxt.Execute then
     wRecebeCaminho := sdSalvaArquivotxt.FileName;                              //recebendo o diretório

  if wRecebeCaminho = '' then
     begin
       MessageDlg('Nenhum Diretório foi selecionado', mtWarning, [mbOK], 0);
       exit;
     end;


  wSLSalvaDadosTxt := TStringList.Create;

  DM.tbFornecedores.First;
  Dm.tbFornecedores.IndexFieldNames := 'bdIDFORNECEDORES';
  while not DM.tbFornecedores.Eof do
    begin
      wSLSalvaDadosTxt.Add( IntToStr(DM.tbFornecedores.fieldByName('bdIDFORNECEDORES').AsInteger) + ',' +
                                     DM.tbFornecedores.fieldByname('bdEMPRESAS').AsString         + ',' +
                                     DM.tbFornecedores.fieldByname('bdNOMEFORNECEDORES').AsString + ',' +
                                     DM.tbFornecedores.fieldByname('bdRG').AsString               + ',' +
                                     DM.tbFornecedores.fieldByname('bdCPF').AsString              + ',' +
                                     DM.tbFornecedores.fieldByname('bdCNPJFORNECEDORES').AsString + ',' +
                                     DM.tbFornecedores.fieldByname('bdTELEFONE').AsString         + ',' +
                                     DM.tbFornecedores.fieldByname('bdDATANASCIMENTO').AsString   + ',' +
                                     DM.tbFornecedores.fieldByname('bdDATAHORACAD').AsString);
      DM.tbFornecedores.Next;
    end;

  wSLSalvaDadosTxt.SaveToFile(wRecebeCaminho);

  if wRecebeCaminho <> '' then
     MessageDlg('Arquivo Salvo Com Sucesso!', mtInformation, [mbOK], 0);

end;

procedure TfrmConsultFornecedores.Abrir1Click(Sender: TObject);
var
  wRecebeCaminhoimport,
  wTexto: String;

  wI: integer;
begin  //inicio da Importação
  wTexto := '';
  wRecebeCaminhoimport := '';

  sdSalvaArquivotxt.DefaultExt    := 'txt';
  sdSalvaArquivotxt.Filter        := 'Arquivo de Texto'+'*.txt';

  if odAbreArquivo.Execute then
     wRecebeCaminhoimport := odAbreArquivo.FileName;

  if wRecebeCaminhoimport = '' then
     begin
       MessageDlg('Nenhum Arquivo foi importado', mtWarning, [mbOk], 0);
       exit;
     end;

  wSLRecebeDadosTxt := TStringList.Create;
  wSLRecebeDadosTxt.LoadFromFile(wRecebeCaminhoimport);

  DM.tbFornecedores.IndexFieldNames := 'bdIDFORNECEDORES';
  for wI := 0 to wSLRecebeDadosTxt.count-1 do
    begin
      wTexto := wSLRecebeDadosTxt[wI];
      if DM.tbFornecedores.FindKey([copy(wTexto, 1, pos(',', wTexto)-1)]) then
         DM.tbFornecedores.Edit
      else
         DM.tbFornecedores.Insert;

      DM.tbFornecedores.FieldByName('bdIDFORNECEDORES').AsInteger := strToInt(copy(wTexto, 1, pos(',', wTexto)-1));
      Delete(wTexto, 1, pos(',', wTexto));
      DM.tbFornecedores.FieldByName('bdEMPRESAS').AsString := copy(wTexto, 1, pos(',', wTexto)-1);
      Delete(wTexto, 1, pos(',', wTexto));
      DM.tbFornecedores.FieldByName('bdNOMEFORNECEDORES').AsString := copy(wTexto, 1, pos(',', wTexto)-1);
      Delete(wTexto, 1, pos(',', wTexto));
      DM.tbFornecedores.FieldByName('bdRG').AsString := Copy(wTexto, 1, pos(',', wTexto)-1);
      Delete(wTexto, 1, pos(',', wTexto));
      DM.tbFornecedores.FieldByName('bdCPF').AsString := Copy(wTexto, 1, pos(',', wtexto)-1);
      Delete(wTexto, 1, pos(',', wTexto));
      DM.tbFornecedores.FieldByName('bdCNPJFORNECEDORES').AsString := copy(wtexto, 1, pos(',', wTexto)-1);
      Delete(wTexto, 1, pos(',', wTexto));
      Dm.tbFornecedores.FieldByName('bdTELEFONE').AsString := Copy(wTexto, 1, pos(',', wTexto)-1);
      Delete(wTexto, 1, pos(',', wTexto));
      Dm.tbFornecedores.FieldByName('bdDATANASCIMENTO').AsString := Copy(wTexto, 1, pos(',', wTexto)-1);
      Delete(wTexto, 1, pos(',', wTexto));
      Dm.tbFornecedores.FieldByName('bdDATAHORACAD').AsString := wTexto;

      DM.tbFornecedores.Post;

    end;
  if wRecebeCaminhoimport <> '' then
     MessageDlg('Arquivo Carregado com sucesso!', mtInformation, [mbOK], 0);

end;

end.
