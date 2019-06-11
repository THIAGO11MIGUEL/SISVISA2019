unit Classes.Utils.View;

interface

uses
  FireDAC.Comp.Client, FMX.ListBox, FMX.ListView, FMX.Forms, FMX.DateTimeCtrls,
  U_MensagemPadrao, FMX.Edit, Datasnap.DBClient;

type
  TUtilsView = class
  private

  published

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
      Tabela, coddet: string);
    procedure CDTipReceita(lv: TListView; dsTipReceita: TFDQuery;
      Tabela: string);
    procedure CDUnidade(lv: TListView; dsUnidade: TFDQuery; Tabela: string);
    procedure CDReceita(lv: TListView; dsReceitas: TFDQuery; Tabela: string);
    procedure LancarReceita(c1, c2, c3, c4, c5: TEdit; c6: TDateEdit;
      c7, c8: Integer; Tabela: string);
    function RetornaID(Tabela, value, campo1, campo2: string;
      ds: TFDQuery): Integer;
    function ValidarReceita: Boolean;
  end;

implementation

uses
  FMX.Dialogs, U_dmSISVISA, System.SysUtils, FMX.ListView.Appearances,
  MultiDetailAppearanceU, U_SISVISA, Classes.Utils.Consts;

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

  // query é criada, fechada, limpa, conectada
  ds := TFDQuery.Create(nil);
  try

    ds.Close;
    ds.sql.Clear;
    ds.Connection := dmSISVisa.FD_ConnSISVISA;
    dmSISVisa.FDtrs_SVisa.StartTransaction;
    ds.sql.Add(sql);

    try
      ds.ExecSQL; // executa o sql
      dmSISVisa.FDtrs_SVisa.Commit; // salva as modificações
      dmSISVisa.FDqryCadastros.Close;
      // fecha e abre o data set para exibição dos dados
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

procedure TUtilsView.CDCaminho(lv: TListView; dsCaminho: TFDQuery;
  Tabela: string);
var
  lvItem: TListViewItem;
