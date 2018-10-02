insert into cidadao values (1,'jose',1010010058,430351378,'asdf','--','--');
insert into id_emergencia values (1,1);

create table cidadao (
	id int(10) unsigned not null auto_increment,
	nome varchar(60) not null,
	cpf int(11)not null,
	telefone int(12)not null,
	endereco varchar(80) not null,
	cidade varchar(60) not null,
	estado varchar(2) not null,	
	primary key (id),
	unique key uk_cpf (cpf)
) engine=InnoDB auto_increment=1 DEFAULT CHARSET=utf8;

create table emergencia (
	id int(10) unsigned not null auto_increment,
	id_cidadao int(10) unsigned not null,
	data_hora timestamp not null,
	primary key (id),
	key ind_id_cidadao (id_cidadao),
	constraint fk_emergencia_cidadao foreign key (id_cidadao) references cidadao(id)
	) engine=InnoDB auto_increment=1 DEFAULT CHARSET=utf8;
	

	
create or replace view vw_emergencia as
select em.id "Id."
     , em.data_hora "Data e Hora"
     , ci.nome "Nome do Cidadão"
     , ci.cpf "CPF"
     , ci.telefone "Tel."     
     , ci.endereco "Endereço"     
  from cidadao ci
     , emergencia em 
 where ci.id = em.id_cidadao;
 	
select * from vw_emergencia; 	