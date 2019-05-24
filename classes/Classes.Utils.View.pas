unit Classes.Utils.View;

interface

uses
  FireDAC.Comp.Client, FMX.ListBox, FMX.ListView;

type
  TUtilsView = class
  private

  published

  public
    procedure Incluir(Tabela, Campos, Valores: string; ds: TFDQuery);
    procedure Alterar(Tabela, Campos: string; ds: TFDQuery);
    procedure Deletar(Tabela, Campos: string; ds: TFDQuery);
    procedure CDCaminho(lv: TListView; dsCaminho: TFDQuery; Tabela: string);
    procedure CDArtigo(lv: TListView; dsArtigo: TFDQuery; Tabela: string);
    function RetornaID(Tabela, value, campo1, campo2: string; dsCaminho: TFDQuery): Integer;
  end;

implementation

uses
  FMX.Dialogs, U_dmSISVISA, System.SysUtils, FMX.ListView.Appearances,
  MultiDetailAppearanceU;

{ TUtilsView }

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
        lvItem.Data[TMultiDetailAppearanceNames.Detail1] :=
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
  // sql := sql + ' (descricao, caminho_bd)';
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
        raise Exception.Create
          ('Houve um erro ao Inserir dados de (CAMINHO DO BANCO). " ' +
          E.Message + #13 + UnitName + '.InserirDados."');
    end;

  finally
    // finaliza a query
    FreeAndNil(ds);
  end;
end;

function TUtilsView.RetornaID(Tabela, value, campo1, campo2: string; dsCaminho: TFDQuery): Integer;
begin
  dsCaminho := TFDQuery.Create(nil);
  dsCaminho.Close;
  dsCaminho.sql.Clear;
  dsCaminho.Connection := dmSISVisa.FD_ConnSISVISA;
  dsCaminho.sql.Add('select ' + campo1 +' from ' + Tabela +
    ' where ' + campo2 + '= ' + value);
  dsCaminho.Prepared := true;
  dsCaminho.Open;

  Result := dsCaminho.FieldByName(campo1).AsInteger;
end;

end.
