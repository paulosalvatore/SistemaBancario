ALTER TABLE tabelaQueReceberá
ADD FOREIGN KEY (campo)
REFERENCES tabelaReferencia(campoReferencia);

Exemplo:
ALTER TABLE usuarios
ADD FOREIGN KEY (agencia_id)
REFERENCES agencias(id);
