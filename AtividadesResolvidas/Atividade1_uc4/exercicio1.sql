/*atividade1:1. Crie um usuário específico para relatórios. Crie role para ele, com
acesso apenas à consulta em tabelas (nem dados, nem estrutura podem
ser alterados).*/
create	user 'usuario_consulta'@'localhost' identified by '1234';
select * from mysql.user;
/*Criando  o papel, funcao, role consulta*/
   create role 'consulta';
   select * from mysql.user;
   /*permissao para o papel consulta*/
   grant select on uc4atividades.* to 'consulta';
    flush privileges;
    grant 'consulta' to 'usuario_consulta'@'localhost';
set default role 'consulta' to 'usuario_consulta'@'localhost';
flush privileges;
show grants for 'usuario_consulta'@'localhost';

