object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 355
  Width = 485
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 152
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\RAD\libmysql.dll'
    Left = 56
    Top = 32
  end
  object cnx: TFDConnection
    Params.Strings = (
      'Database=locacao'
      'User_Name=root'
      'Password=210389'
      'DriverID=MySQL')
    Connected = True
    Left = 56
    Top = 96
  end
  object qProduto: TFDQuery
    Connection = cnx
    SQL.Strings = (
      'SELECT * FROM PRODUTO')
    Left = 360
    Top = 16
    object qProdutoidproduto: TFDAutoIncField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qProdutodescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 255
    end
    object qProdutoquantidade: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object qProdutoquantidadealocado: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadealocado'
      Origin = 'quantidadealocado'
    end
    object qProdutocodigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'codigo'
      Origin = 'codigo'
      Size = 30
    end
  end
  object dsProduto: TDataSource
    DataSet = qProduto
    Left = 408
    Top = 16
  end
  object qHistorico: TFDQuery
    BeforeOpen = qHistoricoBeforeOpen
    Connection = cnx
    SQL.Strings = (
      'SELECT * FROM HISTORICOLOCACAO'
      'where idproduto = :idproduto'
      'order by dataalteracao')
    Left = 360
    Top = 72
    ParamData = <
      item
        Name = 'IDPRODUTO'
        ParamType = ptInput
      end>
    object qHistoricoidhistorico: TFDAutoIncField
      FieldName = 'idhistorico'
      Origin = 'idhistorico'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qHistoricoidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Required = True
    end
    object qHistoricoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
    end
    object qHistoricodescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 255
    end
    object qHistoricoentradasaida: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'entradasaida'
      Origin = 'entradasaida'
    end
    object qHistoricodataalteracao: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object qHistoricoidprodutolocacao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idprodutolocacao'
      Origin = 'idprodutolocacao'
    end
  end
  object dsHistorico: TDataSource
    DataSet = qHistorico
    Left = 408
    Top = 72
  end
  object qLocacao: TFDQuery
    AfterEdit = qLocacaoAfterEdit
    Connection = cnx
    SQL.Strings = (
      'SELECT '
      '  locacao.`datadevolucao`,'
      '  locacao.previsaodevolucao,'
      '  locacao.`datalocacao`,'
      '  locacao.`idcliente`,'
      '  locacao.`idlocacao`,'
      '  locacao.`idusuario`,'
      '  locacao.`locacaoencerrada`,'
      '  locacao.observacao,'
      '  `usuario`.`nome` AS "Usu'#225'rio",'
      '  cliente.`nome` AS "Cliente",'
      '  cliente.bairro,'
      '  cidade.nome as "Cidade",'
      '  cliente.endereco'
      'FROM'
      '  locacao '
      '  INNER JOIN cliente '
      '    ON locacao.`idcliente` = cliente.`idcliente` '
      'left outer join cidade on'
      'cliente.codigoibge = cidade.codigoibge'
      '  INNER JOIN `usuario` '
      '    ON usuario.`idusuario` = locacao.`idusuario` '
      '')
    Left = 360
    Top = 136
    object qLocacaoidlocacao: TFDAutoIncField
      FieldName = 'idlocacao'
      Origin = 'idlocacao'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qLocacaoidcliente: TIntegerField
      FieldName = 'idcliente'
      Origin = 'idcliente'
      Required = True
    end
    object qLocacaodatalocacao: TDateTimeField
      FieldName = 'datalocacao'
      Origin = 'datalocacao'
      Required = True
    end
    object qLocacaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
    end
    object qLocacaolocacaoencerrada: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'locacaoencerrada'
      Origin = 'locacaoencerrada'
    end
    object qLocacaodatadevolucao: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'datadevolucao'
      Origin = 'datadevolucao'
    end
    object qLocacaoCliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Cliente'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object qLocacaoUsuário: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Usu'#225'rio'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object qLocacaoendereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'endereco'
      Origin = 'endereco'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object qLocacaobairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bairro'
      Origin = 'bairro'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qLocacaoCidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Cidade'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qLocacaoprevisaodevolucao: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'previsaodevolucao'
      Origin = 'previsaodevolucao'
    end
    object qLocacaoobservacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 600
    end
  end
  object dsLocacao: TDataSource
    DataSet = qLocacao
    Left = 408
    Top = 136
  end
  object qProdutoLocacao: TFDQuery
    AfterEdit = qProdutoLocacaoAfterEdit
    OnCalcFields = qProdutoLocacaoCalcFields
    Connection = cnx
    SQL.Strings = (
      'SELECT '
      '  `produtolocacao`.*,'
      '  produto.`descricao` AS "Produto"'
      'FROM'
      '  produtolocacao '
      '  INNER JOIN produto'
      '    ON produtolocacao.`idproduto` = produto.`idproduto`')
    Left = 320
    Top = 192
    object qProdutoLocacaoidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Required = True
    end
    object qProdutoLocacaoidlocacao: TIntegerField
      FieldName = 'idlocacao'
      Origin = 'idlocacao'
      Required = True
    end
    object qProdutoLocacaoquantidade: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object qProdutoLocacaoProduto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object qProdutoLocacaoquantidadedevolvida: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadedevolvida'
      Origin = 'quantidadedevolvida'
    end
    object qProdutoLocacaoidprodutolocacao: TFDAutoIncField
      FieldName = 'idprodutolocacao'
      Origin = 'idprodutolocacao'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qProdutoLocacaoquantidaderestante: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'quantidaderestante'
    end
  end
  object dsProdutoLocacao: TDataSource
    DataSet = qProdutoLocacao
    Left = 408
    Top = 192
  end
  object qUsuario: TFDQuery
    Connection = cnx
    SQL.Strings = (
      'Select * from usuario')
    Left = 360
    Top = 256
    object qUsuarioidusuario: TFDAutoIncField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qUsuarionome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 255
    end
    object qUsuariosenha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'senha'
      Origin = 'senha'
    end
  end
  object dsUsuario: TDataSource
    DataSet = qUsuario
    Left = 408
    Top = 256
  end
  object qCliente: TFDQuery
    Connection = cnx
    SQL.Strings = (
      'Select cliente.*, cidade.nome as "Cidade",'
      'cidade.uf'
      ' from cliente LEFT OUTER join cidade on'
      'cliente.codigoibge = cidade.codigoibge')
    Left = 360
    Top = 304
    object qClienteidcliente: TFDAutoIncField
      FieldName = 'idcliente'
      Origin = 'idcliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qClientenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 255
    end
    object qClientecpf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cpf'
      Origin = 'cpf'
      FixedChar = True
      Size = 11
    end
    object qClienteendereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 255
    end
    object qClientebairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 100
    end
    object qClientecodigoibge: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codigoibge'
      Origin = 'codigoibge'
    end
    object qClienteCidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Cidade'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qClienteuf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
  end
  object dsCliente: TDataSource
    DataSet = qCliente
    Left = 408
    Top = 304
  end
  object qCidade: TFDQuery
    Connection = cnx
    SQL.Strings = (
      'select * from cidade')
    Left = 256
    Top = 16
    object qCidadecodigoibge: TIntegerField
      FieldName = 'codigoibge'
      Origin = 'codigoibge'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qCidadenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object qCidadeuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object dsCidade: TDataSource
    DataSet = qCidade
    Left = 304
    Top = 16
  end
  object qAux: TFDQuery
    Connection = cnx
    SQL.Strings = (
      'select * from cidade')
    Left = 256
    Top = 72
  end
  object dsAux: TDataSource
    DataSet = qAux
    Left = 304
    Top = 72
  end
end
