object dmEntra21: TdmEntra21
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 250
  Width = 369
  object SQLConnection: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL'
    GetDriverFunc = 'getSQLDriverMYSQL'
    KeepConnection = False
    LibraryName = 'dbxmys.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver150.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=15.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver150.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=15.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'VendorLib=libmysql.dll'
      'MaxBlobSize=-1'
      'DriverName=MySQL'
      'HostName=localhost'
      'Database=automobilismo'
      'User_Name=delphi'
      'Password=senh@123'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'ConnectTimeout=60'
      
        'ConnectionString=DriverUnit=DBXMySQL,DriverPackageLoader=TDBXDyn' +
        'alinkDriverLoader,DbxCommonDriver150.bpl,DriverAssemblyLoader=Bo' +
        'rland.Data.TDBXDynalinkDriverLoader,Borland.Data.DbxCommonDriver' +
        ',Version=15.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1' +
        'b,MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQL' +
        'Driver150.bpl,MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaD' +
        'ataCommandFactory,Borland.Data.DbxMySQLDriver,Version=15.0.0.0,C' +
        'ulture=neutral,PublicKeyToken=91d62ebb5b0d1b1b,GetDriverFunc=get' +
        'SQLDriverMYSQL,LibraryName=dbxmys.dll,VendorLib=libmysql.dll,Max' +
        'BlobSize=-1,DriverName=MySQL,HostName=localhost,Database=estacio' +
        'namento,User_Name=delphi,Password=senh@123,BlobSize=-1,ErrorReso' +
        'urceFile=,LocaleCode=0000,Compressed=False,Encrypted=False,Conne' +
        'ctTimeout=60,ConnectionString=DriverUnit=DBXMySQL,DriverPackageL' +
        'oader=TDBXDynalinkDriverLoader,DbxCommonDriver150.bpl,DriverAsse' +
        'mblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borland.Data.Db' +
        'xCommonDriver,Version=15.0.0.0,Culture=neutral,PublicKeyToken=91' +
        'd62ebb5b0d1b1b,MetaDataPackageLoader=TDBXMySqlMetaDataCommandFac' +
        'tory,DbxMySQLDriver150.bpl,MetaDataAssemblyLoader=Borland.Data.T' +
        'DBXMySqlMetaDataCommandFactory,Borland.Data.DbxMySQLDriver,Versi' +
        'on=15.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b,GetD' +
        'riverFunc=getSQLDriverMYSQL,LibraryName=dbxmys.dll,VendorLib=lib' +
        'mysql.dll,MaxBlobSize=-1,DriverName=MySQL,HostName=localhost,Dat' +
        'abase=estacionamento,User_Name=delphi,Password=senh@123,BlobSize' +
        '=-1,ErrorResourceFile=,LocaleCode=0000,Compressed=False,Encrypte' +
        'd=False,ConnectTimeout=60,ConnectionString=DriverUnit=DBXMySQL,D' +
        'riverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver150.b' +
        'pl,DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Bo' +
        'rland.Data.DbxCommonDriver,Version=15.0.0.0,Culture=neutral,Publ' +
        'icKeyToken=91d62ebb5b0d1b1b,MetaDataPackageLoader=TDBXMySqlMetaD' +
        'ataCommandFactory,DbxMySQLDriver150.bpl,MetaDataAssemblyLoader=B' +
        'orland.Data.TDBXMySqlMetaDataCommandFactory,Borland.Data.DbxMySQ' +
        'LDriver,Version=15.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb' +
        '5b0d1b1b,GetDriverFunc=getSQLDriverMYSQL,LibraryName=dbxmys.dll,' +
        'VendorLib=libmysql.dll,MaxBlobSize=-1,DriverName=MySQL,HostName=' +
        'localhost,Database=estacionamento,User_Name=delphi,Password=senh' +
        '@123,BlobSize=-1,ErrorResourceFile=,LocaleCode=0000,Compressed=F' +
        'alse,Encrypted=False,ConnectTimeout=60'
      'ServerCharSet=utf8')
    VendorLib = 'libmysql.dll'
    Connected = True
    Left = 32
    Top = 24
  end
  object SQLSelect: TSQLDataSet
    GetMetadata = False
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 112
    Top = 24
  end
end
