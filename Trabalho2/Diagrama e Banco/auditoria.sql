use master 
go
drop database  if exists trabalhobd2
go
create database trabalhobd2
go
use trabalhobd2
go

create table sessao(
	idSessao int not null,
	usuario varchar(50) not null,
	ip varchar(50) not null
	Primary key (idSessao)
)
go
create table link(
	idLink int not null,
	destino varchar(50) not null,
	titulo varchar(50) not null,
	target varchar(50) not null
	primary key (idLink)
)
go
create table logs(
	idLogs int not null,
	mensagens varchar(100) not null,
	idSessao int not null
	Primary key (idLogs, idSessao)
	Foreign key (idSessao) references sessao(idSessao)
)
go
create table pagina(
	idPagina int not null,
	html varchar(50) not null,
	tipo varchar(50) not null,
	titulo varchar(50) not null,
	url varchar(50) not null,
	tamanho int not null
	Primary key(idPagina)
)
go
create table pagina_Link(
	idPagina int not null,
	idLink int not null
	primary key(idPagina, idLink)
	foreign key(idPagina)references pagina(idPagina),
	foreign key(idLink) references link(idLink)
)
go
create table requisissao(
	idRequisissao int not null,
	http int not null,
	tempo int not null,
	idSessao int not null,
	idPagina int not null
	Primary key(idRequisissao)
	Foreign key(idSessao) references sessao(idSessao),
	Foreign key(idPagina) references pagina(idPagina)
)
go

go--CRIA A TRIGER PARA VERIFICAR IP VALIDO
create trigger t_ips on sessao
after insert, update
as
begin
	declare @ip varchar(50)
	set @ip = (select ip from inserted)
	if (@ip not like '[0-9]%.[0-9]%.[0-9]%.[0-9]%'
		or try_cast(Parsename(@ip, 1) as int) < 0 or try_cast(Parsename(@ip, 1) as int)> 255
		or try_cast(Parsename(@ip, 2) as int) < 0 or try_cast(Parsename(@ip, 2) as int)> 255
		or try_cast(Parsename(@ip, 3) as int) < 0 or try_cast(Parsename(@ip, 3 ) as int)> 255
		or try_cast(Parsename(@ip, 4) as int) < 0 or try_cast(Parsename(@ip, 4 ) as int)> 255)	
	begin
		raiserror('Ip invalido', 16, 1)
		rollback transaction
	end
end
go
--TESTE para ver se  a trigger funciona corretamente
insert into sessao values (112, 'RENATO', '0')
SELECT * FROM sessao
insert into sessao values (100, 'RENATO', '1.1.1.1')
SELECT * FROM sessao
insert into sessao values (114, 'RENATO', '55.5.5.533')
SELECT * FROM sessao
insert into sessao values (115, 'RENATO', 'aaaaa')
SELECT * FROM sessao
insert into sessao values (116, 'RENATO', 'a.a.aa.a')
SELECT * FROM sessao

--CRIA ATRIGER PARA TRATAR O REQUISITO DE HTTP VALIDO
go
create trigger t_http on requisissao
after insert, update
as
begin
	declare @http int
	set @http = (select http from inserted) 
	if (@http < 100 or @http > 599) 
	begin
		raiserror('Http invalido', 16, 1)
		rollback transaction
	end
end
go
--TESTE SE A TRIGGER FUNCIONA CORRETAMENTE
insert into sessao values (101, 'Teste', '192.168.1.1');
insert into pagina values (101, 'htmlTeste', 'teste', 'teste', 'teste', 1024);
insert into requisissao values (101, 455, 10, 101, 101)
select * from requisissao
insert into requisissao values (102, 90, 10, 101, 101)
select * from requisissao
insert into requisissao values (103, 600, 10, 101, 101)
select * from requisissao

Go
--CRIA ATRIGER PARA TRATAR O REQUISITO DE tempo VALIDO
create trigger t_tempo on requisissao
after insert, update
as
begin
	declare @tempo int
	set @tempo = (select tempo from inserted)
	if(@tempo > 60)
	begin
		raiserror('TIMEOUT : Tempo superior a 1 Minuto', 16, 1)
		rollback transaction
	end
end
go--TESTE SE A TRIGGER FUNCIONA CORRETAMENTE
insert into sessao values (102, 'Teste', '192.168.1.1');
insert into pagina values (102, 'htmlTeste', 'teste', 'teste', 'teste', 1024);
insert into requisissao values (103, 455, 61, 102, 102)
select * from requisissao
insert into requisissao values (102, 455, 60, 102, 102)
select * from requisissao
go
--CRIA ATRIGER PARA TRATAR O REQUISITO DE tamanho VALIDO
create trigger t_tamanho on pagina
after insert, update
as
begin
	declare @tamanho int
	set @tamanho = (select tamanho from inserted)	
	if(@tamanho > 1048576)
	begin
		raiserror('Tamanho superior a 1Mb', 16, 1)
		rollback transaction
	end
end
go
--teste 
insert into pagina values (103, 'gogle', 'html', 'teste', 'ww.w', 12)
select * FROM pagina
go
insert into pagina values (118, 'goagle', 'hal', 'taa', 'waaa', 1048577)
select * FROM pagina
go

--CRIA ATRIGER PARA TRATAR O REQUISITO DE target VALIDO
create trigger t_target on link
after insert, update
as
begin
	declare @target varchar(50)
	set @target = (Select target from inserted)
	if (@target not like '_blank'  and 
		@target not like '_self'   and
		@target not like '_parent' and
		@target not like '_top' )
	begin
		raiserror('Target Invalido => Target validos são apenas: _blank, _self, _parent, _top.', 16, 1)
		rollback transaction
	end
end
go
-- teste
insert into link values (100, 'ww.google', 'google', '_blank')
select * from link
insert into link values (110, 'ww.google', 'google', '_teste')
select * from link