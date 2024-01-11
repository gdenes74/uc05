/*atividade2:Crie usuário e role para funcionário, o qual pode manipular as
tabelas de venda, cliente e produto, mas não deve ter acesso (nem para
consulta) a funcionário e cargo e não deve ser capaz de realizar
alterações de estrutura em nenhuma tabela*/
create	user 'usuariovendedor'@'localhost' identified by '1234';
select * from mysql.user;
/*Criando  o papel, funcao, role consulta*/
   create role 'vendedor';
   select * from mysql.user;
   /*permissao para o papel vendedor*/
   grant select,insert,update,delete,create,drop on uc4atividades.venda to 'vendedor';
   grant select,insert,update,delete,create,drop on uc4atividades.cliente to 'vendedor';
   grant select,insert,update,delete,create,drop on uc4atividades.produto to 'vendedor';
    flush privileges;
    grant 'vendedor' to 'usuariovendedor'@'localhost';
set default role 'vendedor' to 'usuariovendedor'@'localhost';
flush privileges;
show grants for 'usuariovendedor'@'localhost';
show grants for 'vendedor'

