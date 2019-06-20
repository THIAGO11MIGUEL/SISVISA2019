object dmSISVISA: TdmSISVISA
  OldCreateOrder = False
  Height = 268
  Width = 521
  object FD_ConnSISVISA: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\SISVISA 2019\trunk\BD\SISVISA.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 408
    Top = 192
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 408
    Top = 72
  end
  object FDtrs_SVisa: TFDTransaction
    Connection = FD_ConnSISVISA
    Left = 56
    Top = 72
  end
  object FDqryCadastros: TFDQuery
    Connection = FD_ConnSISVISA
    Left = 408
    Top = 128
  end
end
