object dmRelReceitas: TdmRelReceitas
  OldCreateOrder = False
  Height = 225
  Width = 382
  object dsRelReceitas: TDataSource
    DataSet = cdsRelReceitas
    Left = 200
    Top = 67
  end
  object dspRelReceitas: TDataSetProvider
    DataSet = FDqryRelReceitas
    Left = 288
    Top = 67
  end
  object FDqryRelReceitas: TFDQuery
    Connection = dmSISVISA.FD_ConnSISVISA
    SQL.Strings = (
      'select * from vw_receitas')
    Left = 284
    Top = 19
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
    Left = 196
    Top = 11
  end
  object cdsRelReceitas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelReceitas'
    Left = 112
    Top = 3
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
    Left = 24
    Top = 3
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
            '[frxdsRelReceitas."DATA_LANC"]')
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
            '[frxdsRelReceitas."NUM_BLOCO"]')
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
            '[frxdsRelReceitas."QUANTIDADE"]')
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
            '[frxdsRelReceitas."NUM_INICIAL"]')
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
            '[frxdsRelReceitas."NUM_FINAL"]')
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
            '[frxdsRelReceitas."UNIDADE"]')
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
            '[frxdsRelReceitas."TIPO_RECEITA"]')
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
            '[frxdsRelReceitas."STATUS"]')
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
            '[frxdsRelReceitas."DATA_BAIXA"]')
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
  object ppRelReceitas: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    ThumbnailSettings.PageHighlight.Width = 3
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PDFSettings.PDFAFormat = pafNone
    PreviewFormSettings.PageBorder.mmPadding = 0
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 24
    Top = 72
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppTitleBand1: TppTitleBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 11906
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Border.mmPadding = 0
        Caption = 'CONTROLE DE RECEITAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 20
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 8467
        mmLeft = 48154
        mmTop = 794
        mmWidth = 92075
        BandType = 1
        LayerName = Foreground
      end
    end
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object pplblPeriodo: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'PER'#205'ODO'
        Border.mmPadding = 0
        Caption = 'PER'#205'ODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 6350
        mmLeft = 73819
        mmTop = 1588
        mmWidth = 123031
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 259
        mmLeft = 1058
        mmTop = 8728
        mmWidth = 195839
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 43392
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'DATA LANC.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 2117
        mmWidth = 28046
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        Border.mmPadding = 0
        DataField = 'DATA_LANC'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 29104
        mmTop = 2117
        mmWidth = 32808
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'UNIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 63236
        mmTop = 2117
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        Border.mmPadding = 0
        DataField = 'UNIDADE'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 83608
        mmTop = 2117
        mmWidth = 111654
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'TIPO RECEITA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 8731
        mmWidth = 30692
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        Border.mmPadding = 0
        DataField = 'TIPO_RECEITA'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 31750
        mmTop = 8731
        mmWidth = 60854
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'N'#186' BLOCO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 98954
        mmTop = 8731
        mmWidth = 27517
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        Border.mmPadding = 0
        DataField = 'NUM_BLOCO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 127529
        mmTop = 8731
        mmWidth = 32808
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'N'#186' FOLHA INICIAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 15081
        mmWidth = 37042
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        Border.mmPadding = 0
        DataField = 'NUM_INICIAL'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 38894
        mmTop = 15081
        mmWidth = 32808
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'N'#186' FOLHA FINAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 83608
        mmTop = 15081
        mmWidth = 36513
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        Border.mmPadding = 0
        DataField = 'NUM_FINAL'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 120121
        mmTop = 15081
        mmWidth = 32808
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label8'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'STATUS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 21960
        mmWidth = 17463
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        Border.mmPadding = 0
        DataField = 'STATUS'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 18521
        mmTop = 21960
        mmWidth = 73025
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label9'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'DATA BAIXA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 102394
        mmTop = 21960
        mmWidth = 27252
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText8'
        Border.mmPadding = 0
        DataField = 'DATA_BAIXA'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 130704
        mmTop = 21960
        mmWidth = 32808
        BandType = 4
        LayerName = Foreground
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 259
        mmLeft = 1058
        mmTop = 27560
        mmWidth = 195839
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object pplblTextoRodape: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'TEXTORODAP'#201
        Border.mmPadding = 0
        Caption = 'TEXTO RODAP'#201
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 6350
        mmLeft = 0
        mmTop = 1323
        mmWidth = 43656
        BandType = 8
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        Border.mmPadding = 0
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6350
        mmLeft = 193675
        mmTop = 1323
        mmWidth = 3175
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsRelReceitas
    UserName = 'DBPipeline1'
    Left = 104
    Top = 72
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'COD_BAIXA'
      FieldName = 'COD_BAIXA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'DATA_BAIXA'
      FieldName = 'DATA_BAIXA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUM_BLOCO_BAIXA'
      FieldName = 'NUM_BLOCO_BAIXA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUM_INICIAL_BAIXA'
      FieldName = 'NUM_INICIAL_BAIXA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUM_FINAL_BAIXA'
      FieldName = 'NUM_FINAL_BAIXA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'COD_RECEITA'
      FieldName = 'COD_RECEITA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'DATA_LANC'
      FieldName = 'DATA_LANC'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUM_BLOCO'
      FieldName = 'NUM_BLOCO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUM_INICIAL'
      FieldName = 'NUM_INICIAL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUM_FINAL'
      FieldName = 'NUM_FINAL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'COD_UNIDADE'
      FieldName = 'COD_UNIDADE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'UNIDADE'
      FieldName = 'UNIDADE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'COD_TIP'
      FieldName = 'COD_TIP'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      FieldAlias = 'TIPO_RECEITA'
      FieldName = 'TIPO_RECEITA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 14
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = 'MEDICO'
      FieldName = 'MEDICO'
      FieldLength = 75
      DisplayWidth = 75
      Position = 15
    end
    object ppDBPipeline1ppField17: TppField
      FieldAlias = 'SOLICITANTE'
      FieldName = 'SOLICITANTE'
      FieldLength = 75
      DisplayWidth = 75
      Position = 16
    end
    object ppDBPipeline1ppField18: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 45
      DisplayWidth = 45
      Position = 17
    end
  end
end
