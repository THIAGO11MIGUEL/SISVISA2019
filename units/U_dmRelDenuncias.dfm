object dmRelDenuncias: TdmRelDenuncias
  OldCreateOrder = False
  Height = 276
  Width = 307
  object frxRelDenuncias: TfrxReport
    Version = '2.6.14'
    DotMatrixReport = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFullScreen, pbOutline, pbThumbnails, pbPageSetup, pbEdit, pbNavigator, pbClose]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43635.639389236100000000
    ReportOptions.LastChange = 43635.639389236100000000
    ReportOptions.IsFMXReport = True
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 56
    Top = 16
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxdsRelDenuncias
        DataSetName = 'frxdsRelDenuncias'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 41.574830000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Align = baClient
          Width = 718.110700000000000000
          Height = 41.574830000000000000
          ShowHint = False
          Font.Name = 'Arial'
          Font.PixelsPerInch = 96.000000000000000000
          Font.Style = [fsBold]
          Font.Color = claBlack
          Font.Height = -26.666666030883790000
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DE DEN'#218'NCIAS')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 68.031540000000010000
        Top = 79.370130000000000000
        Width = 718.110700000000000000
        object SysMemo2: TfrxSysMemoView
          Align = baBottom
          Top = 52.913420000000010000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Name = 'Arial'
          Font.PixelsPerInch = 96.000000000000000000
          Font.Style = [fsBold]
          Font.Color = claBlack
          Font.Height = -13.333333015441890000
          Memo.UTF8W = (
            
              '----------------------------------------------------------------' +
              '----------------------------------------------------------------' +
              '------------------------')
          ParentFont = False
        end
        object smmPeriodo: TfrxSysMemoView
          Align = baRight
          Left = 661.417750000000000000
          Top = 34.015770000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            '[PAGE#]')
        end
        object Memo10: TfrxMemoView
          Align = baRight
          Left = 442.205010000000000000
          Top = 11.338590000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'PER'#205'ODO: DATA INICIAL A DATA FINAL')
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 423.307360000000000000
        Width = 718.110700000000000000
        object SysMemo4: TfrxSysMemoView
          Align = baLeft
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'RELAT'#211'RIO EMITIDO '#192'S 13:27 18/06/2019')
        end
      end
      object MasterData1: TfrxMasterData
        Height = 162.519790000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1ENDERECO: TfrxMemoView
          Left = 98.267780000000000000
          Top = 3.779529999999994000
          Width = 616.063390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ENDERECO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."ENDERECO"]')
        end
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'ENDERE'#199'O:')
        end
        object Memo2: TfrxMemoView
          Top = 26.456710000000020000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Name = 'Arial'
          Font.PixelsPerInch = 96.000000000000000000
          Font.Style = [fsBold]
          Font.Color = claBlack
          Font.Height = -16.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'DADOS DE DEN'#218'NCIAS')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 49.133890000000010000
          Width = 710.551640000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo5: TfrxMemoView
          Top = 86.929190000000030000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Name = 'Arial'
          Font.PixelsPerInch = 96.000000000000000000
          Font.Style = [fsBold]
          Font.Color = claBlack
          Font.Height = -16.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'ATENDIMENTOS')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 109.606370000000000000
          Width = 710.551640000000000000
          ShowHint = False
          Diagonal = True
        end
      end
    end
  end
  object frxdsRelDenuncias: TfrxDBDataset
    UserName = 'frxdsRelDenuncias'
    CloseDataSource = False
    DataSet = cdsRelDenuncias
    BCDToCurrency = False
    Left = 48
    Top = 80
  end
  object FDqryRelDenuncias: TFDQuery
    Connection = dmSISVISA.FD_ConnSISVISA
    SQL.Strings = (
      'select * from vw_denuncias')
    Left = 48
    Top = 152
  end
  object cdsRelDenuncias: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelDenuncias'
    Left = 176
    Top = 16
    object cdsRelDenunciasCODIGO_DETALHE: TIntegerField
      FieldName = 'CODIGO_DETALHE'
      Origin = 'CODIGO_DETALHE'
    end
    object cdsRelDenunciasCODIGO_DENUNCIA: TIntegerField
      FieldName = 'CODIGO_DENUNCIA'
      Origin = 'CODIGO_DENUNCIA'
    end
    object cdsRelDenunciasENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 100
    end
    object cdsRelDenunciasCODIGO_TIPODENUNCIA: TIntegerField
      FieldName = 'CODIGO_TIPODENUNCIA'
      Origin = 'CODIGO_TIPODENUNCIA'
    end
    object cdsRelDenunciasTIPDENUNCIA: TStringField
      FieldName = 'TIPDENUNCIA'
      Origin = 'TIPDENUNCIA'
      Size = 100
    end
    object cdsRelDenunciasDATALANC: TDateField
      FieldName = 'DATALANC'
      Origin = 'DATALANC'
    end
    object cdsRelDenunciasOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 150
    end
  end
  object dspRelDenuncias: TDataSetProvider
    DataSet = FDqryRelDenuncias
    Left = 192
    Top = 80
  end
  object dsRelDenuncias: TDataSource
    DataSet = cdsRelDenuncias
    Left = 184
    Top = 152
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = FDQuery1
    BCDToCurrency = False
    Left = 88
    Top = 216
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = dmSISVISA.FD_ConnSISVISA
    SQL.Strings = (
      'SELECT ENDERECO FROM DENUNCIAS')
    Left = 208
    Top = 216
    object FDQuery1ENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 100
    end
  end
end
