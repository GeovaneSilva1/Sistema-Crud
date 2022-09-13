object DM: TDM
  OldCreateOrder = False
  Left = 487
  Top = 195
  Height = 388
  Width = 505
  object tbEmpresas: TTable
    Left = 88
    Top = 112
  end
  object tbFornecedores: TTable
    Left = 176
    Top = 112
  end
  object dsEmpresas: TDataSource
    DataSet = tbEmpresas
    Left = 88
    Top = 160
  end
  object dsFornecedores: TDataSource
    DataSet = tbFornecedores
    Left = 176
    Top = 160
  end
  object QUERY: TQuery
    DatabaseName = 'C:\Users\qualvisual18\Documents\Portif'#243'lio\CRUD\'
    Filtered = True
    DataSource = dsFornecedores
    Left = 120
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'pNome'
        ParamType = ptInput
        Size = 50
      end>
  end
end
