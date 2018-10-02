object dmEntra21: TdmEntra21
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 97
  Width = 334
  object SQLConnection: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver250.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver250.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'MaxBlobSize=-1'
      'DriverName=MySQL'
      'HostName=localhost'
      'Database=emergencia'
      'User_Name=trabalhobanca'
      'Password=bet365'
      'ServerCharSet='
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'ConnectTimeout=60')
    Connected = True
    Left = 32
    Top = 24
  end
  object SQLSelect: TSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 104
    Top = 24
  end
  object SQLTableEndereco: TSQLTable
    ObjectView = True
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'cidadao'
    Left = 176
    Top = 24
    object SQLTableEnderecoendereco: TStringField
      FieldName = 'endereco'
      Required = True
      Size = 80
    end
  end
end
