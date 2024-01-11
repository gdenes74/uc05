/*4. Crie um trigger que atue sobre a tabela “usuário” de modo que, ao
incluir um novo usuário, aplique automaticamente MD5() à coluna
“senha”.*/

DELIMITER $
CREATE TRIGGER tr_cript_senha before INSERT
ON usuario 
FOR EACH ROW
BEGIN
set new.senha = MD5(NEW.senha);
END$
DELIMITER ;

INSERT INTO usuario (id, login, senha, ultimo_login)
VALUES (DEFAULT, "Pimpo", "12233", curdate());
## Adicionando novo usuario criptografando a senha ##
-- --------------------------------------------------
INSERT INTO usuario (id, login, senha, ultimo_login) VALUES
( default,'eu mesmo testando', 'arboreo', curdate());

select * from usuario;



SET SQL_SAFE_UPDATES = 0;
UPDATE venda v 
SET valor_total = (SELECT sum(quantidade * valor_unitario) FROM item_venda iv WHERE iv.venda_id = v.id);