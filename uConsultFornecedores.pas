unit uConsultFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, Menus;

type
  TfrmConsultFornecedores = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    Filtros1: TMenuItem;
    Abrir1: TMenuItem;
    Salvar1: TMenuItem;
    Filtros2: TMenuItem;
    FiltrosAvandos1: TMenuItem;
    grConsultaFornecedores: TDBGrid;
    procedure FiltrosAvandos1Click(Sender: TObject);
  private
    { Private declarations }
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

end.
