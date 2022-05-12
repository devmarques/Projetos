unit fLocacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBase, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.DBCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxDBEdit, Vcl.Mask, Vcl.Menus, cxButtons, System.Actions,
  Vcl.ActnList;

type
  TfrmLocacao = class(TfrmBase)
    btnFinalizar: TSpeedButton;
    gridProdutoLocacao: TDBGrid;
    pnlPrincipal: TPanel;
    pnlCadastroLocacao: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    pnlProduto: TPanel;
    Label6: TLabel;
    sbPesquisaProduto: TEdit;
    sbPesquisaCliente: TSearchBox;
    Label2: TLabel;
    gbProduto: TGroupBox;
    Label9: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    gridProduto: TDBGrid;
    btnImprimir: TSpeedButton;
    memoCliente: TMemo;
    Label7: TLabel;
    edtQuantidade: TEdit;
    pnlDadosProdutoLocacao: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Panel3: TPanel;
    btnAdicionarProduto: TcxButton;
    btnDevolverProduto: TcxButton;
    btnCancelarProduto: TcxButton;
    btnExcluirProduto: TcxButton;
    DBMemo1: TDBMemo;
    gridCliente: TDBGrid;
    procedure sbPesquisaProdutoChange(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbPesquisaClienteChange(Sender: TObject);
    procedure gridClienteExit(Sender: TObject);
    procedure gridClienteDblClick(Sender: TObject);
    procedure gridProdutoDblClick(Sender: TObject);
    procedure gridProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure gridProdutoEnter(Sender: TObject);
    procedure gridProdutoExit(Sender: TObject);
    procedure gridProdutoLocacaoCellClick(Column: TColumn);
    procedure gridProdutoLocacaoDblClick(Sender: TObject);
    procedure gridProdutoLocacaoKeyPress(Sender: TObject; var Key: Char);
    procedure gridProdutoLocacaoEnter(Sender: TObject);
    procedure gridProdutoLocacaoExit(Sender: TObject);
    procedure tsRegistroShow(Sender: TObject);
    procedure gridClienteEnter(Sender: TObject);
    procedure gridClienteKeyPress(Sender: TObject; var Key: Char);
    procedure btnFinalizarClick(Sender: TObject);
    procedure gridProdutoLocacaoDrawColumnCell(Sender: TObject;
      const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gridDrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnAdicionarProdutoClick(Sender: TObject);
    procedure btnCancelarProdutoClick(Sender: TObject);
    procedure btnDevolverProdutoClick(Sender: TObject);
    procedure sbPesquisaChange(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirProdutoClick(Sender: TObject);
  private
    { Private declarations } idProdutoSelecionado: Integer;
    procedure preencheDadosCliente(memo: TMemo;
      endereco, bairro, cidade, nome: string);
    procedure habilitaComponentes;
    procedure validaLocacao;
    function validaFinalizarLocacao: boolean;
    procedure selecionaProduto;
    procedure adicionaProdutoLocacao;
    procedure excluiProdutoLocacao;

  public
    { Public declarations }
  end;

var
  frmLocacao: TfrmLocacao;

implementation

{$R *.dfm}

uses Data;

procedure TfrmLocacao.btnCadastrarClick(Sender: TObject);
begin
  inherited;
  with dm do
  begin
    qLocacao.Insert;
    habilitaMenus(qLocacao);
    qLocacaodatalocacao.AsDateTime := now;
    qLocacaoidusuario.Value := dm.usuarioLogado;
    habilitaComponentes;
  end;
end;

procedure TfrmLocacao.btnCancelarClick(Sender: TObject);
begin
  dm.qLocacao.Cancel;
  habilitaMenus(dm.qLocacao);
  inherited;

end;

procedure TfrmLocacao.btnEditarClick(Sender: TObject);
begin
  inherited;
  with dm do
  begin
    if (validaedicao(qLocacao) > 0) then
    begin
      qLocacao.Edit;
      habilitaMenus(qLocacao);
      pnlProduto.Visible := not false;
      preencheDadosCliente(memoCliente, qLocacaoendereco.AsString,
        qLocacaobairro.AsString, qLocacaoCidade.AsString,
        qLocacaocliente.AsString);
      habilitaComponentes;
    end;
  end;
end;

procedure TfrmLocacao.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if (validaexclusao(dm.qLocacao) > 0) then
  begin
    if (validaFinalizarLocacao = true) then
    begin
      dm.executaQuery('delete from historicolocacao where idproduto = ' +
        dm.qProdutoidproduto.AsString, dm.qAux);
    end;
    dm.qLocacao.delete;
    habilitaMenus(dm.qLocacao);
  end;
end;

procedure TfrmLocacao.btnExcluirProdutoClick(Sender: TObject);
begin
  inherited;
  excluiProdutoLocacao
end;

procedure TfrmLocacao.btnFinalizarClick(Sender: TObject);
begin
  inherited;
  WITH dm DO
  BEGIN
    if (validaFinalizarLocacao = true) then
    begin
      qLocacaodatadevolucao.AsDateTime := now;
      qLocacaolocacaoencerrada.Value := 1;
      validaLocacao;
      btnCancelar.Click;
    end;
  END;
end;

procedure TfrmLocacao.btnSalvarClick(Sender: TObject);
begin
  inherited;
  validaLocacao;
  // habilitaMenus(dm.qLocacao);
end;

procedure TfrmLocacao.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  KeyPreview := false;
end;

procedure TfrmLocacao.DBMemo1Exit(Sender: TObject);
begin
  inherited;
  KeyPreview := not false;
end;

procedure TfrmLocacao.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  with dm do
  begin
    if (qProdutoLocacao.State in [dsEdit]) then
    begin
      btnDevolverProduto.SetFocus;
    end
    else
    begin
      btnAdicionarProduto.SetFocus;
    end;
  end;
end;

procedure TfrmLocacao.excluiProdutoLocacao;
begin
  with dm do
  begin
    if not(qProdutoLocacaoquantidadedevolvida.Value > 0) then
    begin
      dm.atualizaEstoque(dm.qProdutoLocacaoquantidade.Value, 'exclusao');

      dm.executaQuery('delete from historicolocacao where idprodutolocacao = ' +
        dm.qProdutoLocacaoidprodutolocacao.AsString, dm.qAux);
      dm.qProdutoLocacao.delete;
    end
    else
    begin
      MessageDlg
        ('O produto não pode ser excluído, pois já está em processo de devolução.',
        mtWarning, [mbok], 0);
    end;
  end;
end;

procedure TfrmLocacao.btnDevolverProdutoClick(Sender: TObject);
begin
  inherited;
  with dm do
  begin
    if (qProdutoLocacao.State in [dsEdit, dsInsert]) then
    begin
      if (qProdutoLocacaoquantidadedevolvida.Value +
        StrToFloat(edtQuantidade.Text) > qProdutoLocacaoquantidade.Value) then
      begin
        MessageDlg
          ('A quantidade de devolução informada juntamente ao que já foi devolvido não pode ser superior a quantidade locada.',
          mtError, [mbok], 0);
        qProdutoLocacao.Cancel;
        gridProdutoLocacaoDblClick(self);
        exit
      end;

      qProdutoLocacaoquantidadedevolvida.AsFloat :=
        qProdutoLocacaoquantidadedevolvida.AsFloat +
        StrToFloat(edtQuantidade.Text);

      qProdutoLocacao.Post;
      dm.atualizaEstoque(StrToFloat(edtQuantidade.Text), 'devolucao');
      qProdutoLocacao.Refresh;
      gridProdutoLocacao.SetFocus;
    end
    else
    begin
      MessageDlg('Não há nenhum dado informado para inclusão.', mtWarning,
        [mbok], 0);
    end;
  end;
end;

procedure TfrmLocacao.btnCancelarProdutoClick(Sender: TObject);
begin
  inherited;
  if (dm.qProdutoLocacao.State in [dsEdit, dsInsert]) then
  begin
    dm.qProdutoLocacao.Cancel;
    sbPesquisaProduto.SetFocus;
  end;
end;

procedure TfrmLocacao.adicionaProdutoLocacao;
begin
  with dm do
  begin
    if (qProdutoLocacao.State in [dsEdit, dsInsert]) and
      (idProdutoSelecionado > 0) then
    begin
      qProdutoLocacaoidproduto.Value := idProdutoSelecionado;
      qProdutoLocacaoidlocacao.Value := qLocacaoidlocacao.Value;
      qProdutoLocacaoquantidade.Value := qProdutoLocacaoquantidade.Value +
        StrToFloat(edtQuantidade.Text);
      qProdutoLocacao.Post;

      qProdutoLocacao.Refresh;
      atualizaEstoque(StrToFloat(edtQuantidade.Text), 'locacao');
      edtQuantidade.Text := EmptyStr;

      sbPesquisaProduto.SetFocus;
    end
    else
    begin
      MessageDlg('Não há nenhum dado informado para inclusão.', mtWarning,
        [mbok], 0);
    end;
  end;
end;

procedure TfrmLocacao.btnAdicionarProdutoClick(Sender: TObject);
begin
  inherited;
  adicionaProdutoLocacao;
end;

procedure TfrmLocacao.sbPesquisaProdutoChange(Sender: TObject);
begin
  inherited;
  dm.pesquisaRegistros('descricao', dm.sqlProduto, sbPesquisaProduto.Text,
    dm.qProduto);

  if (trim(sbPesquisaProduto.Text) <> EmptyStr) then
  begin
    gridProduto.Visible := true;
  end;
end;

procedure TfrmLocacao.selecionaProduto;
begin
  with dm do
  begin
    if (qProdutoidproduto.Value > 0) then
    begin
      if (qProdutoquantidade.Value > 0) then
      begin
        qProdutoLocacao.Insert;
        idProdutoSelecionado := qProdutoidproduto.Value;
        gridProduto.Visible := false;
        pnlDadosProdutoLocacao.Visible := false;
        edtQuantidade.SetFocus;
      end
      else
      begin
        MessageDlg
          ('O produto selecionado não pode ser locado por não haver estoque disponivél.',
          mtWarning, [mbok], 0);
      end;
    end;
  end;
end;

procedure TfrmLocacao.tsRegistroShow(Sender: TObject);
begin
  inherited;
  dm.qLocacao.Refresh;
  btnFinalizar.Visible := false;
end;

function TfrmLocacao.validaFinalizarLocacao: boolean;
begin
  with dm do
  begin
    qProdutoLocacao.Cancel;
    qProdutoLocacao.First;

    while not qProdutoLocacao.Eof do
    begin
      if (qProdutoLocacaoquantidaderestante.Value <> 0) then
      begin
        MessageDlg
          ('Não é possível finalizar ou excluir a locação, pois ainda existem produtos a serem devolvidos.',
          mtInformation, [mbok], 0);
        Result := not true;
        exit
      end
      else
      begin
        qProdutoLocacao.Next;
      end;
    end;
    Result := true;
  end;
end;

procedure TfrmLocacao.validaLocacao;
begin
  if (dm.qLocacaoidcliente.Value > 0) then
  begin
    dm.qLocacao.Post;

    dm.qLocacao.Edit;

    habilitaComponentes;
  end
  else
  begin
    MessageDlg
      ('Não foi possível cadastrar a locação. O cliente não foi informado.',
      mtWarning, [mbok], 0);
  end;
end;

procedure TfrmLocacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.fechaConexoes;
  inherited;
end;

procedure TfrmLocacao.FormCreate(Sender: TObject);
begin
  inherited;
  with dm do
  begin
    qLocacao.Open();
    qUsuario.Open();
    if (devolucaoPendente > 0) then
    begin
      abreQuery(sqlLocacao +
        'WHERE DATE(LOCACAO.previsaodevolucao) <= CURDATE() ORDER BY locacao.IDLOCACAO',
        qLocacao);
    end;
  end;
end;

procedure TfrmLocacao.gridClienteDblClick(Sender: TObject);
begin
  inherited;
  with dm do
  begin
    if (qClienteidcliente.Value > 0) then
    begin
      qLocacaoidcliente.Value := qClienteidcliente.Value;
      sbPesquisaCliente.Text := dm.qClientenome.AsString;

      preencheDadosCliente(memoCliente, qClienteendereco.AsString,
        qClientebairro.AsString, qClienteCidade.AsString,
        qClientenome.AsString);
      gridCliente.Visible := false;
    end;
  end;
end;

procedure TfrmLocacao.gridClienteEnter(Sender: TObject);
begin
  inherited;
  KeyPreview := not true;
end;

procedure TfrmLocacao.gridClienteExit(Sender: TObject);
begin
  inherited;
  KeyPreview := true;
  if (dm.qLocacaoidcliente.Value > 0) then
  begin
    // gridCliente.Visible := false;
  end;
end;

procedure TfrmLocacao.gridClienteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
  begin
    gridClienteDblClick(self);
  end;
end;

procedure TfrmLocacao.gridDrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (dm.qLocacaolocacaoencerrada.Value = 1) then
  begin
    (Sender as TDBGrid).Canvas.Brush.Color := clInactiveCaption;

    grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmLocacao.gridProdutoDblClick(Sender: TObject);
begin
  inherited;
  selecionaProduto;
end;

procedure TfrmLocacao.gridProdutoEnter(Sender: TObject);
begin
  inherited;
  KeyPreview := not true;
end;

procedure TfrmLocacao.gridProdutoExit(Sender: TObject);
begin
  inherited;
  KeyPreview := true;
end;

procedure TfrmLocacao.gridProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
  begin
    gridProdutoDblClick(self);
  end;
end;

procedure TfrmLocacao.gridProdutoLocacaoCellClick(Column: TColumn);
begin
  inherited;
  dm.qProdutoLocacao.Edit;
  pnlDadosProdutoLocacao.Visible := true;
  gridProduto.Visible := not true;
  edtQuantidade.Text := dm.qProdutoLocacaoquantidaderestante.AsString;
end;

procedure TfrmLocacao.gridProdutoLocacaoDblClick(Sender: TObject);
begin
  inherited;

  dm.qProdutoLocacao.Edit;
  gridProduto.Visible := not true;
  edtQuantidade.Text := dm.qProdutoLocacaoquantidaderestante.AsString;
  edtQuantidade.SetFocus;
end;

procedure TfrmLocacao.gridProdutoLocacaoDrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  with dm do
  begin
    if (Column.Field.FieldName = 'quantidaderestante') and
      (qProdutoLocacaoquantidaderestante.Value = 0) then
    begin
      gridProdutoLocacao.Canvas.Brush.Color := clMoneyGreen;
      grid.Canvas.Font.Color := clred;
      gridProdutoLocacao.Canvas.FillRect(Rect);
      gridProdutoLocacao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;
end;

procedure TfrmLocacao.gridProdutoLocacaoEnter(Sender: TObject);
begin
  inherited;
  KeyPreview := false;
end;

procedure TfrmLocacao.gridProdutoLocacaoExit(Sender: TObject);
begin
  inherited;
  KeyPreview := not false;
end;

procedure TfrmLocacao.gridProdutoLocacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
  begin
    gridProdutoLocacaoDblClick(self);
  end;
end;

procedure TfrmLocacao.habilitaComponentes;
begin
  with dm do
  begin
    if not(qLocacao.State in [dsInsert]) then
    begin
      pnlProduto.Visible := not false;
      gridProdutoLocacao.Visible := not false;
      btnFinalizar.Visible := not false;
      btnImprimir.Visible := not false;
    end
    else
    begin
      memoCliente.Lines.Clear;
      sbPesquisaCliente.Text := EmptyStr;
      gridProdutoLocacao.Visible := false;
      pnlProduto.Visible := false;
      btnFinalizar.Visible := false;
      btnImprimir.Visible := false;
    end;
  end;
end;

procedure TfrmLocacao.preencheDadosCliente(memo: TMemo;
  endereco, bairro, cidade, nome: string);
begin
  if (dm.qLocacaoidcliente.Value > 0) then
  begin
    memo.Lines.Clear;
    memo.Lines.Add(endereco + ' - ' + bairro + ' - ' + cidade);
    sbPesquisaCliente.Text := nome;
    gridCliente.Visible := false;
  end;
end;

procedure TfrmLocacao.sbPesquisaChange(Sender: TObject);
begin
  inherited;
  dm.pesquisaRegistros('cliente.NOME', dm.sqlLocacao, sbPesquisa.Text,
    dm.qLocacao);
end;

procedure TfrmLocacao.sbPesquisaClienteChange(Sender: TObject);
begin
  inherited;
  with dm do
  begin
    dm.pesquisaRegistros('cliente.NOME', dm.sqlCLIENTE, sbPesquisaCliente.Text,
      dm.qcliente);
    if (trim(sbPesquisaCliente.Text) <> EmptyStr) then
    begin
      gridCliente.Visible := true;
    end;
  end;
end;

end.
