unit Classes.Utils.View;

interface

uses
  FireDAC.Comp.Client, FMX.ListBox, FMX.ListView, FMX.Forms, FMX.DateTimeCtrls,
  U_MensagemPadrao, FMX.Edit, Datasnap.DBClient, FMX.Memo,
  MultiDetailAppearanceU,
  FMX.Objects;

type
  tpRelatorio = (Denuncias, Receitas);

type
  TUtilsView = class
  private
    FImprimirRel: tpRelatorio;
    procedure SetImprimirRel(const Value: tpRelatorio);

  public
    procedure fnc_ExibirMensagem(Tit, MSG: String; tpMSG: TTipMensagem);
    procedure AddDenuncia(lv: TListView; lb: TListBox; cds: TClientDataSet;
      ds: TFDQuery);

    function VerificaProced(valor, prazo, infracao: TEdit): Boolean;

    procedure Incluir(Tabela, Campos, Valores: string; ds: TFDQuery);
    procedure Alterar(Tabela, Campos: string; ds: TFDQuery);
    procedure Deletar(Tabela, Campos: string; ds: TFDQuery);

    procedure CDCaminho(lv: TListView; dsCaminho: TFDQuery; Tabela: string);
    procedure CDArtigo(lv: TListView; dsArtigo: TFDQuery; Tabela: string);

    procedure CDTipDenuncia(lv: TListView; dsTipDenuncia: TFDQuery;
      Tabela: string);
    procedure CDProcedDenuncia(lv: TListView; dsProcedDenuncia: TFDQuery;
      Tabela: string);
    procedure CDDenuncia(lv: TListView; dsDenuncia: TFDQuery; Tabela: string);
    procedure CDDenunciaDet(lv: TListView; dsDenunciaDet: TFDQuery;
      Tabela, codden: string);
    procedure CDDenunciaAtend(lv: TListView; dsDenunciaAtend: TFDQuery;
      Tabela, coddet: string); overload;
    procedure CDDenunciaAtend(mmMemo: TMemo; dsDenunciaAtend: TFDQuery;
      Tabela, coddet: string); overload;

    procedure CDTipReceita(lv: TListView; dsTipReceita: TFDQuery;
      Tabela: string);
    procedure CDUnidade(lv: TListView; dsUnidade: TFDQuery; Tabela: string);
    procedure CDReceita(lv: TListView; dsReceitas: TFDQuery; Tabela: string;
      img1, img2: TImage); overload;
    procedure CDReceita(lv: TListView; dsReceitas: TFDQuery;
      Tabela: string); overload;
    procedure LancarReceita(dtlanc: TDateEdit;
      unidade, tiporec, qtd, num_blocoinicial, folha_inicial,
      folha_final: Integer; status, respo, Tabela: string; dsReceita: TFDQuery);

    procedure BuscarReceita(Tabela, Campos: string; dsReceitas: TFDQuery;
      lv: TListView; img1, img2: TImage);

    function CalculaFolhaFinal(ValorInicio, qtd, CodTipo: Integer): Integer;

    function RetornaID(Tabela, Value, campo1, campo2: string;
      ds: TFDQuery): Integer;

    procedure PreencherReceita(lvd, lvb: TListView;
      numinicio, numfinal, bloco, codReceita: Integer;
      cdsReceita: TClientDataSet);

    function ValidarReceita: Boolean;

    procedure ImprimirRelatorio(Tabela, Field, Relatorio: String;
      Data1, Data2: TDateEdit; dsRelatorio: TFDQuery);

    function PreencherRelatorio(Data1, Data2: TDateEdit; User: string): string;

    property ImprimirRel: tpRelatorio read FImprimirRel write SetImprimirRel;
  end;

implementation

uses
  FMX.Dialogs, U_dmSISVISA, System.SysUtils, FMX.ListView.Appearances,
  U_SISVISA, Classes.Utils.Consts, FMX.ListView.Types, U_CadastroReceitas,
  U_dmRelDenuncias, U_dmRelReceitas;

{ TUtilsView }

procedure TUtilsView.AddDenuncia(lv: TListView; lb: TListBox;
  cds: TClientDataSet; ds: TFDQuery);
var
  tipo: string;
  cod: Integer;
  lbxi: TListBoxItem;
begin
  lbxi := TListBoxItem.Create(nil);
  tipo := lv.Items[lv.Selected.Index].Text;
  lbxi.Text := tipo;
  cod := RetornaID(TAB_DEN_TIP, QuotedStr(tipo), TAB_TIP_F1, TAB_TIP_F2, ds);
  cds.Append;
  cds.FieldByName('CODIGO').AsInteger := cod;
  cds.Post;
  cds.Close;
  cds.Open;
  lb.AddObject(lbxi);

end;

procedure TUtilsView.Alterar(Tabela, Campos: string; ds: TFDQuery);
var
  sql: string;
