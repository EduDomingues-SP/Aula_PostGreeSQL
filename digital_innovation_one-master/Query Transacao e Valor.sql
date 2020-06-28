SELECT banco.nome,

  agencia.nome,

  conta_corrente.numero,

  conta_corrente.digito,

  cliente.nome,

  tipo_transacao.nome,

cliente_transacoes.valor

FROM banco



JOIN agencia 

  ON agencia.banco_numero = banco.numero



JOIN conta_corrente 

  ON conta_corrente.banco_numero = banco.numero

  AND conta_corrente.agencia_numero = agencia.numero



JOIN cliente

  ON cliente.numero = conta_corrente.cliente_numero



JOIN cliente_transacoes



  ON cliente_transacoes.cliente_numero = cliente.numero



JOIN tipo_transacao

  ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id;