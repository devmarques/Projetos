inherited frmCliente: TfrmCliente
  Caption = 'frmCliente'
  ClientHeight = 681
  ClientWidth = 949
  TransparentColorValue = clBlack
  ExplicitWidth = 955
  ExplicitHeight = 687
  PixelsPerInch = 96
  TextHeight = 23
  inherited pnlMenu: TPanel
    Top = 623
    Width = 949
    inherited btnEditar: TSpeedButton
      OnClick = btnEditarClick
    end
    inherited btnCadastrar: TSpeedButton
      OnClick = btnCadastrarClick
    end
    inherited btnCancelar: TSpeedButton
      Left = 797
    end
    inherited btnExcluir: TSpeedButton
      OnClick = btnExcluirClick
    end
    inherited btnSalvar: TSpeedButton
      Left = 645
      OnClick = btnSalvarClick
    end
  end
  inherited Panel1: TPanel
    Width = 949
    Height = 623
    inherited pageControl: TPageControl
      Width = 949
      Height = 573
      inherited tsRegistro: TTabSheet
        Caption = 'Cadastro de Clientes'
        ExplicitLeft = 4
        ExplicitTop = 34
        ExplicitWidth = 994
        ExplicitHeight = 551
        inherited sbPesquisa: TSearchBox
          Width = 890
          OnChange = sbPesquisaChange
        end
        inherited grid: TDBGrid
          Width = 941
          Height = 482
          DataSource = dm.dsCliente
          Columns = <
            item
              Expanded = False
              FieldName = 'idcliente'
              Title.Caption = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nome'
              Title.Caption = 'Nome'
              Width = 846
              Visible = True
            end>
        end
      end
      inherited tsCadastro: TTabSheet
        Caption = 'Cadastro de Clientes'
        ExplicitLeft = 4
        ExplicitTop = 34
        ExplicitWidth = 994
        ExplicitHeight = 551
        inherited Label4: TLabel
          Width = 941
          Caption = 'Preencha os dados abaixo para cadastrar ou alterar um cliente.'
          ExplicitLeft = -72
          ExplicitWidth = 941
        end
        object Label1: TLabel
          Left = 104
          Top = 48
          Width = 17
          Height = 23
          Caption = 'ID'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 74
          Top = 85
          Width = 47
          Height = 23
          Caption = 'Nome'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 92
          Top = 122
          Width = 29
          Height = 23
          Caption = 'CPF'
          FocusControl = DBEdit3
        end
        object Label5: TLabel
          Left = 50
          Top = 159
          Width = 71
          Height = 23
          Caption = 'Endere'#231'o'
          FocusControl = DBEdit4
        end
        object Label6: TLabel
          Left = 76
          Top = 196
          Width = 45
          Height = 23
          Caption = 'Bairro'
          FocusControl = DBEdit5
        end
        object Label7: TLabel
          Left = 178
          Top = 233
          Width = 53
          Height = 23
          Caption = 'Cidade'
          FocusControl = DBEdit5
        end
        object Label8: TLabel
          Left = 101
          Top = 233
          Width = 20
          Height = 23
          Caption = 'UF'
          FocusControl = DBEdit5
        end
        object DBEdit1: TDBEdit
          Left = 127
          Top = 45
          Width = 82
          Height = 31
          DataField = 'idcliente'
          DataSource = dm.dsCliente
          Enabled = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 127
          Top = 82
          Width = 762
          Height = 31
          CharCase = ecUpperCase
          DataField = 'nome'
          DataSource = dm.dsCliente
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 127
          Top = 119
          Width = 257
          Height = 31
          DataField = 'cpf'
          DataSource = dm.dsCliente
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 127
          Top = 156
          Width = 762
          Height = 31
          CharCase = ecUpperCase
          DataField = 'endereco'
          DataSource = dm.dsCliente
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 127
          Top = 193
          Width = 762
          Height = 31
          CharCase = ecUpperCase
          DataField = 'bairro'
          DataSource = dm.dsCliente
          TabOrder = 4
        end
        object cbCidade: TDBLookupComboBox
          Left = 237
          Top = 230
          Width = 652
          Height = 31
          DataField = 'codigoibge'
          DataSource = dm.dsCliente
          KeyField = 'codigoibge'
          ListField = 'nome'
          ListSource = dm.dsCidade
          TabOrder = 5
        end
        object cbUF: TComboBox
          Left = 127
          Top = 230
          Width = 45
          Height = 31
          ItemIndex = 25
          TabOrder = 6
          Text = 'SP'
          OnChange = cbUFChange
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PB'
            'PE'
            'PI'
            'PR'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
        end
      end
    end
    inherited pnlBorda: TPanel
      Width = 949
      inherited SpeedButton3: TSpeedButton
        Left = 809
      end
      inherited SpeedButton4: TSpeedButton
        Left = 879
      end
      inherited btnMinimizar: TSpeedButton
        Left = 739
      end
    end
  end
end
