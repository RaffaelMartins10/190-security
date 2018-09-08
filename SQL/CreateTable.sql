create table pessoa_civil (
	id int(10) unsigned not null auto_increment,
	nome varchar(60) not null,
	cpf int(11)not null,
	telefone int(12)not null,
	endereco varchar(80) not null,
	bairro varchar(60) not null,
	cidade varchar(60) not null,
	estado varchar(2) not null,	
	primary key (id),
	unique key uk_cpf (cpf)
) engine=InnoDB auto_increment=1 DEFAULT CHARSET=utf8;

create table pollicia_militar (
	id int(10) unsigned not null auto_increment,
	nome varchar(60) not null,
	codigo_policia int(12)not null,
	cpf int(11)not null,
	telefone int(12)not null,
	endereco varchar(80) not null,
	bairro varchar(60) not null,
	cidade varchar(60) not null,
	estado varchar(2) not null,	
	primary key (id),
	unique key uk_cpf (cpf),
	unique key uk_codigo_policia (codigo_policia)
) engine=InnoDB auto_increment=1 DEFAULT CHARSET=utf8;