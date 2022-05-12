inherited frmLocacao: TfrmLocacao
  Caption = 'frmLocacao'
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
      OnClick = btnSalvarClick
    end
    object btnFinalizar: TSpeedButton
      Left = 482
      Top = 0
      Width = 216
      Height = 58
      Align = alRight
      Caption = 'Finalizar Loca'#231#227'o'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      Font.Quality = fqClearType
      Glyph.Data = {
        A2070000424DA207000000000000360000002800000019000000190000000100
        1800000000006C070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4EF
        EFEFFFFFFFFFFFFFFFFFFFD1D1D1B7B7B7BABABABABABABABABABABABABABABA
        BABABABABABABABABABABABAB0B0B0FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFC7C7C7000000000000FFFFFFFFFFFFFFFFFF000000000000000000
        000000000000000000000000000000000000000000000000000000767676FFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFF545454000000242424000000363636FFFFFF
        FFFFFFEAEAEACFCFCFD2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2
        D2D2D2D2C9C9C9FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF1010100000004B4B4B
        FFFFFF7F7F7F000000B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFC7C7C7
        000000000000C2C2C2FFFFFFFFFFFFFFFFFF151515000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF00B5B5B50000000C0C0CFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0000001B1B1BFFFFFFFFFFFFFFFFFF7B7B7B5D5D5D61616161616161616161
        6161616161616161555555DBDBDBFFFFFF00FFFFFF6D6D6DFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFADADAD000000888888FFFFFFFFFFFF00000000
        0000000000000000000000000000000000000000000000ABABABFFFFFF00FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF31313100
        0000EDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000010101FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCBCB000000555555
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF4B4B4B000000CFCFCFFFFFFFFFFFFF2C2C2C0000000000000000
        00000000000000ABABABFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFF
        FF9C9C9C595959616161616161616161555555DBDBDBFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFE7E7E7000000333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777777000000B2B2B2FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF12
        1212000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFCFCFC000000171717FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A7000000
        BABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF00}
      Margin = 10
      ParentFont = False
      Visible = False
      OnClick = btnFinalizarClick
      ExplicitLeft = 462
      ExplicitTop = 2
      ExplicitHeight = 50
    end
  end
  inherited Panel1: TPanel
    inherited pageControl: TPageControl
      ActivePage = tsCadastro
      inherited tsRegistro: TTabSheet
        Caption = 'Cadastro de Loca'#231#245'es'
        OnShow = tsRegistroShow
        ExplicitLeft = 4
        ExplicitTop = 34
        ExplicitWidth = 994
        ExplicitHeight = 551
        inherited sbPesquisa: TSearchBox
          OnChange = sbPesquisaChange
        end
        inherited grid: TDBGrid
          DataSource = dm.dsLocacao
          OnDrawColumnCell = gridDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'idlocacao'
              Title.Caption = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'idcliente'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'datalocacao'
              Title.Caption = 'Data Loca'#231#227'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'previsaodevolucao'
              Title.Caption = 'Previs'#227'o Devolu'#231#227'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'idusuario'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'locacaoencerrada'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'datadevolucao'
              Title.Caption = 'Data Devolu'#231#227'o'
              Width = 158
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cliente'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'endereco'
              Title.Caption = 'Endere'#231'o'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Usu'#225'rio'
              Width = 400
              Visible = True
            end>
        end
      end
      inherited tsCadastro: TTabSheet
        Caption = 'Cadastro de Loca'#231#245'es'
        ExplicitLeft = 4
        ExplicitTop = 34
        ExplicitWidth = 994
        ExplicitHeight = 551
        inherited Label4: TLabel
          Width = 994
          Caption = 'Preencha os dados abaixo para cadastrar ou alterar uma loca'#231#227'o.'
        end
        object btnImprimir: TSpeedButton
          Left = 952
          Top = -1
          Width = 39
          Height = 20
          Align = alCustom
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          Font.Quality = fqClearType
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            000000000000000000030000000C000000120000001400000014000000150000
            0015000000140000000D00000003000000000000000000000000000000000000
            00000000000000000009896256C2BD8A78FFBE8A78FFBD8A78FFBD8978FFBD89
            78FFBE8978FF876356C30000000B000000000000000000000000000000030000
            000E0000001500000021C08D7CFFF6EEE9FFF5EDE9FFF5EDE9FFF5ECE8FFF4EC
            E8FFF5ECE7FFBF8D7BFF00000026000000180000000F000000040000000C7B50
            42C5A76E5BFF9F6755FFC2917FFFF7F0ECFFE2B47DFFE2B37AFFE1B077FFE0AE
            72FFF6EEEAFFC2907FFF845545FF895847FF613E32C70000000E00000011BB7E
            6BFFECD9CCFFE3CEBEFFC59483FFF9F2F0FFE4B984FFE3B781FFE3B47CFFE0B1
            76FFF7F0EDFFC59483FFE0CBBCFFEBD8CBFFB67763FF0000001400000010BE85
            71FFF1E5DAFFECDBD0FF7A4835FF7A4835FF7A4835FF7A4835FF7A4835FF7A48
            35FF7A4835FF7A4835FFEBDBCFFFF1E2D8FFB97C69FF000000130000000EC28B
            78FFF5EEE7FFF2E7DDFFF2E7DEFFF3E7DEFFF2E5DEFFF3E5DEFFF2E7DDFFF2E7
            DDFFF2E7DEFFF2E7DDFFF2E5DEFFF5EDE6FFBC826EFF000000120000000CC793
            7FFFFAF4F1FFCDBEB8FF6F5448FF614337FF614035FF5F3F34FF5E3F33FF5D3D
            32FF5D3D34FF6A4C44FFCABCB6FFF9F5F1FFC18875FF000000100000000ACC99
            86FFFDFAFAFF7D6054FF745043FF744F43FF744E43FF734E43FF734E42FF724D
            42FF724C41FF724C40FF73584DFFFDFAFAFFC58F7CFF0000000E00000008CF9F
            8DFFFFFFFFFF7A5A4CFF8E695AFFF9F4F1FFF0E6E0FFF0E5DFFFEFE5DEFFEFE5
            DEFFF6EFEBFF866253FF704F43FFFFFFFFFFCA9683FF0000000B00000005BE95
            84E9F5ECE8FF866656FF977262FFFAF6F4FFF2E8E3FFF1E8E1FFF1E7E2FFF1E7
            E1FFF8F2EEFF8E6A5BFF7A5B4CFFF5EAE6FFBA8E7DEA00000008000000023429
            2545A78375CC947262FFA07B6AFFFCF9F8FFF3EBE6FFF4EAE5FFF2EAE5FFF3EA
            E3FFF9F5F3FF977263FF876658FFA68072CE3428234800000003000000000000
            0001000000030000000AC89B89FFFDFBFAFFF5EDE8FFF4EDE8FFF5EDE7FFF5EC
            E7FFFBF7F6FFC59685FF00000011000000040000000200000000000000000000
            00000000000000000005CA9E8DFFFEFCFCFFF7F0ECFFF6EFEBFFF7EFEBFFF5EF
            EAFFFCFAF8FFC89A89FF00000009000000000000000000000000000000000000
            00000000000000000003CDA291FFFEFEFDFFFEFDFDFFFEFDFCFFFEFCFCFFFEFC
            FBFFFDFBFAFFCB9F8DFF00000007000000000000000000000000000000000000
            000000000000000000019A796DBFCFA493FFCEA493FFCEA493FFCEA492FFCDA3
            91FFCDA391FF98786BC100000004000000000000000000000000}
          Margin = 10
          ParentFont = False
        end
        object gridProdutoLocacao: TDBGrid
          Left = 0
          Top = 326
          Width = 994
          Height = 225
          Align = alBottom
          DataSource = dm.dsProdutoLocacao
          DrawingStyle = gdsGradient
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -17
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Visible = False
          OnCellClick = gridProdutoLocacaoCellClick
          OnDrawColumnCell = gridProdutoLocacaoDrawColumnCell
          OnDblClick = gridProdutoLocacaoDblClick
          OnEnter = gridProdutoLocacaoEnter
          OnExit = gridProdutoLocacaoExit
          OnKeyPress = gridProdutoLocacaoKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'idprodutolocacao'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'idproduto'
              Title.Caption = 'ID'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Produto'
              Width = 500
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'idlocacao'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'quantidade'
              Title.Caption = 'Qtde Locado'
              Width = 131
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'quantidadedevolvida'
              Title.Caption = 'Devolvido'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'quantidaderestante'
              Title.Caption = #192' Devolver'
              Width = 108
              Visible = True
            end>
        end
        object pnlPrincipal: TPanel
          Left = 0
          Top = 23
          Width = 994
          Height = 303
          Align = alClient
          Caption = 'pnlPrincipal'
          ShowCaption = False
          TabOrder = 1
          object pnlCadastroLocacao: TPanel
            Left = 1
            Top = 1
            Width = 457
            Height = 301
            Align = alLeft
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelKind = bkFlat
            BevelOuter = bvNone
            Caption = 'Panel3'
            Color = clScrollBar
            ParentBackground = False
            ShowCaption = False
            TabOrder = 0
            DesignSize = (
              453
              297)
            object Label1: TLabel
              Left = 84
              Top = 9
              Width = 127
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              Caption = 'Data de Loca'#231#227'o'
              FocusControl = cxDBDateEdit1
            end
            object Label5: TLabel
              Left = 28
              Top = 83
              Width = 53
              Height = 23
              Cursor = crHandPoint
              Anchors = [akLeft, akTop, akRight]
              Caption = 'Cliente'
              FocusControl = cxDBDateEdit2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMenuHighlight
              Font.Height = -17
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label3: TLabel
              Left = 39
              Top = 46
              Width = 172
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              Caption = 'Previs'#227'o de Devolu'#231#227'o'
              FocusControl = cxDBDateEdit2
            end
            object Label8: TLabel
              Left = 10
              Top = 120
              Width = 71
              Height = 23
              Caption = 'Endere'#231'o'
              FocusControl = cxDBDateEdit2
            end
            object Label2: TLabel
              Left = 10
              Top = 218
              Width = 96
              Height = 23
              Caption = 'Observa'#231#245'es'
              FocusControl = cxDBDateEdit2
            end
            object cxDBDateEdit1: TcxDBDateEdit
              Left = 217
              Top = 6
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataField = 'datalocacao'
              DataBinding.DataSource = dm.dsLocacao
              TabOrder = 0
              Width = 231
            end
            object cxDBDateEdit2: TcxDBDateEdit
              Left = 217
              Top = 43
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataField = 'previsaodevolucao'
              DataBinding.DataSource = dm.dsLocacao
              TabOrder = 1
              Width = 231
            end
            object sbPesquisaCliente: TSearchBox
              Left = 84
              Top = 83
              Width = 363
              Height = 31
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Segoe UI'
              Font.Style = [fsItalic]
              ParentFont = False
              TabOrder = 2
              TextHint = 'Pesquise pelo nome do cliente'
              OnChange = sbPesquisaClienteChange
            end
            object memoCliente: TMemo
              Left = 84
              Top = 120
              Width = 364
              Height = 89
              ReadOnly = True
              TabOrder = 3
            end
            object DBMemo1: TDBMemo
              Left = 112
              Top = 215
              Width = 336
              Height = 79
              Anchors = [akLeft, akTop, akBottom]
              DataField = 'observacao'
              DataSource = dm.dsLocacao
              TabOrder = 4
              OnEnter = DBMemo1Enter
              OnExit = DBMemo1Exit
            end
            object gridCliente: TDBGrid
              Left = 4
              Top = 120
              Width = 444
              Height = 174
              Anchors = [akLeft, akTop, akRight]
              DataSource = dm.dsCliente
              DrawingStyle = gdsGradient
              TabOrder = 5
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -17
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
              OnDblClick = gridClienteDblClick
              OnEnter = gridClienteEnter
              OnExit = gridClienteExit
              OnKeyPress = gridClienteKeyPress
              Columns = <
                item
                  Expanded = False
                  FieldName = 'idcliente'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'nome'
                  Title.Caption = 'Nome'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cpf'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'endereco'
                  Title.Caption = 'Endere'#231'o'
                  Width = 400
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'bairro'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'codigoibge'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Cidade'
                  Width = 400
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'uf'
                  Visible = True
                end>
            end
          end
          object pnlProduto: TPanel
            Left = 457
            Top = 1
            Width = 536
            Height = 301
            Align = alRight
            Alignment = taLeftJustify
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelKind = bkFlat
            BevelOuter = bvNone
            Caption = 'pnlProduto'
            Color = clScrollBar
            ParentBackground = False
            ShowCaption = False
            TabOrder = 1
            Visible = False
            DesignSize = (
              532
              297)
            object Label6: TLabel
              Left = 0
              Top = 0
              Width = 532
              Height = 46
              Align = alTop
              Alignment = taCenter
              Caption = 
                'Pesquise o produto, selecione e preencha o valor da quantidade e' +
                'nviada para loca'#231#227'o'
              Color = cl3DLight
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExplicitWidth = 514
            end
            object sbPesquisaProduto: TEdit
              Left = 7
              Top = 52
              Width = 522
              Height = 31
              Align = alCustom
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Segoe UI'
              Font.Style = [fsItalic]
              ParentFont = False
              TabOrder = 0
              TextHint = 'Pesquise pela descri'#231#227'o do produto para adicionar...'
              OnChange = sbPesquisaProdutoChange
            end
            object gbProduto: TGroupBox
              Left = 5
              Top = 89
              Width = 512
              Height = 170
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              object Label9: TLabel
                Left = 1
                Top = 19
                Width = 62
                Height = 23
                Caption = 'Produto'
                FocusControl = cxDBTextEdit1
              end
              object Label7: TLabel
                Left = 25
                Top = 56
                Width = 38
                Height = 23
                Align = alCustom
                Anchors = [akLeft, akBottom]
                Caption = 'Qtde'
              end
              object cxDBTextEdit1: TcxDBTextEdit
                Left = 69
                Top = 16
                DataBinding.DataField = 'Produto'
                DataBinding.DataSource = dm.dsProdutoLocacao
                Enabled = False
                TabOrder = 0
                Width = 453
              end
              object edtQuantidade: TEdit
                Left = 69
                Top = 53
                Width = 57
                Height = 31
                Align = alCustom
                Alignment = taCenter
                Anchors = [akLeft, akBottom]
                TabOrder = 1
                TextHint = '0'
                OnExit = edtQuantidadeExit
              end
              object pnlDadosProdutoLocacao: TPanel
                Left = 2
                Top = 92
                Width = 508
                Height = 76
                Align = alBottom
                BevelOuter = bvNone
                Caption = 'pnlDadosProdutoLocacao'
                Color = clScrollBar
                ParentBackground = False
                ShowCaption = False
                TabOrder = 2
                object Label10: TLabel
                  Left = 8
                  Top = 11
                  Width = 55
                  Height = 23
                  Caption = 'Locado'
                end
                object Label11: TLabel
                  Left = 209
                  Top = 11
                  Width = 75
                  Height = 23
                  Caption = 'Devolvido'
                end
                object Label12: TLabel
                  Left = 8
                  Top = 45
                  Width = 276
                  Height = 23
                  Caption = 'Quantidade restante a ser devolvido'
                end
                object DBEdit1: TDBEdit
                  Left = 69
                  Top = 8
                  Width = 126
                  Height = 31
                  DataField = 'quantidade'
                  DataSource = dm.dsProdutoLocacao
                  Enabled = False
                  TabOrder = 0
                end
                object DBEdit2: TDBEdit
                  Left = 290
                  Top = 8
                  Width = 126
                  Height = 31
                  DataField = 'quantidadedevolvida'
                  DataSource = dm.dsProdutoLocacao
                  Enabled = False
                  TabOrder = 1
                end
                object DBEdit3: TDBEdit
                  Left = 290
                  Top = 42
                  Width = 126
                  Height = 31
                  DataField = 'quantidaderestante'
                  DataSource = dm.dsProdutoLocacao
                  Enabled = False
                  TabOrder = 2
                end
              end
            end
            object gridProduto: TDBGrid
              Left = 0
              Top = 89
              Width = 532
              Height = 167
              Align = alBottom
              DataSource = dm.dsProduto
              DrawingStyle = gdsGradient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -17
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
              OnDblClick = gridProdutoDblClick
              OnEnter = gridProdutoEnter
              OnExit = gridProdutoExit
              OnKeyPress = gridProdutoKeyPress
              Columns = <
                item
                  Expanded = False
                  FieldName = 'idproduto'
                  Title.Caption = 'ID'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'descricao'
                  Title.Caption = 'Produto'
                  Width = 250
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'quantidade'
                  Title.Caption = 'Estoque'
                  Width = 83
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'quantidadealocado'
                  Title.Caption = 'Locado'
                  Width = 87
                  Visible = True
                end>
            end
            object Panel3: TPanel
              Left = 0
              Top = 256
              Width = 532
              Height = 41
              Align = alBottom
              Caption = 'Panel3'
              ShowCaption = False
              TabOrder = 3
              object btnAdicionarProduto: TcxButton
                Left = 1
                Top = 1
                Width = 133
                Height = 39
                Align = alLeft
                Caption = 'Adicionar'
                OptionsImage.Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000000000000000
                  00000000000000000000101010462121218D2F2F2FC7383838F0383838F02F2F
                  2FC72121218D1010104600000000000000000000000000000000000000000000
                  0000080808202121218C393939F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF393939F32121218C080808200000000000000000000000000808
                  0820262626A33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF262626A30808082000000000000000002121
                  218C3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF2121218C00000000101010463939
                  39F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF00000000000000003C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF393939F3101010462121218D3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF00000000000000003C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF2121218D2F2F2FC73C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF00000000000000003C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF2F2F2FC7383838F03C3C
                  3CFF3C3C3CFF3C3C3CFF00000000000000000000000000000000000000000000
                  000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF383838F0383838F03C3C
                  3CFF3C3C3CFF3C3C3CFF00000000000000000000000000000000000000000000
                  000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF383838F02F2F2FC73C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF00000000000000003C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF2F2F2FC72121218D3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF00000000000000003C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF2121218D101010463939
                  39F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF00000000000000003C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF393939F310101046000000002121
                  218C3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF2121218C00000000000000000808
                  0820262626A33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF262626A30808082000000000000000000000
                  0000080808202121218C393939F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF393939F32121218C080808200000000000000000000000000000
                  00000000000000000000101010462121218D2F2F2FC7383838F0383838F02F2F
                  2FC72121218D1010104600000000000000000000000000000000}
                TabOrder = 0
                OnClick = btnAdicionarProdutoClick
              end
              object btnDevolverProduto: TcxButton
                Left = 134
                Top = 1
                Width = 133
                Height = 39
                Align = alLeft
                Caption = 'Devolver'
                OptionsImage.Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000707071D1A1A1A702B2B2BB7373737EA373737EA2B2B
                  2BB71A1A1A700707071D00000000000000000000000000000000000000000000
                  0000000000000D0D0D39292929B03C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF292929B00D0D0D39000000000000000000000000000000000000
                  00000707071D292929B03C3C3CFF2D2D2DBF181818660707071F0707071F1818
                  18662D2D2DBF3C3C3CFF292929B00707071D0000000000000000000000000000
                  00001A1A1A703C3C3CFF2D2D2DBF0C0C0C330000000000000000000000000000
                  00000C0C0C332D2D2DBF3C3C3CFF1A1A1A700000000000000000000000000000
                  00002B2B2BB73C3C3CFF18181866000000000000000000000000000000000000
                  000000000000181818663C3C3CFF2B2B2BB70000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000707071F3C3C3CFF373737EA0000000000000000000000003C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E00000000000000000000
                  0000000000000707071F3C3C3CFF373737EA0000000000000000000000003C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E0000000000000000000000000000
                  000000000000181818663C3C3CFF2B2B2BB70000000000000000000000003C3C
                  3CFF3C3C3CFF3C3C3CFF343434DF0C0C0C330000000000000000000000000000
                  00000C0C0C332D2D2DBF3C3C3CFF1A1A1A700000000000000000000000003C3C
                  3CFF3C3C3CFF333333D73C3C3CFF2D2D2DBF181818660707071F0707071F1818
                  18662D2D2DBF3C3C3CFF292929B00707071D0000000000000000000000003C3C
                  3CFF1E1E1E7E0D0D0D39292929B03C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF292929B00D0D0D39000000000000000000000000000000001E1E
                  1E7E00000000000000000707071D1A1A1A702B2B2BB7373737EA373737EA2B2B
                  2BB71A1A1A700707071D00000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000}
                TabOrder = 1
                OnClick = btnDevolverProdutoClick
              end
              object btnCancelarProduto: TcxButton
                Left = 267
                Top = 1
                Width = 133
                Height = 39
                Align = alLeft
                Caption = 'Cancelar'
                OptionsImage.Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000000000000000
                  00000000000000000000101010462121218D2F2F2FC7383838F0383838F02F2F
                  2FC72121218D1010104600000000000000000000000000000000000000000000
                  0000080808202121218C393939F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF393939F32121218C080808200000000000000000000000000808
                  0820262626A33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF262626A30808082000000000000000002121
                  218C3C3C3CFF3C3C3CFF3C3C3CFF2D2D2DBE3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF2D2D2DBE3C3C3CFF3C3C3CFF3C3C3CFF2121218C00000000101010463939
                  39F33C3C3CFF3C3C3CFF1E1E1E7E000000001E1E1E7E3C3C3CFF3C3C3CFF1E1E
                  1E7E000000001E1E1E7E3C3C3CFF3C3C3CFF393939F3101010462121218D3C3C
                  3CFF3C3C3CFF2D2D2DBF0000000000000000000000001E1E1E7E1E1E1E7E0000
                  000000000000000000002D2D2DBF3C3C3CFF3C3C3CFF2121218D2F2F2FC73C3C
                  3CFF3C3C3CFF3C3C3CFF1E1E1E81000000000000000000000000000000000000
                  0000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF2F2F2FC7383838F03C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E810000000000000000000000000000
                  00001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF383838F0383838F03C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E0000000000000000000000000000
                  00001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF383838F02F2F2FC73C3C
                  3CFF3C3C3CFF3C3C3CFF1E1E1E7E000000000000000000000000000000000000
                  0000000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF2F2F2FC72121218D3C3C
                  3CFF3C3C3CFF2D2D2DBF0000000000000000000000001E1E1E811E1E1E810000
                  000000000000000000002D2D2DBF3C3C3CFF3C3C3CFF2121218D101010463939
                  39F33C3C3CFF3C3C3CFF1E1E1E81000000001E1E1E813C3C3CFF3C3C3CFF1E1E
                  1E81000000001E1E1E813C3C3CFF3C3C3CFF393939F310101046000000002121
                  218C3C3C3CFF3C3C3CFF3C3C3CFF2D2D2DC13C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF2D2D2DC13C3C3CFF3C3C3CFF3C3C3CFF2121218C00000000000000000808
                  0820262626A33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF262626A30808082000000000000000000000
                  0000080808202121218C393939F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF393939F32121218C080808200000000000000000000000000000
                  00000000000000000000101010462121218D2F2F2FC7383838F0383838F02F2F
                  2FC72121218D1010104600000000000000000000000000000000}
                TabOrder = 2
                OnClick = btnCancelarProdutoClick
              end
              object btnExcluirProduto: TcxButton
                Left = 400
                Top = 1
                Width = 133
                Height = 39
                Align = alLeft
                Caption = 'Excluir'
                OptionsImage.Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000000000000000
                  00000000000000000000101010462121218D2F2F2FC7383838F0383838F02F2F
                  2FC72121218D1010104600000000000000000000000000000000000000000000
                  0000080808202121218C393939F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF393939F32121218C080808200000000000000000000000000808
                  0820262626A33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF262626A30808082000000000000000002121
                  218C3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF2121218C00000000101010463939
                  39F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF393939F3101010462121218D3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF2121218D2F2F2FC73C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF2F2F2FC7383838F03C3C
                  3CFF3C3C3CFF3C3C3CFF00000000000000000000000000000000000000000000
                  000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF383838F0383838F03C3C
                  3CFF3C3C3CFF3C3C3CFF00000000000000000000000000000000000000000000
                  000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF383838F02F2F2FC73C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF2F2F2FC72121218D3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF2121218D101010463939
                  39F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF393939F310101046000000002121
                  218C3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF2121218C00000000000000000808
                  0820262626A33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF3C3C3CFF3C3C3CFF262626A30808082000000000000000000000
                  0000080808202121218C393939F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
                  3CFF3C3C3CFF393939F32121218C080808200000000000000000000000000000
                  00000000000000000000101010462121218D2F2F2FC7383838F0383838F02F2F
                  2FC72121218D1010104600000000000000000000000000000000}
                TabOrder = 3
                OnClick = btnExcluirProdutoClick
              end
            end
          end
        end
      end
    end
  end
end
