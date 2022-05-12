unit fUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBase, Data.DB, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons;

type
  TfrmUsuario = class(TfrmBase)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    edtConfirmacao: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure edtConfirmacaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuario: TfrmUsuario;

implementation

{$R *.dfm}

uses Data;

procedure TfrmUsuario.btnCadastrarClick(Sender: TObject);
begin
  dm.qusuario.Insert;
  habilitaMenus(dm.qusuario);
end;

procedure TfrmUsuario.btnCancelarClick(Sender: TObject);
begin
  dm.qusuario.cancel;
  habilitaMenus(dm.qusuario);
  inherited;

end;

procedure TfrmUsuario.btnEditarClick(Sender: TObject);
begin
  dm.qusuario.edit;
  habilitaMenus(dm.qusuario);
  btnSalvar.Enabled := false;
end;

procedure TfrmUsuario.btnExcluirClick(Sender: TObject);
begin
  dm.qusuario.Delete;
  habilitaMenus(dm.qusuario);
end;

procedure TfrmUsuario.btnSalvarClick(Sender: TObject);
begin
  dm.qusuario.Post;
  habilitaMenus(dm.qusuario);
end;

procedure TfrmUsuario.edtConfirmacaoChange(Sender: TObject);
begin
  inherited;
  if (edtConfirmacao.Text = dm.qUsuariosenha.AsString) then
  begin
    btnSalvar.Enabled := not false;
  end
  else
  begin
    btnSalvar.Enabled := false;
  end;
end;

procedure TfrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.qusuario.Close;
  inherited;

end;

procedure TfrmUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  dm.qusuario.Open();
end;

procedure TfrmUsuario.FormShow(Sender: TObject);
begin
  inherited;
  if dm.qusuario.RecordCount <= 0 then
  begin
    btncadastrar.click;
  end;
end;

procedure TfrmUsuario.sbPesquisaChange(Sender: TObject);
begin
  inherited;
  dm.pesquisaRegistros('NOME', dm.sqlusuario, sbPesquisa.Text, dm.qusuario);
end;

end.
