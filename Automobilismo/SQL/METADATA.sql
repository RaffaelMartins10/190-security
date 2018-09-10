set global sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

﻿/* drop table pais; */
create table pais (
  id int(10) unsigned not null auto_increment,
  nome varchar(60) not null,
  primary key (id),
  unique key uk_nome (nome)
);

/* drop table fabricante; */
create table fabricante (
  id int(10) unsigned not null auto_increment,
  nome varchar(60) not null,
  primary key (id),
  unique key uk_nome (nome)
);

/* drop table equipe; */
create table equipe (
  id int(10) unsigned not null auto_increment,
  nome varchar(60) not null,
  id_pais int(10) unsigned not null,
  id_fabricante_motor int(10) unsigned not null,
  id_fabricante_pneu int(10) unsigned not null,
  primary key (id),
  unique key uk_nome (nome),
  key ind_id_pais (id_pais),
  key ind_id_fabricante_motor (id_fabricante_motor),
  key ind_id_fabricante_pneu (id_fabricante_pneu),
  constraint fk_equipe_pais foreign key (id_pais)
  references pais(id),
  constraint fk_equipe_fabricante_motor foreign key (id_fabricante_motor)
  references fabricante(id),
  constraint fk_equipe_fabricante_pneu foreign key (id_fabricante_pneu)
  references fabricante(id)
);

/* drop table piloto; */
create table piloto (
  id int(10) unsigned not null auto_increment,
  nome varchar(60) not null,
  id_pais int(10) unsigned not null,
  data_nascimento date not null,
  primary key (id),
  key ind_id_pais (id_pais),
  constraint fk_piloto_pais foreign key (id_pais)
  references pais(id)
);

/* drop table equipe_piloto; */
create table equipe_piloto (
	id int(10) unsigned not null auto_increment,
	temporada int(4) not null,
	id_piloto int(10) unsigned not null,
	id_equipe int(10) unsigned not null,
	primary key (id),
	key ind_id_piloto (id_piloto),
	key ind_id_equipe (id_equipe),
    key ind_id_temporada (id, temporada),
	constraint fk_equipe_piloto_piloto foreign key (id_piloto)
    references piloto(id),
	constraint fk_equipe_piloto_equipe foreign key (id_equipe)
    references equipe(id) 
);

/* alter table equipe_piloto add key ind_id_temporada (id, temporada); */

/* drop table autodromo; */
create table autodromo (
	id int(10) unsigned not null auto_increment,
	nome varchar(60) not null,
	voltas int(2) not null,
	comprimento_km double not null,
	record time,
	id_pais int(10) unsigned not null,
	id_recordista int(10) unsigned,
	primary key (id),
	unique key uk_nome (nome),
	key ind_id_recordista (id_recordista),
	key ind_id_pais (id_pais),
	constraint fk_autodromo_equipe_piloto foreign key (id_recordista)
    references equipe_piloto(id),
    constraint fk_autodromo_pais foreign key (id_pais)
    references pais(id) 
);

/* drop table calendario; */
create table calendario (
	id int(10) unsigned not null auto_increment,
	temporada int(4) not null,
	id_autodromo int(10) unsigned not null,
	data date not null,
	primary key (id),
	unique key uk_temporada_id_autodromo (temporada, id_autodromo),
    key ind_id_autodromo (id_autodromo),
    key ind_id_temporada (id, temporada),
    constraint fk_calendario_autodromo foreign key (id_autodromo)
    references autodromo(id)
);

/* alter table calendario add key ind_id_temporada(id, temporada); */

/* drop table resultado; */
create table resultado (
	id int(10) unsigned not null auto_increment,
	id_calendario int(10) unsigned not null,
	temporada int(4) not null,
	posicao int(2) not null,
	id_equipe_piloto int(10) unsigned not null,
	primary key (id),
	unique key uk_id_calendario_posicao (id_calendario, posicao),
	unique key uk_id_calendario_id_equipe_piloto (id_calendario, id_equipe_piloto),
	key ind_id_calendario_temporada (id_calendario, temporada),
	key ind_id_equipe_piloto_temporada (id_equipe_piloto, temporada),
	constraint fk_resultado_calendario foreign key (id_calendario, temporada)
	references calendario(id, temporada),
	constraint fk_resultado_equipe_piloto foreign key (id_equipe_piloto, temporada)
	references equipe_piloto(id, temporada)
);
