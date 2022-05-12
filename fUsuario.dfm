inherited frmUsuario: TfrmUsuario
  Caption = 'frmUsuario'
  ExplicitWidth = 1008
  ExplicitHeight = 703
  PixelsPerInch = 96
  TextHeight = 23
  inherited pnlMenu: TPanel
    inherited btnEditar: TSpeedButton
      OnClick = btnEditarClick
    end
    inherited btnCadastrar: TSpeedButton
      OnClick = btnCadastrarClick
    end
    inherited btnExcluir: TSpeedButton
      OnClick = btnExcluirClick
    end
    inherited btnSalvar: TSpeedButton
      Enabled = False
      OnClick = btnSalvarClick
    end
  end
  inherited Panel1: TPanel
    inherited pageControl: TPageControl
      ActivePage = tsCadastro
      inherited tsRegistro: TTabSheet
        Caption = 'Cadastro de Usu'#225'rios'
        ExplicitLeft = 4
        ExplicitTop = 34
        ExplicitWidth = 994
        ExplicitHeight = 560
        inherited sbPesquisa: TSearchBox
          OnChange = sbPesquisaChange
        end
        inherited grid: TDBGrid
          DataSource = dm.dsUsuario
          Columns = <
            item
              Expanded = False
              FieldName = 'idusuario'
              Title.Caption = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nome'
              Title.Caption = 'Nome'
              Width = 796
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'senha'
              Visible = False
            end>
        end
      end
      inherited tsCadastro: TTabSheet
        Caption = 'Cadastro de Usu'#225'rios'
        ExplicitLeft = 4
        ExplicitTop = 34
        ExplicitWidth = 994
        ExplicitHeight = 560
        inherited Label4: TLabel
          Width = 994
        end
        object Label1: TLabel
          Left = 136
          Top = 64
          Width = 17
          Height = 23
          Caption = 'ID'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 106
          Top = 101
          Width = 47
          Height = 23
          Caption = 'Nome'
          FocusControl = DBEdit2
        end
        object Label5: TLabel
          Left = 106
          Top = 138
          Width = 47
          Height = 23
          Caption = 'Senha'
          FocusControl = DBEdit3
        end
        object Label6: TLabel
          Left = 25
          Top = 175
          Width = 128
          Height = 23
          Caption = 'Confirmar Senha'
          FocusControl = DBEdit3
        end
        object DBEdit1: TDBEdit
          Left = 159
          Top = 61
          Width = 58
          Height = 31
          DataField = 'idusuario'
          DataSource = dm.dsUsuario
          Enabled = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 159
          Top = 98
          Width = 650
          Height = 31
          CharCase = ecUpperCase
          DataField = 'nome'
          DataSource = dm.dsUsuario
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 159
          Top = 135
          Width = 234
          Height = 31
          DataField = 'senha'
          DataSource = dm.dsUsuario
          PasswordChar = '*'
          TabOrder = 2
        end
        object edtConfirmacao: TEdit
          Left = 159
          Top = 172
          Width = 234
          Height = 31
          PasswordChar = '*'
          TabOrder = 3
          OnChange = edtConfirmacaoChange
        end
      end
    end
  end
end
