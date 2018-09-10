create or replace view vw_piloto as
select pi.id "Id."
     , pi.nome "Nome"
     , pi.data_nascimento "Data de Nascimento"
     , TimeStampDiff(YEAR, pi.data_nascimento, CURDATE()) "Idade"
     , pa.nome "País"
  from piloto pi
     , pais pa 
 where pa.id = pi.id_pais;