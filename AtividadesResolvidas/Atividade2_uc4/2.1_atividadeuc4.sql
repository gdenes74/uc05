/*1. Crie um stored procedure que receba id de cliente, data inicial e
data final e que mostre a lista de compras realizadas pelo referido cliente
entre as datas informadas (incluindo essas datas), mostrando nome do
cliente, id da compra, total, nome e quantidade de cada produto
comprado. No script, inclua o código de criação e uma chamada ao procedure.*/
 
/*select * from item_venda;
select * from venda where cliente_id=50;
select * from cliente where id=50;
Para confirmações de dados*/
DROP PROCEDURE sp_vendas_clientes
DELIMITER //
create procedure sp_vendas_clientes ( id_cliente int, datai datetime, dataf datetime)
begin

select cliente.nome,venda.id,venda.valor_total,item_venda.nome_produto,item_venda.quantidade
from   item_venda
join   venda   on item_venda.venda_id = venda.id
join   cliente on venda.cliente_id    = cliente.id
where  cliente.id = id_cliente
and    venda.data between datai and dataf
;
end//
DELIMITER ;
call sp_vendas_clientes(50, '2019-01-08 10:10:00', '2022-01-13 12:01:00');

















