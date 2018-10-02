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

create table policial (
	id int(10) unsDesc. Situaçãoigned not null auto_increment,
	nome_policial varchar(60) not null,
	cpf_policial varchar(11) not null,
	senha varchar(60) not null,
	primary key (id),
	key id_policial (id),
	unique key uk_cpf_policial (cpf_policial)
	) engine=InnoDB auto_increment=1 DEFAULT CHARSET=utf8;

create or replace view vw_civill as
select ci.id "Id."
     , ci.nome "Nome do Policial"
     , po.cpf_policial "CPF"
from cidadao ci;

create or replace view vw_resumo_ocorrencia_cidade as select ci.cidade "Cidade"
													  , count(ci. ) "total_ocorrencias"			
	 from cidadao ci;

insert into cidadao values (12,'Antonio Martins',10041245563,4792723253,'Rua Antonio da veiga,555-ap407,Victor Konder','Indaial','SC');
insert into emergencia values (20, 19, curdate(), 0); 
select cidade, count(nome) total_ocorrencias from cidadao group by cidade;