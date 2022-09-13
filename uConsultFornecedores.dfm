object frmConsultFornecedores: TfrmConsultFornecedores
  Left = 254
  Top = 59
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Fornecedores'
  ClientHeight = 552
  ClientWidth = 1015
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1015
    Height = 552
    Align = alClient
    TabOrder = 0
    object grConsultaFornecedores: TDBGrid
      Left = 1
      Top = 1
      Width = 1013
      Height = 550
      Align = alClient
      DataSource = DM.dsFornecedores
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'bdIDFORNECEDORES'
          Title.Caption = 'Id'
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdNOMEFORNECEDORES'
          Title.Caption = 'Nome Fornecedores'
          Width = 181
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdEMPRESAS'
          Title.Caption = 'Nome Empresas'
          Width = 189
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdRG'
          Title.Caption = 'Rg'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdCPF'
          Title.Caption = 'Cpf'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdCNPJFORNECEDORES'
          Title.Caption = 'Cnpj'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdTELEFONE'
          Title.Caption = 'Telefone'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdDATANASCIMENTO'
          Title.Caption = 'Data de Nascimento'
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdDATAHORACAD'
          Title.Caption = 'Data/Hora de Cadastro'
          Width = 119
          Visible = True
        end>
    end
  end
  object MainMenu1: TMainMenu
    Left = 704
    Top = 392
    object Filtros1: TMenuItem
      Caption = 'Arquivo'
      object Abrir1: TMenuItem
        Caption = 'Abrir'
      end
      object Salvar1: TMenuItem
        Caption = 'Salvar'
      end
    end
    object Filtros2: TMenuItem
      Caption = 'Filtros'
      object FiltrosAvandos1: TMenuItem
        Caption = 'Filtros Avan'#231'ados'
        OnClick = FiltrosAvandos1Click
      end
    end
  end
end
