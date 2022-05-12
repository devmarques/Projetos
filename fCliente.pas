unit fCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBase, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCliente = class(TfrmBase)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    cbCidade: TDBLookupComboBox;
    cbUF: TComboBox;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPesquisaChange(Sender: TObject);
    procedure cbUFChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

uses Data;

procedure TfrmCliente.btnCadastrarClick(Sender: TObject);
begin
  inherited;
  cadastrarNovoRegistro(dm.qcliente);
end;

procedure TfrmCliente.btnCancelarClick(Sender: TObject);
begin
  cancelarInclusaoEdicao(dm.qcliente);
  inherited;
end;

procedure TfrmCliente.btnEditarClick(Sender: TObject);
begin
  inherited;
  editarRegistro(dm.qcliente);
end;

procedure TfrmCliente.btnExcluirClick(Sender: TObject);
begin
  inherited;
  excluirRegistro(dm.qcliente);
end;

procedure TfrmCliente.btnSalvarClick(Sender: TObject);
begin
  inherited;
  dm.qcliente.post;
  habilitaMenus(dm.qcliente);
end;

procedure TfrmCliente.cbUFChange(Sender: TObject);
begin
  inherited;
  dm.pesquisaRegistros('uf', dm.sqlcidade, cbUF.Text, dm.qCidade);
end;

procedure TfrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.qcliente.close;
  inherited;

end;

procedure TfrmCliente.FormCreate(Sender: TObject);
begin
  inherited;
  dm.qcliente.Open();
  dm.qCidade.Open();
end;

procedure TfrmCliente.sbPesquisaChange(Sender: TObject);
begin
  inherited;
  dm.pesquisaRegistros('cliente.NOME', dm.sqlcliente, sbPesquisa.Text,
    dm.qcliente);
end;

end.
