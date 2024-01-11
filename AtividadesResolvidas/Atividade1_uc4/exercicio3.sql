/*3 . Escolha um método de criptografia ou hash para aplicar às senhas
dos usuários. Atualize a tabela “usuário” aplicando a criptografia
ou hash ao campo de senha em todos os registros*/

select *from usuario;
SET SQL_SAFE_UPDATES=0;
update usuario set senha=md5(senha);

