object frmFornecedores: TfrmFornecedores
  Left = 328
  Top = 190
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Fornecedores'
  ClientHeight = 406
  ClientWidth = 833
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 833
    Height = 406
    Align = alClient
    TabOrder = 0
    object gbCadastroFornecedores: TGroupBox
      Left = 8
      Top = 0
      Width = 313
      Height = 401
      TabOrder = 0
      object Label1: TLabel
        Left = 120
        Top = 18
        Width = 11
        Height = 17
        Caption = 'Id'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 95
        Top = 47
        Width = 36
        Height = 17
        Caption = 'Nome'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 80
        Top = 76
        Width = 51
        Height = 17
        Caption = 'Empresa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 115
        Top = 244
        Width = 16
        Height = 17
        Caption = 'Rg'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 111
        Top = 213
        Width = 20
        Height = 17
        Caption = 'Cpf'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 105
        Top = 153
        Width = 26
        Height = 17
        Caption = 'Cnpj'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 82
        Top = 183
        Width = 49
        Height = 17
        Caption = 'Telefone'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 12
        Top = 273
        Width = 119
        Height = 17
        Caption = 'Data de Nascimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 118
        Top = 378
        Width = 61
        Height = 17
        Caption = 'Data/Hora'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edIdFornecedores: TEdit
        Left = 133
        Top = 16
        Width = 41
        Height = 21
        TabOrder = 0
        Text = '1'
        OnExit = edIdFornecedoresExit
      end
      object edNomeFornecedores: TEdit
        Left = 133
        Top = 45
        Width = 169
        Height = 21
        TabOrder = 1
        OnExit = edNomeFornecedoresExit
      end
      object cbEmpresa: TComboBox
        Left = 133
        Top = 74
        Width = 169
        Height = 19
        Style = csOwnerDrawFixed
        ItemHeight = 13
        TabOrder = 2
        OnExit = cbEmpresaExit
      end
      object edRg: TEdit
        Left = 133
        Top = 242
        Width = 97
        Height = 21
        TabOrder = 3
        OnExit = edRgExit
      end
      object edDtHora: TEdit
        Left = 181
        Top = 376
        Width = 121
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 4
      end
      object edCpf: TMaskEdit
        Left = 134
        Top = 211
        Width = 120
        Height = 21
        EditMask = '999.999.999-99;0;_'
        MaxLength = 14
        TabOrder = 5
        OnExit = edCpfExit
      end
      object edCnpjFornecedor: TMaskEdit
        Left = 134
        Top = 151
        Width = 120
        Height = 21
        EditMask = '99.999.999/9999-99;0;_'
        MaxLength = 18
        TabOrder = 6
        OnExit = edCnpjFornecedorExit
      end
      object edTelefone: TMaskEdit
        Left = 134
        Top = 181
        Width = 115
        Height = 21
        EditMask = '(99)99999-9999;0;_'
        MaxLength = 14
        TabOrder = 7
        OnExit = edTelefoneExit
      end
      object edDtNascimento: TMaskEdit
        Left = 134
        Top = 271
        Width = 119
        Height = 21
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 8
        Text = '  /  /    '
        OnExit = edDtNascimentoExit
      end
      object btSalvarFornecedores: TBitBtn
        Left = 119
        Top = 341
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 9
        OnClick = btSalvarFornecedoresClick
      end
      object rgCnpjCpf: TRadioGroup
        Left = 72
        Top = 99
        Width = 177
        Height = 41
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'CNPJ'
          'CPF')
        TabOrder = 10
        OnClick = rgCnpjCpfClick
      end
    end
    object grFornecedores: TDBGrid
      Left = 328
      Top = 5
      Width = 497
      Height = 396
      DataSource = DM.dsFornecedores
      ReadOnly = True
      TabOrder = 1
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
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 23
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdNOMEFORNECEDORES'
          Title.Caption = 'Nome'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 123
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdEMPRESAS'
          Title.Caption = 'Empresas'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdDATANASCIMENTO'
          Title.Caption = 'Data Nascimento'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdDATAHORACAD'
          Title.Caption = 'Data/Hora'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 110
          Visible = True
        end>
    end
  end
end
