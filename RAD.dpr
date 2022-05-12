program RAD;

uses
  Vcl.Forms,
  fMenu in 'fMenu.pas' {frmMenu},
  fBase in 'fBase.pas' {frmBase},
  Data in 'Data.pas' {dm: TDataModule},
  fProduto in 'fProduto.pas' {frmProduto},
  fCliente in 'fCliente.pas' {frmCliente},
  fUsuario in 'fUsuario.pas' {frmUsuario},
  fLocacao in 'fLocacao.pas' {frmLocacao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
