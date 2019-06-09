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
  dsDenunciaAtend.sql.Add('select * from ' + Tabela + ' where codigo_tipodenuncia = '
    + coddet);
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
      infracao.Text := IntToStr(0);
    end
    else
      Result := true;
end;

end.
