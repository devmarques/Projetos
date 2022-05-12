unit fMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Imaging.pngimage, Vcl.Mask;

type
  TfrmMenu = class(TForm)
    pnlFundo: TPanel;
    pnlMenu: TPanel;
    pnlCabecario: TPanel;
    btnNotificacao: TSpeedButton;
    Panel1: TPanel;
    btnMaximizar: TSpeedButton;
    btnFechar: TSpeedButton;
    btnMInimizar: TSpeedButton;
    btnUsuario: TSpeedButton;
    btnProduto: TSpeedButton;
    btnCliente: TSpeedButton;
    btnLocacao: TSpeedButton;
    pnl5: TPanel;
    pnl3: TPanel;
    pnl1: TPanel;
    pnl2: TPanel;
    StatusBar1: TStatusBar;
    pnl4: TPanel;
    pnl6: TPanel;
    pnlRodape: TPanel;
    pnlLogado: TPanel;
    btnEncerrar: TSpeedButton;
    labUsuario: TLabel;
    pnlLogin: TPanel;
    labID: TLabel;
    labSenha: TLabel;
    btnConectar: TSpeedButton;
    edtID: TEdit;
    edtSenha: TEdit;
    btnOpcoes: TSpeedButton;
    pnlNotificacao: TPanel;
    btnLocacaoPendente: TSpeedButton;
    lblNotificacao: TLabel;
    procedure btnMaximizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtIDExit(Sender: TObject);
    procedure btnEncerrarClick(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnLocacaoClick(Sender: TObject);
    procedure btnNotificacaoMouseEnter(Sender: TObject);
    procedure pnlNotificacaoMouseLeave(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure carregaNotificacoes;

  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses fProduto, fUsuario, Data, fCliente, fLocacao;

procedure TfrmMenu.FormActivate(Sender: TObject);
begin
  if (dm.qUsuario.RecordCount <= 0) then
  begin
    btnUsuario.Enabled := true;
  end
  else if (btnEncerrar.Visible = true) then
  begin
    btnUsuario.Enabled := true;
  end
  else
  begin
    btnUsuario.Enabled := false;
  end;

end;

procedure TfrmMenu.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmMenu.FormShow(Sender: TObject);
begin
  carregaNotificacoes;
  dm.qUsuario.Open();
  if (dm.qUsuario.RecordCount <= 0) then
  begin
    Application.ProcessMessages;
    btnUsuario.Click;
  end;
  dm.qUsuario.Open();
end;

procedure TfrmMenu.pnlNotificacaoMouseLeave(Sender: TObject);
begin
  pnlNotificacao.Visible := false;
end;

procedure TfrmMenu.SpeedButton4Click(Sender: TObject);
begin
  try
    Application.CreateForm(tfrmlocacao, frmlocacao);
    frmlocacao.ShowModal;
  finally
    FreeAndNil(frmlocacao);
  end;
end;

procedure TfrmMenu.btnUsuarioClick(Sender: TObject);
begin

  try
    Application.CreateForm(tfrmusuario, frmusuario);
    frmusuario.ShowModal;
  finally
    FreeAndNil(frmusuario);
  end;
end;

procedure TfrmMenu.carregaNotificacoes;
var
  contadorNotificacao: integer;
begin
  with dm do
  begin
    abreQuery('SELECT COUNT(IDLOCACAO) AS "total" FROM LOCACAO ' +
      ' WHERE DATE(LOCACAO.previsaodevolucao) <= CURDATE()', dm.qAux);

    if (dm.qAux.FieldByName('total').Value > 0) then
    begin

      btnLocacaoPendente.Visible := true;
      btnLocacaoPendente.Caption := 'Devoluções Pendentes: ' +
        dm.qAux.FieldByName('total').asstring;

      devolucaoPendente := dm.qAux.FieldByName('total').Value;
      contadorNotificacao := devolucaoPendente;
    end
    else
    begin
      btnLocacaoPendente.Visible := not true;
    end;

    if (contadorNotificacao > 0) then
    begin
      btnNotificacao.Caption := IntToStr(contadorNotificacao);
      lblNotificacao.Visible := false;
    end;
  end;
end;

procedure TfrmMenu.SpeedButton6Click(Sender: TObject);
begin
  try
    Application.CreateForm(tfrmproduto, frmproduto);
    frmproduto.ShowModal;
  finally
    FreeAndNil(frmproduto);
  end;
end;

procedure TfrmMenu.btnClienteClick(Sender: TObject);
begin
  try
    Application.CreateForm(tfrmcliente, frmcliente);
    frmcliente.ShowModal;
  finally
    FreeAndNil(frmcliente);
  end;
end;

procedure TfrmMenu.btnMaximizarClick(Sender: TObject);
begin
  if (Self.WindowState = wsMaximized) then
  begin
    frmMenu.WindowState := wsNormal;
  end
  else
  begin
    frmMenu.WindowState := wsMaximized;
  end;
end;

procedure TfrmMenu.btnMinimizarClick(Sender: TObject);
begin
  Self.WindowState := wsMinimized;
end;

procedure TfrmMenu.btnNotificacaoMouseEnter(Sender: TObject);
begin
  pnlNotificacao.Visible := true;
end;

procedure TfrmMenu.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMenu.btnLocacaoClick(Sender: TObject);
begin
  try
    Application.CreateForm(tfrmlocacao, frmlocacao);
    frmlocacao.ShowModal;
  finally
    FreeAndNil(frmlocacao);
  end;
end;

procedure TfrmMenu.btnConectarClick(Sender: TObject);
begin
  if (edtSenha.Text = dm.qUsuariosenha.asstring) then
  begin
    pnlLogado.Visible := true;
    labUsuario.Caption := 'USUÁRIO: ' + dm.qUsuarionome.asstring + '   ';

    pnlLogin.Visible := not pnlLogado.Visible;

    pnlMenu.Enabled := true;
    pnlCabecario.Enabled := true;
    btnUsuario.Enabled := true;
    dm.usuariologado := dm.qUsuarioidusuario.Value;
  end
  else
  begin
    MessageDlg('Usuário não encontrado!', mtError, [mbok], 0);
  end;
end;

procedure TfrmMenu.btnEncerrarClick(Sender: TObject);
begin
  pnlLogin.Visible := true;

  pnlMenu.Enabled := false;
  btnUsuario.Enabled := false;

  edtSenha.Text := EmptyStr;
  edtID.Text := EmptyStr;
  edtID.SetFocus;

  pnlLogado.Visible := not pnlLogin.Visible;
end;

procedure TfrmMenu.btnProdutoClick(Sender: TObject);
begin
  try
    Application.CreateForm(tfrmproduto, frmproduto);
    frmproduto.ShowModal;
  finally
    FreeAndNil(frmproduto);
  end;
end;

procedure TfrmMenu.edtIDExit(Sender: TObject);
begin
  if (trim(edtID.Text) <> EmptyStr) then
  begin
    dm.qUsuario.Locate('idusuario', edtID.Text, []);
  end;
end;

procedure TfrmMenu.edtSenhaExit(Sender: TObject);
begin
  if (trim(edtSenha.Text) <> EmptyStr) then
  begin
    btnConectar.Click;
  end;

end;

end.
