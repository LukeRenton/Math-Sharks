object dmMathSharks: TdmMathSharks
  OldCreateOrder = False
  Height = 281
  Width = 317
  object tblAnswers: TADOTable
    Active = True
    Connection = comMathSharks
    CursorType = ctStatic
    TableName = 'Answers'
    Left = 88
    Top = 176
  end
  object tblUsers: TADOTable
    Active = True
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
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=E:\Pa' +
      't gr12\MathCourse.mdb;Mode=Share Deny None;Persist Security Info' +
      '=False;Jet OLEDB:System database="";Jet OLEDB:Registry Path="";J' +
      'et OLEDB:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:' +
      'Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet ' +
      'OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password' +
      '="";Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Dat' +
      'abase=False;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLE' +
      'DB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
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
