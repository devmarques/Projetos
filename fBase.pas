unit fBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.WinXCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.Actions, Vcl.ActnList;

type
  TfrmBase = class(TForm)
    pnlMenu: TPanel;
    btnEditar: TSpeedButton;
    btnCadastrar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    Panel1: TPanel;
    pageControl: TPageControl;
    tsRegistro: TTabSheet;
    sbPesquisa: TSearchBox;
    grid: TDBGrid;
    tsCadastro: TTabSheet;
    Label4: TLabel;
    pnlBorda: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    btnMinimizar: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure habilitaMenus(query: tfdquery);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnMaximizarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure editarRegistro(query: tfdquery);
    procedure cadastrarNovoRegistro(query: tfdquery);
    procedure excluirRegistro(query: tfdquery);
    procedure cancelarInclusaoEdicao(query: tfdquery);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }

  public
    { Public declarations } function validaEdicao(query: tfdquery): integer;
    function validaExclusao(query: tfdquery): integer;
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.dfm}

uses Data;

procedure TfrmBase.btnCancelarClick(Sender: TObject);
begin
  sbPesquisa.SetFocus;
end;

procedure TfrmBase.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBase.btnMaximizarClick(Sender: TObject);
begin
  if (Self.WindowState = wsMaximized) then
  begin
    Self.WindowState := wsNormal;
  end
  else
  begin
    Self.WindowState := wsMaximized;
  end;
end;

procedure TfrmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.fechaConexoes;
  Action := cafree;
  Self := nil;
end;

procedure TfrmBase.FormCreate(Sender: TObject);
begin
  pageControl.ActivePageIndex := 0;
end;

procedure TfrmBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = Ord('N')) then
  begin
    btnCadastrar.Click;
  end;

  if (Shift = [ssCtrl]) and (Key = Ord('S')) then
  begin
    btnSalvar.Click;
  end;

  if (Shift = [ssCtrl]) and (Key = Ord('E')) then
  begin
    btnEditar.Click;
  end;

  if (Key = VK_HOME) then
  begin
    btnCancelar.Click;
  end;

end;

procedure TfrmBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmBase.FormShow(Sender: TObject);
begin
  sbPesquisa.SetFocus;
end;

procedure TfrmBase.habilitaMenus(query: tfdquery);
begin
  with dm do
  begin
    if (query.State in [dsInsert, dsEdit]) then
    begin
      btnCadastrar.visible := false;
      btnEditar.visible := false;
      btnExcluir.visible := false;

      btnCancelar.visible := not false;
      btnSalvar.visible := not false;

      tsCadastro.TabVisible := true;
      tsRegistro.TabVisible := false;
    end
    else
    begin
      btnExcluir.visible := not false;
      btnEditar.visible := not false;
      btnCadastrar.visible := not false;

      btnSalvar.visible := false;
      btnCancelar.visible := false;

      tsCadastro.TabVisible := not true;
      tsRegistro.TabVisible := not false;
    end;
  end;
end;

function TfrmBase.validaEdicao(query: tfdquery): integer;
begin
  if not(query.RecordCount > 0) then
  begin
    MessageDlg('Nenhum registro encontrado para ser editado.', mtWarning,
      [mbok], 0);
    result := 0;
  end;
end;

function TfrmBase.validaExclusao(query: tfdquery): integer;
begin
  if not(query.RecordCount > 0) then
  begin
    MessageDlg('Nenhum registro encontrado para ser excluído.', mtWarning,
      [mbok], 0);
    result := 0;
  end;
end;

procedure TfrmBase.btnMinimizarClick(Sender: TObject);
begin
  Self.WindowState := wsMinimized;
end;

procedure TfrmBase.cadastrarNovoRegistro(query: tfdquery);
begin
  query.Insert;
  habilitaMenus(query);
end;

procedure TfrmBase.cancelarInclusaoEdicao(query: tfdquery);
begin
  query.Cancel;
  habilitaMenus(query);
end;

procedure TfrmBase.editarRegistro(query: tfdquery);
begin
  query.edit;
  habilitaMenus(query);
end;

procedure TfrmBase.excluirRegistro(query: tfdquery);
begin
  query.delete;
  habilitaMenus(query);
end;

end.
