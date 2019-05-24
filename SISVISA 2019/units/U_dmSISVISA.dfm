object dmSISVISA: TdmSISVISA
  OldCreateOrder = False
  Height = 336
  Width = 330
  object FD_ConnSISVISA: TFDConnection
    Params.Strings = (
      'Database=D:\SOFTWARES\SISVISA 2019\BD\SISVISA.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Left = 96
    Top = 8
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 96
    Top = 144
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 112
    Top = 80
  end
  object FDtrs_SVisa: TFDTransaction
    Connection = FD_ConnSISVISA
    Left = 88
    Top = 208
  end
  object FDqryCadastros: TFDQuery
    Connection = FD_ConnSISVISA
    Left = 152
    Top = 264
  end
end
