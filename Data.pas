unit Data;

interface

uses
  System.SysUtils, System.Classes, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  Winapi.Messages,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  Tdm = class(TDataModule)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    cnx: TFDConnection;
    qProduto: TFDQuery;
    dsProduto: TDataSource;
    qProdutoidproduto: TFDAutoIncField;
    qProdutodescricao: TStringField;
    qProdutoquantidade: TSingleField;
    qProdutoquantidadealocado: TSingleField;
    qHistorico: TFDQuery;
    dsHistorico: TDataSource;
    qHistoricoidproduto: TIntegerField;
    qHistoricoidusuario: TIntegerField;
    qHistoricodescricao: TStringField;
    qHistoricoentradasaida: TShortintField;
    qHistoricodataalteracao: TDateTimeField;
    qLocacao: TFDQuery;
    dsLocacao: TDataSource;
    qLocacaoidlocacao: TFDAutoIncField;
    qLocacaoidcliente: TIntegerField;
    qLocacaodatalocacao: TDateTimeField;
    qLocacaoidusuario: TIntegerField;
    qLocacaolocacaoencerrada: TShortintField;
    qLocacaodatadevolucao: TDateTimeField;
    qLocacaoCliente: TStringField;
    qProdutoLocacao: TFDQuery;
    dsProdutoLocacao: TDataSource;
    qProdutoLocacaoidproduto: TIntegerField;
    qProdutoLocacaoidlocacao: TIntegerField;
    qProdutoLocacaoquantidade: TSingleField;
    qProdutoLocacaoProduto: TStringField;
    qUsuario: TFDQuery;
    dsUsuario: TDataSource;
    qUsuarioidusuario: TFDAutoIncField;
    qUsuarionome: TStringField;
    qHistoricoidhistorico: TFDAutoIncField;
    qUsuariosenha: TStringField;
    qCliente: TFDQuery;
    dsCliente: TDataSource;
    qClienteidcliente: TFDAutoIncField;
    qClientenome: TStringField;
    qCidade: TFDQuery;
    dsCidade: TDataSource;
    qClientecpf: TStringField;
    qClienteendereco: TStringField;
    qClientebairro: TStringField;
    qClientecodigoibge: TIntegerField;
    qClienteCidade: TStringField;
    qClienteuf: TStringField;
    qLocacaoUsuário: TStringField;
    qCidadecodigoibge: TIntegerField;
    qCidadenome: TStringField;
    qCidadeuf: TStringField;
    qProdutoLocacaoquantidadedevolvida: TSingleField;
    qProdutocodigo: TStringField;
    qLocacaoendereco: TStringField;
    qLocacaobairro: TStringField;
    qLocacaoCidade: TStringField;
    qProdutoLocacaoidprodutolocacao: TFDAutoIncField;
    qProdutoLocacaoquantidaderestante: TFloatField;
    qHistoricoidprodutolocacao: TIntegerField;
    qAux: TFDQuery;
    dsAux: TDataSource;
    qLocacaoprevisaodevolucao: TDateTimeField;
    qLocacaoobservacao: TStringField;
    procedure qHistoricoBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qLocacaoAfterEdit(DataSet: TDataSet);
    procedure qProdutoLocacaoAfterEdit(DataSet: TDataSet);
    procedure qProdutoLocacaoCalcFields(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    sqlLocacao, sqlProdutoLocacao, sqlCidade, sqlCliente, sqlProduto,
      sqlUsuario: string;
    usuarioLogado, devolucaoPendente: integer;

    procedure atualizaHistorico(tipoAlteracao, produto: integer;
      quantidadeAlterada: double; descricao: String);

    procedure atualizaEstoque(quantidadeAlterada: double; tipo: string);

    procedure abreQuery(sql: string; query: TFDQuery);
    procedure executaQuery(sql: string; query: TFDQuery);
    procedure pesquisaRegistros(parametro, sql, texto: string; query: TFDQuery);
    procedure fechaConexoes;

  end;

var
  dm: Tdm;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}
{ Tdm }

procedure Tdm.abreQuery(sql: string; query: TFDQuery);
begin
  query.Close;
  query.sql.Clear;
  query.sql.Add(sql);
  query.Prepare;
  query.Open();
end;

procedure Tdm.executaQuery(sql: string; query: TFDQuery);
begin
  query.Close;
  query.sql.Clear;
  query.sql.Add(sql);
  query.ExecSQL;
end;

procedure Tdm.fechaConexoes;
begin
  qProduto.Close;
  qCliente.Close;
  qCidade.Close;
  qLocacao.Close;
  qProdutoLocacao.Close;
  qHistorico.Close;
end;

