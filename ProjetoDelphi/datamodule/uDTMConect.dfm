object dtmPrincipal: TdtmPrincipal
  Height = 145
  Width = 204
  object ConectDB: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=True')
    TransactIsolationLevel = tiReadCommitted
    SQLHourGlass = True
    HostName = '.\SERVERCURSO'
    Port = 0
    Database = 'vendas'
    User = 'sa'
    Password = '2004'
    Protocol = 'mssql'
    LibraryLocation = 'C:\ProjetoDelphi\ntwdblib.dll'
    Left = 48
    Top = 48
  end
end
