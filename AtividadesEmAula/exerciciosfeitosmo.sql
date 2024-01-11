create	user 'guiuc04'@'localhost' identified by '1234';
select * from mysql.user;
 drop user 'guiuc04'@'localhost';
 grant all privileges on *.* to 'guiuc04'@'localhost';
 flush privileges;
 revoke all privileges on *.* from 'guiuc04'@'localhost';
 /*conceder permissões parciais, sendo , create, update e insert */
 grant create, update, insert on *.* to 'guiuc04'@'localhost';
 flush privileges;
 show grants for 'guiuc04'@'localhost'  
 /*conceder permissão parcial em um existente: select*/
 grant select on *.* to 'guiuc04'@'localhost' ;
   flush privileges;
   revoke create on *.* from 'guiuc04'@'localhost' ;
 flush privileges;
  grant drop on *.* to 'guiuc04'@'localhost' ;
   flush privileges;
  revoke all privileges on *.* from 'guiuc04'@'localhost'; 
   /*Criando  o papel, funcao, role de programador e teste*/
   create role 'programador', 'teste';
   select * from mysql.user;
   /*permissao para o papel*/
   grant all on meudb.* to 'programador';
   grant select on meudb.* to 'teste';
   flush privileges;
/*atribuindo o papel, perfil, nome ao usuário guiuc04*/

grant 'programador' to 'guiuc04'@'localhost';
set default role 'programador' to 'guiuc04'@'localhost';
flush privileges;
show grants for 'guiuc04'@'localhost';

/*criando usuario bruno com role programador*/
create user 'bruno'@'localhost' identified by '123';
grant 'programador' to 'bruno'@'localhost';
set default role 'programador' to 'bruno'@'localhost';
flush privileges;
show grants for 'bruno'@'localhost';

revoke 'programador' from 'bruno'@'localhost';
grant 'teste' to 'bruno'@'localhost';
flush privileges;

show grants for 'bruno'@'localhost';

select *from funcionario