begin
  dsCaminho := TFDQuery.Create(nil);

  dsCaminho.Close;
  dsCaminho.sql.Clear;
  dsCaminho.Connection := dmSISVisa.FD_ConnSISVISA;
  dsCaminho.sql.Add('select * from ' + Tabela);
  dsCaminho.Prepared := true;
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
      raise Exception.Create('Não há Dados para Listar!!!');
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
  dsDenuncia.Prepared := true;
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
      raise Exception.Create('Não há Dados para Listar!!!');
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
  dsDenunciaAtend.Prepared := true;
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
      raise Exception.Create('Não há Dados para Listar!!!');
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
  dsDenunciaDet.Prepared := true;
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
      raise Exception.Create('Não há Dados para Listar!!!');
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
  dsProcedDenuncia.Prepared := true;
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
      raise Exception.Create('Não há Dados para Listar!!!');
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
  dsReceitas.Prepared := true;
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
          'DATA DE LANÇAMENTO: ' + dsReceitas.FieldByName('data_lanc').AsString;
        lvItem.Data[TMultiDetailAppearanceNames.Detail2] := 'Nº BLOCO: ' +
          dsReceitas.FieldByName('num_bloco').AsString + '   QTD BLOCOS: ' +
          INTTOSTR(dsReceitas.FieldByName('QUANTIDADE').AsInteger);
        lvItem.Data[TMultiDetailAppearanceNames.Detail3] := 'UNIDADE DE SAÚDE: '
          + dsReceitas.FieldByName('UNIDADE').AsString + '   TIPO DE RECEITA: '
          + dsReceitas.FieldByName('TIPO_RECEITA').AsString;
        dsReceitas.Next;
      end;

      lv.EndUpdate;
    end;

  except
    on E: Exception do
      raise Exception.Create('Não há Dados para Listar!!!');
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
  dsTipDenuncia.Prepared := true;
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
      raise Exception.Create('Não há Dados para Listar!!!');
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
  dsTipReceita.Prepared := true;
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
      raise Exception.Create('Não há Dados para Listar!!!');
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
  dsUnidade.Prepared := true;
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
      raise Exception.Create('Não há Dados para Listar!!!');
  end;

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
  dsArtigo.Prepared := true;
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
        lvItem.Text := INTTOSTR(dsArtigo.FieldByName('num_artigo').AsInteger);
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
      raise Exception.Create('Não há Dados para Listar!!!');
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

  // query é criada, fechada, limpa, conectada
  ds := TFDQuery.Create(nil);
  try

    ds.Close;
    ds.sql.Clear;
    ds.Connection := dmSISVisa.FD_ConnSISVISA;
    dmSISVisa.FDtrs_SVisa.StartTransaction;
    ds.sql.Add(sql);
    ds.Prepared := true; // prepara a ds

    try
      ds.ExecSQL; // executa o sql
      dmSISVisa.FDtrs_SVisa.Commit; // salva as modificações
      dmSISVisa.FDqryCadastros.Close;
      // fecha e abre o data set para exibição dos dados
    except
      on E: Exception do
        raise Exception.Create
          ('Houve um erro ao Excluir dados de (CAMINHO DO BANCO). " ' +
          E.Message + #13 + UnitName + '.ExcluirDados."');
    end;

  finally
    // finaliza a query
    FreeAndNil(ds);
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

  // query é criada, fechada, limpa, conectada
  ds := TFDQuery.Create(nil);
  try

    ds.Close;
    ds.sql.Clear;
    ds.Connection := dmSISVisa.FD_ConnSISVISA;
    dmSISVisa.FDtrs_SVisa.StartTransaction;
    ds.sql.Add(sql);
    ds.Prepared := true; // prepara a ds

    try
      ds.ExecSQL; // executa o sql
      dmSISVisa.FDtrs_SVisa.Commit; // salva as modificações
      dmSISVisa.FDqryCadastros.Close;
      // fecha e abre o data set para exibição dos dados
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

procedure TUtilsView.LancarReceita(c1, c2, c3, c4, c5: TEdit; c6: TDateEdit;
  c7, c8: Integer; Tabela: string);
var
  total_blocos, bloco_atual, bloco, folha_inicial, folha_final, folha_atual,
    I: Integer;
  data_lanc: TDate;
  unidade, tipo, medico, respo, status, Campos: string;
begin
  total_blocos := StrToInt(c1.Text);
  bloco := StrToInt(c2.Text);
  folha_inicial := StrToInt(c3.Text);
  status := (c4.Text);
  data_lanc := c6.Date;
  respo := c5.Text;

  bloco_atual := 0;
  folha_atual := folha_inicial;

  for I := 1 to total_blocos do
  begin
    bloco_atual := bloco_atual + 1;

    case c8 of
     1: folha_atual := folha_atual + 49;
     2: folha_atual := folha_atual + 99;
    end;

    Campos := c7 + ',' + medico + ',' + c8 + ',' + INTTOSTR(total_blocos) + ','
      + INTTOSTR(bloco_atual) + ',' + INTTOSTR(folha_inicial) + ',' + IntToStr(folha_atual) + ',' +
      FormatDateTime('dd.mm.yyyy', data_lanc) + ',' + status + ',' + respo;
    Incluir(Tabela, FD_TAB_DEN);

    case c8 of
      1: folha_inicial := folha_inicial + 50;
    end;
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

function TUtilsView.RetornaID(Tabela, value, campo1, campo2: string;
  ds: TFDQuery): Integer;
begin
  ds := TFDQuery.Create(nil);
  ds.Close;
  ds.sql.Clear;
  ds.Connection := dmSISVisa.FD_ConnSISVISA;
  ds.sql.Add('select ' + campo1 + ' from ' + Tabela + ' where ' + campo2 +
    ' = ' + value);
  ds.Prepared := true;
  ds.Open;

  Result := ds.FieldByName(campo1).AsInteger;
end;

function TUtilsView.ValidarReceita: Boolean;
begin
  Result := true;
end;

function TUtilsView.VerificaProced(valor, prazo, infracao: TEdit): Boolean;
var
  vlr: string;
begin
  vlr := valor.Text;
  if (vlr = NOTIFICACAO) or (vlr = AUTOINFRACAO) then
    if not(prazo.Text = '') then
    begin
      Result := False;
      infracao.Text := INTTOSTR(0);
    end
    else
      Result := true;
end;

end.
