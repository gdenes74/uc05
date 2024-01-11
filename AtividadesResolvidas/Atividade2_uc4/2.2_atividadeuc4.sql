/*2. Crie uma stored function que receba id de funcionário,
 data inicial
e data final 
e retorne a comissão total desse funcionário no período indicado. 
No script, inclua o código de criação e uma chamada à function*/
select * from funcionario;
select* from venda;
select* from item_venda;
select * from cargo;-- vendedor com id = 2 e supervisor vendas id= 4 possuem comissao 10%--
select v.valor_total, f.cargo_id
from venda as v inner join funcionario as f on( v.funcionario_id=f.id)           
where
f.id=3;
/*INÍCIO AQUI*/
DROP function  f_comissao_func ; 
DELIMITER //
create function  f_comissao_func(id_funcionario int, datai datetime, dataf datetime) returns decimal (10,2) deterministic
begin
	declare comissao decimal(10,2);    
  
select  sum((v.valor_total*c.comissao)/100)	into comissao
from venda as v	
	join funcionario as f ON f.id = v.funcionario_id
	join cargo as c ON c.id= f.cargo_id
    
where
f.id=id_funcionario
and    v.data between datai and dataf;

return comissao;
end//
DELIMITER ;
/*IMPRIMINDO AS COMISSÕES NA TELA*/
select f_comissao_func(1, '2019-01-08 10:10:00', '2022-01-13 12:01:00') as 'Comissão';
