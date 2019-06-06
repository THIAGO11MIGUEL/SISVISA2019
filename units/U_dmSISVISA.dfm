object dmSISVISA: TdmSISVISA
  OldCreateOrder = False
  Height = 336
  Width = 521
  object FD_ConnSISVISA: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\SISVISA 2019\trunk\BD\SISVISA.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
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
end
