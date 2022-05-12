unit fProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBase, Data.DB, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.ComCtrls,
  Vcl.Mask, Vcl.Buttons, System.ImageList, Vcl.ImgList, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxButtons, System.Actions, Vcl.ActnList;

type
  TfrmProduto = class(TfrmBase)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtDescricao: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    gridHistorico: TDBGrid;
    Panel2: TPanel;
    edtEstoque: TEdit;
    BalloonHint1: TBalloonHint;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    btnAdicionar: TcxButton;
    Label9: TLabel;
    btnSubtrair: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure tsRegistroShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure tsCadastroEnter(Sender: TObject);
    procedure gridHistoricoDrawColumnCell(Sender: TObject;
      const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure sbPesquisaChange(Sender: TObject);
    procedure gridDrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnSubtrairClick(Sender: TObject);
  private
    { Private declarations }
    procedure validaProduto(edt: TDBEdit);
    function validaDependenciasParaExclusao: boolean;
    procedure salvarProduto;

  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

{$R *.dfm}

uses Data;

procedure TfrmProduto.btnCadastrarClick(Sender: TObject);
begin
  inherited;
  cadastrarNovoRegistro(dm.qProduto);
end;

procedure TfrmProduto.btnCancelarClick(Sender: TObject);
begin
  dm.qProduto.Cancel;
  habilitaMenus(dm.qProduto);
  inherited;

end;

procedure TfrmProduto.btnEditarClick(Sender: TObject);
begin
  editarRegistro(dm.qProduto);
end;

procedure TfrmProduto.btnExcluirClick(Sender: TObject);
begin
  dm.executaQuery('delete from historicolocacao where idproduto = ' +
    dm.qProdutoidproduto.AsString, dm.qAux);
  excluirRegistro(dm.qProduto);
end;

procedure TfrmProduto.btnSalvarClick(Sender: TObject);
begin
  salvarProduto;
end;

procedure TfrmProduto.btnSubtrairClick(Sender: TObject);
begin
  inherited;
  if (strtofloat(edtEstoque.Text) > 0) then
  begin
    dm.atualizaEstoque(strtofloat(edtEstoque.Text), 'saida');
  end;
  edtEstoque.Text := '0';

  dm.qHistorico.Refresh;
end;

procedure TfrmProduto.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  if (strtofloat(edtEstoque.Text) > 0) then
  begin
    dm.atualizaEstoque(strtofloat(edtEstoque.Text), 'entrada');
  end;
  edtEstoque.Text := '0';

  dm.qHistorico.Refresh;
end;

procedure TfrmProduto.FormCreate(Sender: TObject);
begin
  inherited;
  dm.qProduto.Open();
end;

procedure TfrmProduto.gridDrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Column.Field.FieldName = 'quantidade') and
    (dm.qProdutoquantidade.Value <= 0) then
  begin
    grid.Canvas.Brush.Color := clred;
    // grid.Canvas.Font.Color := clred;
    grid.Canvas.FillRect(Rect);
    grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmProduto.gridHistoricoDrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (dm.qHistoricoentradasaida.Value = 0) then
  begin
    gridHistorico.Canvas.Font.Color := clBlue;
    gridHistorico.Canvas.FillRect(Rect);
    gridHistorico.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else
  begin
    gridHistorico.Canvas.Font.Color := clred;
    gridHistorico.Canvas.FillRect(Rect);
    gridHistorico.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmProduto.salvarProduto;
begin
  with dm do
  begin
    validaProduto(edtDescricao);
    qProduto.Post;
    if (qHistorico.RecordCount <= 0) and (qProdutoquantidade.Value > 0) then
    begin
      atualizaHistorico(0, qProdutoidproduto.Value, qProdutoquantidade.Value,
        'Foi adicionado um total de: ' + qProdutoquantidade.AsString +
        ' ao estoque, alterando o total de estoque para: ' +
        qProdutoquantidade.AsString + ' através do usuário: ' +
        qUsuarionome.AsString);
    end;
    habilitaMenus(dm.qProduto);
  end;
end;

procedure TfrmProduto.sbPesquisaChange(Sender: TObject);
begin
  inherited;
  dm.pesquisaRegistros('descricao', dm.sqlProduto, sbPesquisa.Text,
    dm.qProduto);
end;

procedure TfrmProduto.tsCadastroEnter(Sender: TObject);
begin
  inherited;
  dm.qHistorico.Open();
  if (dm.qProduto.State in [dsEdit]) AND (dm.qProdutoquantidade.Value > 0) then
  begin
    btnSubtrair.Enabled := true;
  end
  else
  begin
    btnSubtrair.Enabled := not true;
  end;
end;

procedure TfrmProduto.tsRegistroShow(Sender: TObject);
begin
  inherited;
  dm.qHistorico.Close;
end;

function TfrmProduto.validaDependenciasParaExclusao: boolean;
begin

end;

procedure TfrmProduto.validaProduto(edt: TDBEdit);
begin
  with dm do
  begin
    if (trim(qProdutodescricao.AsString) = EmptyStr) then
    begin
      MessageDlg
        ('Descrição inválida. A descrição do produto não pode estar vazia.',
        mtError, [mbok], 0);
      edt.SetFocus;
      exit
    end;
  end;

end;

end.
