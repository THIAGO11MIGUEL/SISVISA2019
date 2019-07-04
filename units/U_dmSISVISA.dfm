object dmSISVISA: TdmSISVISA
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 242
  Width = 521
  object FD_ConnSISVISA: TFDConnection
    Params.Strings = (
      'Database=D:\SOFTWARES\SISVISA 2019\trunk\BD\SISVISA.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 344
    Top = 144
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 344
    Top = 24
  end
  object FDtrs_SVisa: TFDTransaction
    Connection = FD_ConnSISVISA
    Left = 56
    Top = 72
  end
  object FDqryCadastros: TFDQuery
    Connection = FD_ConnSISVISA
    Left = 344
    Top = 80
  end
  object dsCadastros: TDataSource
    DataSet = cdsCadastros
    Left = 208
    Top = 40
  end
  object dspCadastros: TDataSetProvider
    DataSet = FDqryCadastros
    Left = 224
    Top = 112
  end
  object cdsCadastros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadastros'
    Left = 168
    Top = 88
  end
end
