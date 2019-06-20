object dmRelReceitas: TdmRelReceitas
  OldCreateOrder = False
  Height = 225
  Width = 382
  object dsRelReceitas: TDataSource
    DataSet = cdsRelReceitas
    Left = 96
    Top = 139
  end
  object dspRelReceitas: TDataSetProvider
    DataSet = FDqryRelReceitas
    Left = 192
    Top = 131
  end
  object FDqryRelReceitas: TFDQuery
    Connection = dmSISVISA.FD_ConnSISVISA
    SQL.Strings = (
      'select * from vw_receitas')
    Left = 292
    Top = 139
    object FDqryRelReceitasCOD_BAIXA: TIntegerField
      FieldName = 'COD_BAIXA'
      Origin = 'COD_BAIXA'
    end
    object FDqryRelReceitasDATA_BAIXA: TDateField
      FieldName = 'DATA_BAIXA'
      Origin = 'DATA_BAIXA'
    end
    object FDqryRelReceitasNUM_BLOCO_BAIXA: TIntegerField
      FieldName = 'NUM_BLOCO_BAIXA'
      Origin = 'NUM_BLOCO_BAIXA'
    end
    object FDqryRelReceitasNUM_INICIAL_BAIXA: TIntegerField
      FieldName = 'NUM_INICIAL_BAIXA'
      Origin = 'NUM_INICIAL_BAIXA'
    end
    object FDqryRelReceitasNUM_FINAL_BAIXA: TIntegerField
      FieldName = 'NUM_FINAL_BAIXA'
      Origin = 'NUM_FINAL_BAIXA'
    end
    object FDqryRelReceitasCOD_RECEITA: TIntegerField
      FieldName = 'COD_RECEITA'
      Origin = 'COD_RECEITA'
    end
    object FDqryRelReceitasDATA_LANC: TDateField
      FieldName = 'DATA_LANC'
      Origin = 'DATA_LANC'
    end
    object FDqryRelReceitasQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object FDqryRelReceitasNUM_BLOCO: TIntegerField
      FieldName = 'NUM_BLOCO'
      Origin = 'NUM_BLOCO'
    end
    object FDqryRelReceitasNUM_INICIAL: TIntegerField
      FieldName = 'NUM_INICIAL'
      Origin = 'NUM_INICIAL'
    end
    object FDqryRelReceitasNUM_FINAL: TIntegerField
      FieldName = 'NUM_FINAL'
      Origin = 'NUM_FINAL'
    end
    object FDqryRelReceitasCOD_UNIDADE: TIntegerField
      FieldName = 'COD_UNIDADE'
      Origin = 'COD_UNIDADE'
    end
    object FDqryRelReceitasUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 100
    end
    object FDqryRelReceitasCOD_TIP: TIntegerField
      FieldName = 'COD_TIP'
      Origin = 'COD_TIP'
    end
    object FDqryRelReceitasTIPO_RECEITA: TStringField
      FieldName = 'TIPO_RECEITA'
      Origin = 'TIPO_RECEITA'
      Size = 50
    end
    object FDqryRelReceitasMEDICO: TStringField
      FieldName = 'MEDICO'
      Origin = 'MEDICO'
      Size = 75
    end
    object FDqryRelReceitasSOLICITANTE: TStringField
      FieldName = 'SOLICITANTE'
      Origin = 'SOLICITANTE'
      Size = 75
    end
    object FDqryRelReceitasSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 45
    end
  end
  object frxdsRelReceitas: TfrxDBDataset
    UserName = 'frxdsRelReceitas'
    CloseDataSource = False
    DataSet = cdsRelReceitas
    BCDToCurrency = False
    Left = 260
    Top = 35
  end
  object cdsRelReceitas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelReceitas'
    Left = 160
    Top = 27
    object cdsRelReceitasCOD_BAIXA: TIntegerField
      FieldName = 'COD_BAIXA'
      Origin = 'COD_BAIXA'
    end
    object cdsRelReceitasDATA_BAIXA: TDateField
      FieldName = 'DATA_BAIXA'
      Origin = 'DATA_BAIXA'
    end
    object cdsRelReceitasNUM_BLOCO_BAIXA: TIntegerField
      FieldName = 'NUM_BLOCO_BAIXA'
      Origin = 'NUM_BLOCO_BAIXA'
    end
    object cdsRelReceitasNUM_INICIAL_BAIXA: TIntegerField
      FieldName = 'NUM_INICIAL_BAIXA'
      Origin = 'NUM_INICIAL_BAIXA'
    end
    object cdsRelReceitasNUM_FINAL_BAIXA: TIntegerField
      FieldName = 'NUM_FINAL_BAIXA'
      Origin = 'NUM_FINAL_BAIXA'
    end
    object cdsRelReceitasCOD_RECEITA: TIntegerField
      FieldName = 'COD_RECEITA'
      Origin = 'COD_RECEITA'
    end
    object cdsRelReceitasDATA_LANC: TDateField
      FieldName = 'DATA_LANC'
      Origin = 'DATA_LANC'
    end
    object cdsRelReceitasQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object cdsRelReceitasNUM_BLOCO: TIntegerField
      FieldName = 'NUM_BLOCO'
      Origin = 'NUM_BLOCO'
    end
    object cdsRelReceitasNUM_INICIAL: TIntegerField
      FieldName = 'NUM_INICIAL'
      Origin = 'NUM_INICIAL'
    end
    object cdsRelReceitasNUM_FINAL: TIntegerField
      FieldName = 'NUM_FINAL'
      Origin = 'NUM_FINAL'
    end
    object cdsRelReceitasCOD_UNIDADE: TIntegerField
      FieldName = 'COD_UNIDADE'
      Origin = 'COD_UNIDADE'
    end
    object cdsRelReceitasUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 100
    end
    object cdsRelReceitasCOD_TIP: TIntegerField
      FieldName = 'COD_TIP'
      Origin = 'COD_TIP'
    end
    object cdsRelReceitasTIPO_RECEITA: TStringField
      FieldName = 'TIPO_RECEITA'
      Origin = 'TIPO_RECEITA'
      Size = 50
    end
    object cdsRelReceitasMEDICO: TStringField
      FieldName = 'MEDICO'
      Origin = 'MEDICO'
      Size = 75
    end
    object cdsRelReceitasSOLICITANTE: TStringField
      FieldName = 'SOLICITANTE'
      Origin = 'SOLICITANTE'
      Size = 75
    end
    object cdsRelReceitasSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 45
    end
  end
  object frxRelReceitas: TfrxReport
    Version = '2.6.14'
    DotMatrixReport = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFullScreen, pbOutline, pbThumbnails, pbPageSetup, pbEdit, pbNavigator, pbClose]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43634.542605578700000000
    ReportOptions.LastChange = 43634.542605578700000000
    ReportOptions.IsFMXReport = True
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 80
    Top = 35
    Datasets = <
      item
        DataSet = frxdsRelReceitas
        DataSetName = 'frxdsRelReceitas'
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
      object MasterData1: TfrxMasterData
        Height = 151.181200000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        DataSet = frxdsRelReceitas
        DataSetName = 'frxdsRelReceitas'
        RowCount = 0
        object frxDBDataset1DATA_LANC: TfrxMemoView
          Left = 185.196970000000000000
          Top = 7.559059999999988000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DATA_LANC'
          DataSet = frxdsRelReceitas
          DataSetName = 'frxdsRelReceitas'
          Memo.UTF8W = (
            '[frxDBDataset1."DATA_LANC"]')
        end
        object Memo1: TfrxMemoView
          Left = 11.338590000000000000
          Top = 7.559059999999988000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Name = 'Arial'
          Font.PixelsPerInch = 96.000000000000000000
          Font.Style = [fsBold]
          Font.Color = claBlack
          Font.Height = -13.333333015441890000
          Memo.UTF8W = (
            'DATA DE LAN'#199'AMENTO:')
          ParentFont = False
        end
        object frxDBDataset1NUM_BLOCO: TfrxMemoView
          Left = 313.700990000000000000
          Top = 41.574829999999990000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NUM_BLOCO'
          DataSet = frxdsRelReceitas
          DataSetName = 'frxdsRelReceitas'
          Memo.UTF8W = (
            '[frxDBDataset1."NUM_BLOCO"]')
        end
        object Memo2: TfrxMemoView
          Left = 230.551330000000000000
          Top = 41.574829999999990000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Name = 'Arial'
          Font.PixelsPerInch = 96.000000000000000000
          Font.Style = [fsBold]
          Font.Color = claBlack
          Font.Height = -13.333333015441890000
          Memo.UTF8W = (
            'N'#186' BLOCO:')
          ParentFont = False
        end
        object frxDBDataset1QUANTIDADE: TfrxMemoView
          Left = 117.165430000000000000
          Top = 41.574829999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'QUANTIDADE'
          DataSet = frxdsRelReceitas
          DataSetName = 'frxdsRelReceitas'
          Memo.UTF8W = (
            '[frxDBDataset1."QUANTIDADE"]')
        end
        object Memo3: TfrxMemoView
          Left = 11.338590000000000000
          Top = 41.574829999999990000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Name = 'Arial'
          Font.PixelsPerInch = 96.000000000000000000
          Font.Style = [fsBold]
          Font.Color = claBlack
          Font.Height = -13.333333015441890000
          Memo.UTF8W = (
            'QTD BLOCOS:')
          ParentFont = False
        end
        object frxDBDataset1NUM_INICIAL: TfrxMemoView
          Left = 143.622140000000000000
          Top = 75.590599999999970000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NUM_INICIAL'
          DataSet = frxdsRelReceitas
          DataSetName = 'frxdsRelReceitas'
          Memo.UTF8W = (
            '[frxDBDataset1."NUM_INICIAL"]')
        end
        object Memo4: TfrxMemoView
          Left = 11.338590000000000000
          Top = 75.590599999999970000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Name = 'Arial'
          Font.PixelsPerInch = 96.000000000000000000
          Font.Style = [fsBold]
          Font.Color = claBlack
          Font.Height = -13.333333015441890000
          Memo.UTF8W = (
            'N'#186' FOLHA INICIAL:')
          ParentFont = False
        end
        object frxDBDataset1NUM_FINAL: TfrxMemoView
          Left = 427.086890000000000000
          Top = 75.590599999999970000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NUM_FINAL'
          DataSet = frxdsRelReceitas
          DataSetName = 'frxdsRelReceitas'
          Memo.UTF8W = (
            '[frxDBDataset1."NUM_FINAL"]')
        end
        object Memo5: TfrxMemoView
          Left = 302.362400000000000000
          Top = 75.590599999999970000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Name = 'Arial'
          Font.PixelsPerInch = 96.000000000000000000
          Font.Style = [fsBold]
          Font.Color = claBlack
          Font.Height = -13.333333015441890000
          Memo.UTF8W = (
            'N'#186' FOLHA FINAL:')
          ParentFont = False
        end
        object frxDBDataset1UNIDADE: TfrxMemoView
          Left = 385.512060000000000000
          Top = 7.559059999999988000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'UNIDADE'
          DataSet = frxdsRelReceitas
          DataSetName = 'frxdsRelReceitas'
          Memo.UTF8W = (
            '[frxDBDataset1."UNIDADE"]')
        end
        object Memo6: TfrxMemoView
          Left = 313.700990000000000000
          Top = 7.559059999999988000
          Width = 75.590599999999990000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Name = 'Arial'
          Font.PixelsPerInch = 96.000000000000000000
          Font.Style = [fsBold]
          Font.Color = claBlack
          Font.Height = -13.333333015441890000
          Memo.UTF8W = (
            'UNIDADE:')
          ParentFont = False
        end
        object frxDBDataset1TIPO_RECEITA: TfrxMemoView
          Left = 491.338900000000000000
          Top = 41.574829999999990000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'TIPO_RECEITA'
          DataSet = frxdsRelReceitas
          DataSetName = 'frxdsRelReceitas'
          Memo.UTF8W = (
            '[frxDBDataset1."TIPO_RECEITA"]')
        end
        object Memo7: TfrxMemoView
          Left = 445.984540000000000000
          Top = 41.574829999999990000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Name = 'Arial'
          Font.PixelsPerInch = 96.000000000000000000
          Font.Style = [fsBold]
          Font.Color = claBlack
          Font.Height = -13.333333015441890000
          Memo.UTF8W = (
            'TIPO:')
          ParentFont = False
        end
        object frxDBDataset1STATUS: TfrxMemoView
          Left = 75.590599999999990000
          Top = 113.385900000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'STATUS'
          DataSet = frxdsRelReceitas
          DataSetName = 'frxdsRelReceitas'
          Memo.UTF8W = (
            '[frxDBDataset1."STATUS"]')
        end
        object Memo8: TfrxMemoView
          Left = 11.338590000000000000
          Top = 113.385900000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Name = 'Arial'
          Font.PixelsPerInch = 96.000000000000000000
          Font.Style = [fsBold]
          Font.Color = claBlack
          Font.Height = -13.333333015441890000
          Memo.UTF8W = (
            'STATUS:')
          ParentFont = False
        end
        object frxDBDataset1DATA_BAIXA: TfrxMemoView
          Left = 396.850650000000000000
          Top = 113.385900000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DATA_BAIXA'
          DataSet = frxdsRelReceitas
          DataSetName = 'frxdsRelReceitas'
          Memo.UTF8W = (
            '[frxDBDataset1."DATA_BAIXA"]')
        end
        object Memo9: TfrxMemoView
          Left = 302.362400000000000000
          Top = 113.385900000000000000
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Name = 'Arial'
          Font.PixelsPerInch = 96.000000000000000000
          Font.Style = [fsBold]
          Font.Color = claBlack
          Font.Height = -13.333333015441890000
          Memo.UTF8W = (
            'DATA BAIXA:')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Align = baBottom
          Left = 3.779530000000000000
          Top = 128.504020000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
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
      end
      object ReportTitle1: TfrxReportTitle
        Height = 41.574830000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
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
            'RELAT'#211'RIO DE RECEITAS')
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
        Top = 411.968770000000000000
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
    end
  end
end