procedure Tdm.atualizaEstoque(quantidadeAlterada: double; tipo: string);
begin
  if not(qProduto.State in [dsInsert]) then
  begin
    qProduto.Edit;
  end;
  qHistorico.Open();

  if (tipo = 'entrada') then
  begin
    qProdutoquantidade.Value := qProdutoquantidade.Value + quantidadeAlterada;

    if not(qProduto.State in [dsInsert]) and (qProdutoidproduto.AsInteger > 0)
    then
    begin
      atualizaHistorico(0, qProdutoidproduto.AsInteger, quantidadeAlterada,
        'Foi adicionado um total de: ' + floatToStr(quantidadeAlterada) +
        ' ao estoque, alterando o total de estoque para: ' +
        qProdutoquantidade.AsString + ' através do usuário: ' +
        qUsuarionome.AsString);
    end;
  end;

  if (tipo = 'saida') then
  begin
    qProdutoquantidade.Value := qProdutoquantidade.Value - quantidadeAlterada;

    atualizaHistorico(1, qProdutoidproduto.AsInteger, quantidadeAlterada,
      'Foi subtraido um total de: ' + floatToStr(quantidadeAlterada) +
      ' do estoque, alterando o total de estoque disponível para: ' +
      qProdutoquantidade.AsString + ' através do usuário: ' +
      qUsuarionome.AsString);
  end;

  if (tipo = 'locacao') then
  begin
    qProdutoquantidade.Value := qProdutoquantidade.Value - quantidadeAlterada;
    qProdutoquantidadealocado.Value := qProdutoquantidadealocado.Value +
      quantidadeAlterada;

    atualizaHistorico(1, qProdutoidproduto.AsInteger, quantidadeAlterada,
      'Foi locado um total de: ' + floatToStr(quantidadeAlterada) +
      ' para o cliente:  ' + dm.qLocacaoCliente.AsString + ' no endereço: ' +
      dm.qLocacaoendereco.AsString + '. Estoque disponível atual: ' +
      qProdutoquantidade.AsString +
      '. A locação dessa quantidade corresponde a locação de Nº ' +
      dm.qLocacaoidlocacao.AsString + ' através do usuário: ' +
      qUsuarionome.AsString);
  end;

  if (tipo = 'exclusao') then
  begin
    qProdutoquantidade.Value := qProdutoquantidade.Value + quantidadeAlterada;
    qProdutoquantidadealocado.Value := qProdutoquantidadealocado.Value -
      quantidadeAlterada;

    { atualizaHistorico(0, qProdutoidproduto.AsInteger, quantidadeAlterada,
      'Produto excluído de locação em um total de: ' +
      floatToStr(quantidadeAlterada) + ' do cliente:  ' +
      dm.qLocacaoCliente.AsString + ' do endereço: ' +
      dm.qLocacaoendereco.AsString + '. Estoque disponível atual: ' +
      qProdutoquantidade.AsString +
      '. A locação dessa quantidade corresponde a locação de Nº ' +
      dm.qLocacaoidlocacao.AsString + ' através do usuário: ' +
      qUsuarionome.AsString); }
  end;

  if (tipo = 'devolucao') then
  begin
    qProdutoquantidade.Value := qProdutoquantidade.Value + quantidadeAlterada;
    qProdutoquantidadealocado.Value := qProdutoquantidadealocado.Value -
      quantidadeAlterada;

    atualizaHistorico(0, qProdutoidproduto.AsInteger, quantidadeAlterada,
      'Devolução do produto em locação de um total de: ' +
      floatToStr(quantidadeAlterada) + ' do cliente:  ' +
      dm.qLocacaoCliente.AsString + ' do endereço: ' +
      dm.qLocacaoendereco.AsString + '. Estoque disponível atual: ' +
      qProdutoquantidade.AsString +
      '. A locação dessa quantidade corresponde a locação de Nº ' +
      dm.qLocacaoidlocacao.AsString + ' através do usuário: ' +
      qUsuarionome.AsString);
  end;

  if not(qProduto.State in [dsInsert]) then
  begin
    qProduto.Post;
  end;
end;

procedure Tdm.atualizaHistorico(tipoAlteracao, produto: integer;
  quantidadeAlterada: double; descricao: String);
begin
  if (produto > 0) then
  begin
    qHistorico.Insert;
    if (qProdutoLocacao.Active = true) and
      (qProdutoLocacaoidprodutolocacao.AsInteger > 0) then
    begin
      qHistoricoidprodutolocacao.AsInteger :=
        dm.qProdutoLocacaoidprodutolocacao.Value;
    end;
    qHistoricoidproduto.Value := produto;
    qHistoricoidusuario.Value := qUsuarioidusuario.Value;
    qHistoricodataalteracao.Value := Now;
    qHistoricoentradasaida.Value := tipoAlteracao;
    qHistoricodescricao.Value := descricao;
    qHistorico.Post;
  end;

end;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  sqlCliente := qCliente.sql.Text;
  sqlProduto := qProduto.sql.Text;
  sqlLocacao := qLocacao.sql.Text;
  sqlUsuario := qUsuario.sql.Text;
  sqlProdutoLocacao := qProdutoLocacao.sql.Text;
  sqlCidade := qCidade.sql.Text;
end;

procedure Tdm.pesquisaRegistros(parametro, sql, texto: string; query: TFDQuery);
begin
  query.Close;
  query.sql.Clear;
  if (texto <> EmptyStr) then
  begin
    query.sql.Add(sql + ' WHERE ' + parametro + ' LIKE "%' + texto +
      '%"  ORDER BY ' + parametro);
  end
  else
  begin
    query.sql.Add(sql);
  end;
  query.Open();
end;

procedure Tdm.qHistoricoBeforeOpen(DataSet: TDataSet);
begin
  qHistorico.ParamByName('idproduto').Value := qProdutoidproduto.Value;
end;

procedure Tdm.qLocacaoAfterEdit(DataSet: TDataSet);
begin
  pesquisaRegistros('produtolocacao.idlocacao', sqlProdutoLocacao,
    qLocacaoidlocacao.AsString, qProdutoLocacao);
end;

procedure Tdm.qProdutoLocacaoAfterEdit(DataSet: TDataSet);
begin
  dm.pesquisaRegistros('idproduto', dm.sqlProduto,
    qProdutoLocacaoidproduto.AsString, dm.qProduto);
end;

procedure Tdm.qProdutoLocacaoCalcFields(DataSet: TDataSet);
begin
  qProdutoLocacaoquantidaderestante.Value := qProdutoLocacaoquantidade.Value -
    qProdutoLocacaoquantidadedevolvida.Value;
end;

end.
