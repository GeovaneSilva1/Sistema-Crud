object frmEmpresas: TfrmEmpresas
  Left = 361
  Top = 177
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Empresas'
  ClientHeight = 407
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnEmpresas: TPanel
    Left = 0
    Top = 0
    Width = 695
    Height = 407
    Align = alClient
    TabOrder = 0
    object gbEmpresas: TGroupBox
      Left = 11
      Top = 2
      Width = 271
      Height = 399
      TabOrder = 0
      object Label1: TLabel
        Left = 84
        Top = 50
        Width = 13
        Height = 17
        Caption = 'Uf'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 86
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
      object Label3: TLabel
        Left = 10
        Top = 82
        Width = 87
        Height = 17
        Caption = 'Nome Fantasia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 71
        Top = 114
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
      object edIdEmpresa: TEdit
        Left = 100
        Top = 16
        Width = 41
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '1'
        OnExit = edIdEmpresaExit
      end
      object cbUf: TComboBox
        Left = 100
        Top = 49
        Width = 77
        Height = 19
        Style = csOwnerDrawFixed
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = 'AC'
        OnKeyPress = cbUfKeyPress
        Items.Strings = (
          'AC'
          'AL'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MT'
          'MS'
          'MG'
          'PA'
          'PB'
          'PR'
          'PE'
          'PI'
          'RJ'
          'RN'
          'RS'
          'RO'
          'RR'
          'SC'
          'SP'
          'SE'
          'TO')
      end
      object edNomeFantasia: TEdit
        Left = 100
        Top = 80
        Width = 161
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnExit = edNomeFantasiaExit
      end
      object btSalvarEmpresas: TBitBtn
        Left = 98
        Top = 368
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 4
        OnClick = btSalvarEmpresasClick
      end
      object edCnpj: TMaskEdit
        Left = 100
        Top = 112
        Width = 114
        Height = 21
        EditMask = '99.999.999/9999-99;0;_'
        MaxLength = 18
        TabOrder = 3
        OnExit = edCnpjExit
      end
    end
    object grEmpresas: TDBGrid
      Left = 289
      Top = 6
      Width = 401
      Height = 395
      DataSource = DM.dsEmpresas
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
          FieldName = 'bdIDEMPRESA'
          Title.Caption = 'ID'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdNOMEFANTASIA'
          Title.Caption = 'NOME FANTASIA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 189
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bdCNPJ'
          Title.Caption = 'CNPJ'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 116
          Visible = True
        end>
    end
  end
end
