object dmMathSharks: TdmMathSharks
  OldCreateOrder = False
  Height = 281
  Width = 317
  object tblAnswers: TADOTable
    Connection = comMathSharks
    CursorType = ctStatic
    TableName = 'Answers'
    Left = 88
    Top = 176
  end
  object tblUsers: TADOTable
    Connection = comMathSharks
    CursorType = ctStatic
    TableName = 'Users'
    Left = 144
    Top = 176
  end
  object dsAnswers: TDataSource
    DataSet = tblAnswers
    Left = 88
    Top = 112
  end
  object dsUsers: TDataSource
    DataSet = tblUsers
    Left = 152
    Top = 112
  end
  object comMathSharks: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Mode=Share Deny N' +
      'one;Persist Security Info=False;Jet OLEDB:System database="";Jet' +
      ' OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB' +
      ':Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Globa' +
      'l Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OL' +
      'EDB:New Database Password="";Jet OLEDB:Create System Database=Fa' +
      'lse;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale' +
      ' on Compact=False;Jet OLEDB:Compact Without Replica Repair=False' +
      ';Jet OLEDB:SFP=False;'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 152
    Top = 56
  end
  object qryShow: TADOQuery
    Connection = comMathSharks
    Parameters = <>
    Left = 208
    Top = 176
  end
  object dsSHow: TDataSource
    DataSet = qryShow
    Left = 216
    Top = 112
  end
end
