object dmSISVISA: TdmSISVISA
  OldCreateOrder = False
<<<<<<< .mine
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 268
  Width = 521
||||||| .r45
  Height = 268
  Width = 521
=======
  Height = 200
  Width = 246
>>>>>>> .r46
  object FD_ConnSISVISA: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=D:\SOFTWARES\SISVISA 2019\trunk\BD\SISVISA.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 168
    Top = 144
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 168
    Top = 24
  end
  object FDtrs_SVisa: TFDTransaction
    Connection = FD_ConnSISVISA
    Left = 64
    Top = 112
  end
  object FDqryCadastros: TFDQuery
    Connection = FD_ConnSISVISA
    Left = 168
    Top = 80
  end
end
