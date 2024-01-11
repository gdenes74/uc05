/*3. Crie uma stored function que receba id de cliente e retorne se o
cliente é “PREMIUM” ou “REGULAR”. Um cliente é “PREMIUM” se já
realizou mais de R$ 10 mil em compras nos últimos dois anos. Um cliente
é “REGULAR” se ao contrário. No script, inclua o código de criação e uma
chamada à function*/
SELECT * FROM CLIENTE;
DROP function  f_cat_cliente ; 
DELIMITER //
create function  f_cat_cliente(id_cliente int) returns varchar(7) deterministic
begin
	declare resultado  varchar(7);    
  
select  sum(venda.valor_total) into resultado
from venda 
where  venda.cliente_id=id_cliente and TIMESTAMPDIFF(YEAR, data, curdate())>=2;
	if resultado <10000 then
        return 'REGULAR';
	ELSE
		RETURN 'PREMIUM';
	END IF;
    
End//
DELIMITER ;
## CHAMANDO a FUNCTION CONFORME ID DO CLIENTE ##
-- ------------------------------------------------------------------

select f_cat_cliente(50);

select cliente_id,sum(venda.valor_total) 
from venda
where cliente_id =50