begin

  // variavel sql recebe seu texto
  sql := '';
  sql := sql + 'update ' + Tabela;
  sql := sql + Campos;

  // query � criada, fechada, limpa, conectada
  ds := TFDQuery.Create(nil);
  try

    ds.Close;
    ds.sql.Clear;
    ds.Connection := dmSISVisa.FD_ConnSISVISA;
    dmSISVisa.FDtrs_SVisa.StartTransaction;
    ds.sql.Add(sql);

    try
      ds.ExecSQL; // executa o sql
      dmSISVisa.FDtrs_SVisa.Commit; // salva as modifica��es
      dmSISVisa.FDqryCadastros.Close;
      // fecha e abre o data set para exibi��o dos dados
    except
      on E: Exception do
        raise Exception.Create
          ('Houve um erro ao Alterar dados de (CAMINHO DO BANCO). " ' +
          E.Message + #13 + UnitName + '.InserirDados."');
    end;

  finally
    // finaliza a query
    FreeAndNil(ds);
  end;

end;

procedure TUtilsView.BuscarReceita(Tabela, Campos: string; dsReceitas: TFDQuery;
      lv: TListView; img1, img2: TImage);
var
  sql: string;
begin

  sql := EmptyStr;
  sql := Tabela + Campos;

  Tabela := sql;

  CDReceita(lv, dsReceitas, tabela, img1, img2);

end;

procedure TUtilsView.CDCaminho(lv: TListView; dsCaminho: TFDQuery;
  Tabela: string);
var
  lvItem: TListViewItem;
begin
  dsCaminho := TFDQuery.Create(nil);
  dmSISVisa := TdmSISVISA.Create(nil);

  dsCaminho.Close;
  dsCaminho.sql.Clear;
  dsCaminho.Connection := dmSISVisa.FD_ConnSISVISA;
  dsCaminho.sql.Add('select * from ' + Tabela);
  dsCaminho.Prepared := True;
  dsCaminho.Open;

  try
    if dsCaminho.RecordCount > 0 then
    begin

      lv.Items.Clear;
      lv.BeginUpdate;
      while not dsCaminho.Eof do
      begin
        lvItem := lv.Items.Add;
        lvItem.Detail := dsCaminho.FieldByName('cod_caminhobd').AsString;
        lvItem.Text := dsCaminho.FieldByName('descricao').AsString;
        lvItem.Data[TMultiDetailAppearanceNames.Detail1] :=
          dsCaminho.FieldByName('caminho_bd').AsString;
        dsCaminho.Next;
      end;

      lv.EndUpdate;
    end;

  except
    on E: Exception do
      raise Exception.Create('N�o h� Dados para Listar!!!');
  end;

end;

procedure TUtilsView.CDDenuncia(lv: TListView; dsDenuncia: TFDQuery;
  Tabela: string);
var
  lvItem: TListViewItem;
begin
  dsDenuncia := TFDQuery.Create(nil);
  dsDenuncia.Close;
  dsDenuncia.sql.Clear;
  dsDenuncia.Connection := dmSISVisa.FD_ConnSISVISA;
  dsDenuncia.sql.Add('select * from ' + Tabela);
  dsDenuncia.Prepared := True;
  dsDenuncia.Open;

  try

    if dsDenuncia.RecordCount > 0 then
    begin

      lv.Items.Clear;
      lv.BeginUpdate;
      while not dsDenuncia.Eof do
      begin
        lvItem := lv.Items.Add;
        lvItem.Detail := dsDenuncia.FieldByName('cod_denuncia').AsString;
        lvItem.Text := dsDenuncia.FieldByName('endereco').AsString;
        dsDenuncia.Next;
      end;

      lv.EndUpdate;
    end;

  except
    on E: Exception do
      raise Exception.Create('N�o h� Dados para Listar!!!');
  end;

end;

procedure TUtilsView.CDDenunciaAtend(mmMemo: TMemo; dsDenunciaAtend: TFDQuery;
  Tabela, coddet: string);
begin
  dsDenunciaAtend := TFDQuery.Create(nil);
  dsDenunciaAtend.Close;
  dsDenunciaAtend.sql.Clear;
  dsDenunciaAtend.Connection := dmSISVisa.FD_ConnSISVISA;
  dsDenunciaAtend.sql.Add('select * from ' + Tabela +
    ' where codigo_tipodenuncia = ' + coddet);
  dsDenunciaAtend.Prepared := True;
  dsDenunciaAtend.Open;

  try
    if dsDenunciaAtend.RecordCount <> 0 then
    begin
      mmMemo.Lines.Clear;
      mmMemo.BeginUpdate;

      while not dsDenunciaAtend.Eof do
      begin

        mmMemo.Lines.Add(dsDenunciaAtend.FieldByName('codigo_atendimento')
          .AsString);
        mmMemo.Lines.Add(dsDenunciaAtend.FieldByName('DATA_ATEND').AsString);
        mmMemo.Lines.Add(dsDenunciaAtend.FieldByName('PROCEDIMENTO').AsString);
        mmMemo.Lines.Add(dsDenunciaAtend.FieldByName('PRAZO').AsString + ' DIAS'
          + ' - ' + dsDenunciaAtend.FieldByName('DATA_RETORNO').AsString);

        dsDenunciaAtend.Next;
      end;

      mmMemo.EndUpdate;
    end
    else
      mmMemo.Lines.Clear;

  except
    on E: Exception do
      raise Exception.Create('N�o h� Dados para Listar!!!');
  end;

end;

procedure TUtilsView.CDDenunciaAtend(lv: TListView; dsDenunciaAtend: TFDQuery;
  Tabela, coddet: string);
var
  lvItem: TListViewItem;
begin
  dsDenunciaAtend := TFDQuery.Create(nil);
  dsDenunciaAtend.Close;
  dsDenunciaAtend.sql.Clear;
  dsDenunciaAtend.Connection := dmSISVisa.FD_ConnSISVISA;
  dsDenunciaAtend.sql.Add('select * from ' + Tabela +
    ' where codigo_tipodenuncia = ' + coddet);
  dsDenunciaAtend.Prepared := True;
  dsDenunciaAtend.Open;

  try
    if dsDenunciaAtend.RecordCount <> 0 then
    begin
      lv.Items.Clear;
      lv.BeginUpdate;
      while not dsDenunciaAtend.Eof do
      begin
        lvItem := lv.Items.Add;
        lvItem.Detail := dsDenunciaAtend.FieldByName
          ('codigo_atendimento').AsString;
        lvItem.Text := dsDenunciaAtend.FieldByName('DATA_ATEND').AsString;
        lvItem.Data[TMultiDetailAppearanceNames.Detail1] :=
          dsDenunciaAtend.FieldByName('PROCEDIMENTO').AsString;
        lvItem.Data[TMultiDetailAppearanceNames.Detail2] :=
          dsDenunciaAtend.FieldByName('PRAZO').AsString + ' DIAS' + ' - ' +
          dsDenunciaAtend.FieldByName('DATA_RETORNO').AsString;

        dsDenunciaAtend.Next;
      end;

      lv.EndUpdate;
    end
    else
      lv.Items.Clear;

  except
    on E: Exception do
      raise Exception.Create('N�o h� Dados para Listar!!!');
  end;

end;

procedure TUtilsView.CDDenunciaDet(lv: TListView; dsDenunciaDet: TFDQuery;
  Tabela, codden: string);
var
  lvItem: TListViewItem;
begin
  dsDenunciaDet := TFDQuery.Create(nil);
  dsDenunciaDet.Close;
  dsDenunciaDet.sql.Clear;
  dsDenunciaDet.Connection := dmSISVisa.FD_ConnSISVISA;
  dsDenunciaDet.sql.Add('select * from ' + Tabela + ' where codigo_denuncia = '
    + codden);
  dsDenunciaDet.Prepared := True;
  dsDenunciaDet.Open;

  try
    if dsDenunciaDet.RecordCount <> 0 then
    begin
      lv.Items.Clear;
      lv.BeginUpdate;
      while not dsDenunciaDet.Eof do
      begin
        lvItem := lv.Items.Add;
        lvItem.Detail := dsDenunciaDet.FieldByName('codigo_detalhe').AsString;
        lvItem.Text := dsDenunciaDet.FieldByName('tipdenuncia').AsString;
        lvItem.Data[TMultiDetailAppearanceNames.Detail1] :=
          dsDenunciaDet.FieldByName('datalanc').AsString;
        dsDenunciaDet.Next;
      end;

      lv.EndUpdate;
    end
    else
      lv.Items.Clear;

  except
    on E: Exception do
      raise Exception.Create('N�o h� Dados para Listar!!!');
  end;

end;

procedure TUtilsView.CDProcedDenuncia(lv: TListView; dsProcedDenuncia: TFDQuery;
  Tabela: string);
var
  lvItem: TListViewItem;
begin
  dsProcedDenuncia := TFDQuery.Create(nil);
  dsProcedDenuncia.Close;
  dsProcedDenuncia.sql.Clear;
  dsProcedDenuncia.Connection := dmSISVisa.FD_ConnSISVISA;
  dsProcedDenuncia.sql.Add('select * from ' + Tabela);
  dsProcedDenuncia.Prepared := True;
  dsProcedDenuncia.Open;

  try

    if dsProcedDenuncia.RecordCount > 0 then
    begin

      lv.Items.Clear;
      lv.BeginUpdate;
      while not dsProcedDenuncia.Eof do
      begin
        lvItem := lv.Items.Add;
        lvItem.Detail := dsProcedDenuncia.FieldByName('cod_proced').AsString;
        lvItem.Text := dsProcedDenuncia.FieldByName('descricao').AsString;
        dsProcedDenuncia.Next;
      end;

      lv.EndUpdate;
    end;

  except
    on E: Exception do
      raise Exception.Create('N�o h� Dados para Listar!!!');
  end;

end;

procedure TUtilsView.CDReceita(lv: TListView; dsReceitas: TFDQuery;
  Tabela: string);
var
  lvItem: TListViewItem;
begin
  dsReceitas := TFDQuery.Create(nil);
  dsReceitas.Close;
  dsReceitas.sql.Clear;
  dsReceitas.Connection := dmSISVisa.FD_ConnSISVISA;
  dsReceitas.sql.Add('select * from ' + Tabela);
  dsReceitas.Prepared := True;
  dsReceitas.Open;

  try

    if dsReceitas.RecordCount > 0 then
    begin
      lv.Items.Clear;
      lv.BeginUpdate;

      while not dsReceitas.Eof do
      begin
        lvItem := lv.Items.Add;
        lvItem.Detail := dsReceitas.FieldByName('cod_receita').AsString;
        lvItem.Text := 'FOLHA INICIAL: ' + dsReceitas.FieldByName('num_inicial')
          .AsString + ' a ' + 'FOLHA FINAL: ' + dsReceitas.FieldByName
          ('num_final').AsString;
        lvItem.Data[TMultiDetailAppearanceNames.Detail1] :=
          'DATA DE LAN�AMENTO: ' + dsReceitas.FieldByName('data_lanc').AsString
          + '     N� BLOCO: ' + IntToStr(dsReceitas.FieldByName('num_bloco')
          .AsInteger) + '   QTD BLOCOS: ' +
          IntToStr(dsReceitas.FieldByName('QUANTIDADE').AsInteger);
        lvItem.Data[TMultiDetailAppearanceNames.Detail2] := 'UNIDADE DE SA�DE: '
          + dsReceitas.FieldByName('UNIDADE').AsString + '   TIPO DE RECEITA: '
          + dsReceitas.FieldByName('TIPO_RECEITA').AsString;
        lvItem.Data[TMultiDetailAppearanceNames.Detail3] := ' STATUS: ' +
          dsReceitas.FieldByName('STATUS').AsString;

        dsReceitas.Next;
      end;

    end;

    lv.EndUpdate;
  except
    on E: Exception do
      raise Exception.Create('N�o h� Dados para Listar!!!');
  end;
end;

procedure TUtilsView.CDReceita(lv: TListView; dsReceitas: TFDQuery;
  Tabela: string; img1, img2: TImage);
var
  Item: TListViewItem;
  txt: TListItemText;
  Img: TListItemImage;
begin
  dsReceitas := TFDQuery.Create(nil);
  dsReceitas.Close;
  dsReceitas.sql.Clear;
  dsReceitas.Connection := dmSISVisa.FD_ConnSISVISA;
  dsReceitas.sql.Add('select * from ' + Tabela);
  dsReceitas.Prepared := True;
  dsReceitas.Open;

  try

    if dsReceitas.RecordCount > 0 then
    begin
      lv.Items.Clear;
      lv.BeginUpdate;

      while not dsReceitas.Eof do
      begin

        Item := lv.Items.Add;
        with Item do
        begin
          txt := TListItemText(Objects.FindDrawable('Text1'));
          txt.Text := 'FOLHA INICIAL: ' + dsReceitas.FieldByName('num_inicial')
            .AsString + ' a ' + 'FOLHA FINAL: ' + dsReceitas.FieldByName
            ('num_final').AsString;

          txt := TListItemText(Objects.FindDrawable('Text2'));
          txt.Text := 'DATA DE LAN�AMENTO: ' + dsReceitas.FieldByName
            ('data_lanc').AsString + '     N� BLOCO: ' +
            IntToStr(dsReceitas.FieldByName('num_bloco').AsInteger) +
            '   QTD BLOCOS: ' + IntToStr(dsReceitas.FieldByName('QUANTIDADE')
            .AsInteger);

          txt := TListItemText(Objects.FindDrawable('Text3'));
          txt.Text := 'UNIDADE DE SA�DE: ' + dsReceitas.FieldByName('UNIDADE')
            .AsString + '   TIPO DE RECEITA: ' + dsReceitas.FieldByName
            ('TIPO_RECEITA').AsString;

          txt := TListItemText(Objects.FindDrawable('Text4'));
          txt.Text := ' STATUS: ' + dsReceitas.FieldByName('STATUS').AsString;

          Img := TListItemImage(Objects.FindDrawable('Image5'));
          if dsReceitas.FieldByName('STATUS').AsString = 'BAIXADO' then
            Img.Bitmap := img1.Bitmap
          else
            Img.Bitmap := img2.Bitmap;
        end;

        dsReceitas.Next;
      end;

      lv.EndUpdate;
    end
  except
    on E: Exception do
      raise Exception.Create('N�o h� Dados para Listar!!!');
  end;

end;

procedure TUtilsView.CDTipDenuncia(lv: TListView; dsTipDenuncia: TFDQuery;
  Tabela: string);
var
  lvItem: TListViewItem;
begin
  dsTipDenuncia := TFDQuery.Create(nil);
  dsTipDenuncia.Close;
  dsTipDenuncia.sql.Clear;
  dsTipDenuncia.Connection := dmSISVisa.FD_ConnSISVISA;
  dsTipDenuncia.sql.Add('select * from ' + Tabela);
  dsTipDenuncia.Prepared := True;
  dsTipDenuncia.Open;

  try

    if dsTipDenuncia.RecordCount > 0 then
    begin

      lv.Items.Clear;
      lv.BeginUpdate;
      while not dsTipDenuncia.Eof do
      begin
        lvItem := lv.Items.Add;
        lvItem.Detail := dsTipDenuncia.FieldByName('cod_tipdenuncia').AsString;
        lvItem.Text := dsTipDenuncia.FieldByName('descricao').AsString;
        dsTipDenuncia.Next;
      end;

      lv.EndUpdate;
    end;

  except
    on E: Exception do
      raise Exception.Create('N�o h� Dados para Listar!!!');
  end;

end;

procedure TUtilsView.CDTipReceita(lv: TListView; dsTipReceita: TFDQuery;
  Tabela: string);
var
  lvItem: TListViewItem;
begin
  dsTipReceita := TFDQuery.Create(nil);
  dsTipReceita.Close;
  dsTipReceita.sql.Clear;
  dsTipReceita.Connection := dmSISVisa.FD_ConnSISVISA;
  dsTipReceita.sql.Add('select * from ' + Tabela);
  dsTipReceita.Prepared := True;
  dsTipReceita.Open;

  try

    if dsTipReceita.RecordCount > 0 then
    begin

      lv.Items.Clear;
      lv.BeginUpdate;
      while not dsTipReceita.Eof do
      begin
        lvItem := lv.Items.Add;
        lvItem.Detail := dsTipReceita.FieldByName('id_tipo_receita').AsString;
        lvItem.Text := dsTipReceita.FieldByName('tipo_receita').AsString;
        dsTipReceita.Next;
      end;

      lv.EndUpdate;
    end;

  except
    on E: Exception do
      raise Exception.Create('N�o h� Dados para Listar!!!');
  end;

end;

procedure TUtilsView.CDUnidade(lv: TListView; dsUnidade: TFDQuery;
  Tabela: string);
var
  lvItem: TListViewItem;
begin
  dsUnidade := TFDQuery.Create(nil);
  dsUnidade.Close;
  dsUnidade.sql.Clear;
  dsUnidade.Connection := dmSISVisa.FD_ConnSISVISA;
  dsUnidade.sql.Add('select * from ' + Tabela);
  dsUnidade.Prepared := True;
  dsUnidade.Open;

  try

    if dsUnidade.RecordCount > 0 then
    begin

      lv.Items.Clear;
      lv.BeginUpdate;
      while not dsUnidade.Eof do
      begin
        lvItem := lv.Items.Add;
        lvItem.Detail := dsUnidade.FieldByName('id_unidade_saude').AsString;
        lvItem.Text := dsUnidade.FieldByName('unidade_saude').AsString;
        dsUnidade.Next;
      end;

      lv.EndUpdate;
    end;

  except
    on E: Exception do
      raise Exception.Create('N�o h� Dados para Listar!!!');
  end;

end;

function TUtilsView.CalculaFolhaFinal(ValorInicio, qtd,
  CodTipo: Integer): Integer;
var
  valorfinal: Integer;
begin

  valorfinal := 0;

  case CodTipo of
    1:
      case qtd of
        1:
          valorfinal := qtd * 49;
        2:
          valorfinal := (qtd * 49) + 1;
        3:
          valorfinal := (qtd * 49) + 2;
        4:
          valorfinal := (qtd * 49) + 3;
        5:
          valorfinal := (qtd * 49) + 4;
        6:
          valorfinal := (qtd * 49) + 5;
        7:
          valorfinal := (qtd * 49) + 6;
        8:
          valorfinal := (qtd * 49) + 7;
        9:
          valorfinal := (qtd * 49) + 8;
        10:
          valorfinal := (qtd * 49) + 9;
      end;

    2:
      case qtd of
        1:
          valorfinal := qtd * 99;
        2:
          valorfinal := (qtd * 99) + 1;
        3:
          valorfinal := (qtd * 99) + 2;
        4:
          valorfinal := (qtd * 99) + 3;
        5:
          valorfinal := (qtd * 99) + 4;
        6:
          valorfinal := (qtd * 99) + 5;
        7:
          valorfinal := (qtd * 99) + 6;
        8:
          valorfinal := (qtd * 99) + 7;
        9:
          valorfinal := (qtd * 99) + 8;
        10:
          valorfinal := (qtd * 99) + 9;

      end;

  end;

  Result := valorfinal + ValorInicio;

end;

procedure TUtilsView.CDArtigo(lv: TListView; dsArtigo: TFDQuery;
  Tabela: string);
var
  lvItem: TListViewItem;
begin
  dsArtigo := TFDQuery.Create(nil);
  dsArtigo.Close;
  dsArtigo.sql.Clear;
  dsArtigo.Connection := dmSISVisa.FD_ConnSISVISA;
  dsArtigo.sql.Add('select * from ' + Tabela);
  dsArtigo.Prepared := True;
  dsArtigo.Open;

  try

    if dsArtigo.RecordCount > 0 then
    begin

      lv.Items.Clear;
      lv.BeginUpdate;
      while not dsArtigo.Eof do
      begin
        lvItem := lv.Items.Add;
        lvItem.Detail := dsArtigo.FieldByName('cod_artigo').AsString;
        lvItem.Text := IntToStr(dsArtigo.FieldByName('num_artigo').AsInteger);
        lvItem.Data[TMultiDetailAppearanceNames.Detail1] := { 'Parag. - ' +
          dsArtigo.FieldByName('paragrafo').AsString + } 'Inciso: ' +
          dsArtigo.FieldByName('inciso').AsString;
        lvItem.Data[TMultiDetailAppearanceNames.Detail2] :=
          dsArtigo.FieldByName('descricao').AsString;
        dsArtigo.Next;
      end;

      lv.EndUpdate;
    end;

  except
    on E: Exception do
      raise Exception.Create('N�o h� Dados para Listar!!!');
  end;

end;

procedure TUtilsView.Deletar(Tabela, Campos: string; ds: TFDQuery);
var
  sql: string;
begin
  // variavel sql recebe seu texto
  sql := '';
  sql := sql + 'delete from ' + Tabela;
  sql := sql + Campos;

  // query � criada, fechada, limpa, conectada
  ds := TFDQuery.Create(nil);
  try

    ds.Close;
    ds.sql.Clear;
    ds.Connection := dmSISVisa.FD_ConnSISVISA;
    dmSISVisa.FDtrs_SVisa.StartTransaction;
    ds.sql.Add(sql);
    ds.Prepared := True; // prepara a ds

    try
      ds.ExecSQL; // executa o sql
      dmSISVisa.FDtrs_SVisa.Commit; // salva as modifica��es
      dmSISVisa.FDqryCadastros.Close;
      // fecha e abre o data set para exibi��o dos dados
    except
      on E: Exception do
        raise Exception.Create('Houve um erro ao Excluir dados de (' + Tabela +
          '). " ' + E.Message + #13 + UnitName + '.ExcluirDados."');
    end;

  finally
    // finaliza a query
    FreeAndNil(ds);
  end;
end;

procedure TUtilsView.ImprimirRelatorio(Tabela, Field, Relatorio: String;
  Data1, Data2: TDateEdit; dsRelatorio: TFDQuery);
var
  sql: string;
begin

  // variavel sql recebe seu texto
  sql := '';
  sql := sql + 'select * from ' + Tabela;
  sql := sql + ' where ' + Field + ' between ' +
    QuotedStr(FormatDateTime('dd.mm.yyyy', Data1.Date)) + ' and ' +
    QuotedStr(FormatDateTime('dd.mm.yyyy', Data2.Date));

  // query � criada, fechada, limpa, conectada
  dsRelatorio := TFDQuery.Create(nil);
  try

    dsRelatorio.Close;
    dsRelatorio.sql.Clear;
    dsRelatorio.Connection := dmSISVisa.FD_ConnSISVISA;
    dmSISVisa.FDtrs_SVisa.StartTransaction;
    dsRelatorio.sql.Add(sql);
    dsRelatorio.Open();

    if dsRelatorio.RecordCount > 0 then
    begin

      try
        if Relatorio = 'Denuncias' then
        begin
          with dmRelDenuncias do
          begin
            FDqryRelDenuncias.Close;
            FDqryRelDenuncias.sql.Clear;
            FDqryRelDenuncias.sql.Add(dsRelatorio.sql.Text);
            FDqryRelDenuncias.Prepared := True;
            FDqryRelDenuncias.Open;

            cdsRelDenuncias.Close;
            cdsRelDenuncias.Open;

            pplblPeriodo.Text := 'PERIODO: ' + DateToStr(Data1.Date) + ' � ' +
              DateToStr(Data2.Date);
            pplblTextoRodape.Text := 'RELAT�RIO EMITIDO POR USU�RIO EM ' +
              DateTimeToStr(Now);
            ppDadosRodap�1.Text := pplblTextoRodape.Text;
            pplblPeriodo1.Text := pplblPeriodo.Text;
          end;
        end
        else
        begin
          with dmRelReceitas do
          begin
            FDqryRelReceitas.Close;
            FDqryRelReceitas.sql.Clear;
            FDqryRelReceitas.sql.Add(dsRelatorio.sql.Text);
            FDqryRelReceitas.Prepared := True;
            FDqryRelReceitas.Open;

            cdsRelReceitas.Close;
            cdsRelReceitas.Open;

            pplblPeriodo.Text := 'PERIODO: ' + DateToStr(Data1.Date) + ' � ' +
              DateToStr(Data2.Date);
            pplblTextoRodape.Text := 'RELAT�RIO EMITIDO POR USU�RIO EM ' +
              DateTimeToStr(Now);
          end;
        end;

      except
        on E: Exception do
          raise Exception.Create('Houve um erro ao Imprimir dados de (' + Tabela
            + '). " ' + E.Message + #13 + UnitName + '.ImprimirDados."');
      end;

    end
    else
    begin
      fnc_ExibirMensagem('GERA��O DE LISTA/RELAT�RIO',
        'N�O FORAM ENCOTRADOS DADOS!!!', tpExcluir);
      Abort;
    end;
  finally
    // finaliza a query
    FreeAndNil(dsRelatorio);

  end;
end;

procedure TUtilsView.Incluir(Tabela, Campos, Valores: string; ds: TFDQuery);
var
  sql: string;
begin

  sql := '';
  sql := sql + 'insert into ' + Tabela;
  sql := sql + Campos;
  sql := sql + ' values ';
  sql := sql + '(' + Valores + ')';

  // query � criada, fechada, limpa, conectada
  ds := TFDQuery.Create(nil);
  try
    ds.Close;
    ds.sql.Clear;
    ds.Connection := dmSISVisa.FD_ConnSISVISA;
    dmSISVisa.FDtrs_SVisa.StartTransaction;
    ds.sql.Add(sql);
    ds.Prepared := True; // prepara a ds

    try
      ds.ExecSQL; // executa o sql
      dmSISVisa.FDtrs_SVisa.Commit; // salva as modifica��es
      dmSISVisa.FDqryCadastros.Close;
      // fecha e abre o data set para exibi��o dos dados
    except
      on E: Exception do
        raise Exception.Create('Houve um erro ao Inserir dados de (' + Tabela +
          '). " ' + E.Message + #13 + UnitName + '.InserirDados."');
    end;

  finally
    // finaliza a query
    FreeAndNil(ds);
  end;
end;

procedure TUtilsView.LancarReceita(dtlanc: TDateEdit;
  unidade, tiporec, qtd, num_blocoinicial, folha_inicial, folha_final: Integer;
  status, respo, Tabela: string; dsReceita: TFDQuery);
var
  totalblocos, blocoatual, bloco, finicial, ffinal, fatual: Integer;
  datalanc: TDate;
  medico, responsavel, st, Campos: string;
  I: Integer;
begin

  totalblocos := qtd;
  bloco := num_blocoinicial;
  finicial := folha_inicial;
  datalanc := dtlanc.Date;
  medico := QuotedStr('TESTE');
  responsavel := QuotedStr(respo);
  st := QuotedStr(status);

  fatual := finicial;
  blocoatual := 0;
  ffinal := 0;

  for I := 1 to totalblocos do
  begin
    blocoatual := blocoatual + 1;

    if blocoatual <= totalblocos then
    begin
      case tiporec of
        1:
          begin
            if blocoatual = 1 then
              ffinal := fatual + 49;

            Campos := QuotedStr(IntToStr(unidade)) + ', ' + medico + ', ' +
              QuotedStr(IntToStr(tiporec)) + ', ' +
              QuotedStr(IntToStr(totalblocos)) + ', ' +
              QuotedStr(IntToStr(bloco)) + ', ' + QuotedStr(IntToStr(finicial))
              + ', ' + QuotedStr(IntToStr(ffinal)) + ', ' +
              QuotedStr(FormatDateTime('dd.mm.yyyy', datalanc)) + ', ' + st +
              ', ' + responsavel;

            case blocoatual of
              1, 2, 3, 4, 5, 6, 7, 8, 9, 10:
                begin
                  finicial := finicial + 50;
                  ffinal := ffinal + 50;
                end;

            end;
          end;
        2:
          begin
            if blocoatual = 1 then
              ffinal := fatual + 99;

            Campos := QuotedStr(IntToStr(unidade)) + ', ' + medico + ', ' +
              QuotedStr(IntToStr(tiporec)) + ', ' +
              QuotedStr(IntToStr(totalblocos)) + ', ' +
              QuotedStr(IntToStr(bloco)) + ', ' + QuotedStr(IntToStr(finicial))
              + ', ' + QuotedStr(IntToStr(ffinal)) + ', ' +
              QuotedStr(FormatDateTime('dd.mm.yyyy', datalanc)) + ', ' + st +
              ', ' + responsavel;

            case blocoatual of
              1, 2, 3, 4, 5, 6, 7, 8, 9, 10:
                begin
                  finicial := finicial + 100;
                  ffinal := ffinal + 100;
                end;
            end;
          end;

        3:
          begin
            Campos := QuotedStr(IntToStr(unidade)) + ', ' + medico + ', ' +
              QuotedStr(IntToStr(tiporec)) + ', ' +
              QuotedStr(IntToStr(totalblocos)) + ', ' +
              QuotedStr(IntToStr(bloco)) + ', ' + QuotedStr(IntToStr(finicial))
              + ', ' + QuotedStr(IntToStr(folha_final)) + ', ' +
              QuotedStr(FormatDateTime('dd.mm.yyyy', datalanc)) + ', ' + st +
              ', ' + responsavel;

          end;

      end;
      Incluir(Tabela, FD_TAB_CTRLREC, Campos, dsReceita);
      bloco := bloco + 1;
    end;
  end;

end;

procedure TUtilsView.PreencherReceita(lvd, lvb: TListView;
  numinicio, numfinal, bloco, codReceita: Integer; cdsReceita: TClientDataSet);
var
  lvItem: TListViewItem;
  Campos: string;
  qry: TFDQuery;
begin
  qry := dmSISVisa.FDqryCadastros;
  numinicio := StrToInt(Copy(lvd.Items[lvd.Selected.Index].Text, 16, 6));
  numfinal := StrToInt(Copy(lvd.Items[lvd.Selected.Index].Text, 38, 6));
  bloco := StrToInt(Copy(lvd.Items[lvd.Selected.Index].Data
    [TMultiDetailAppearanceNames.Detail1].ToString, 46, 1));
  Campos := VW_REC_F10 + ' = ' + IntToStr(numinicio) + ' AND ' + VW_REC_F11;
  codReceita := RetornaID(TAB_VWRECEITA, IntToStr(numfinal), VW_REC_F6,
    Campos, qry);

  lvItem := lvb.Items.Add;
  lvItem.Text := lvd.Items[lvd.Selected.Index].Text;
  lvItem.Data[TMultiDetailAppearanceNames.Detail1] :=
    lvd.Items[lvd.Selected.Index].Data
    [TMultiDetailAppearanceNames.Detail1].ToString;
  lvItem.Data[TMultiDetailAppearanceNames.Detail2] :=
    lvd.Items[lvd.Selected.Index].Data
    [TMultiDetailAppearanceNames.Detail2].ToString;
  lvItem.Data[TMultiDetailAppearanceNames.Detail3] :=
    lvd.Items[lvd.Selected.Index].Data
    [TMultiDetailAppearanceNames.Detail3].ToString;

  cdsReceita.Insert;
  cdsReceita.FieldByName(VW_REC_F6).AsInteger := codReceita;
  cdsReceita.FieldByName(VW_REC_F10).AsInteger := numinicio;
  cdsReceita.FieldByName(VW_REC_F11).AsInteger := numfinal;
  cdsReceita.FieldByName(VW_REC_F9).AsInteger := bloco;
  cdsReceita.Post;
end;

function TUtilsView.PreencherRelatorio(Data1, Data2: TDateEdit;
  User: string): string;
begin
  with dmRelDenuncias do
  begin
    Result := 'PERIODO: ' + DateToStr(Data1.Date) + ' � ' +
      DateToStr(Data2.Date);
    pplblTextoRodape.Text := 'RELAT�RIO EMITIDO POR ' + User + ' �S ' +
      DateTimeToStr(Now);
    ppDadosRodap�1.Text := pplblTextoRodape.Text;
  end;

end;

procedure TUtilsView.fnc_ExibirMensagem(Tit, MSG: String; tpMSG: TTipMensagem);
var
  FormMensagem: TfrmMensagemPadrao;
begin
  FormMensagem := TfrmMensagemPadrao.Create(nil);
  FormMensagem.fnc_AtualizarMensagem(Tit, MSG, tpMSG);
  frmSISVISA.ExibirMensagem(FormMensagem.layoutMSG);;
end;

function TUtilsView.RetornaID(Tabela, Value, campo1, campo2: string;
  ds: TFDQuery): Integer;
begin
  ds := TFDQuery.Create(nil);
  ds.Close;
  ds.sql.Clear;
  ds.Connection := dmSISVisa.FD_ConnSISVISA;
  ds.sql.Add('select ' + campo1 + ' from ' + Tabela + ' where ' + campo2 +
    ' = ' + Value);
  ds.Prepared := True;
  ds.Open;

  Result := ds.FieldByName(campo1).AsInteger;
end;

procedure TUtilsView.SetImprimirRel(const Value: tpRelatorio);
begin
  FImprimirRel := Value;
end;

function TUtilsView.ValidarReceita: Boolean;
begin
  Result := True;
end;

function TUtilsView.VerificaProced(valor, prazo, infracao: TEdit): Boolean;
var
  vlr: string;
begin
  Result := false;

  vlr := valor.Text;
  if (vlr = NOTIFICACAO) or (vlr = AUTOINFRACAO) then
    if not(prazo.Text = '') then
      infracao.Text := IntToStr(0)
    else
      Result := True;
end;

end.
