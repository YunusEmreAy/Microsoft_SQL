create database VT_Sirket
use VT_Sirket

create table tbl_Departman
(
id int primary key, -- unique, not null
ad varchar(20) not null,
tarih varchar(4)
);


insert into tbl_Departman values(1,'satinalma','2020');
insert into tbl_Departman(ad,tarih,id) values ('bilgi-islem','2021',2)
insert into tbl_Departman(ad,id) values ('temizlik',3)

select * from tbl_Departman

-- CREATE = yeni bir �ey olu�tururken kullan�l�r
-- INSERT INTO = veri taban�na bilgi eklerken kullan�l�r
-- ALTER = tablo yap�s�n� de�i�tirmek i�in kullan�l�r

ALTER TABLE tbl_Departman add baskan varchar(30);
alter table tbl_departman alter column baskan varchar(30) not null; -- ifadesi ile de�i�tirme i�lemi yap�lamaz ��nk� tabloda null de�erleri var
ALTER TABLE tbl_Departman add baskan2 varchar(30) not null; -- ifadesini sonradan eklemeye �al���p bir de not null dedi�imiz i�in olu�turamay�z
alter table tbl_Departman alter column tarih int
insert into tbl_Departman values (4,'lojistik',2023,'ahmet')
alter table tbl_Departman alter column id varchar(2) -- primary key den dolay� olmad�

create table tbl_Calisan 
(
sicil int,
ad varchar(20),
kidem int
)



alter table tbl_calisan alter column sicil int not null;
alter table tbl_calisan alter column sicil int primary key -- bu �ekilde sonradan primary key yap�lm�yor
alter table tbl_calisan add constraint pk_calisan primary key(sicil);
select * from tbl_Calisan

alter table tbl_calisan drop constraint pk_Calisan;
select * from tbl_Calisan

select * from tbl_Departman

update tbl_Departman set baskan='mehmet' where id<3;
update tbl_Departman set baskan='ali' where id = 3;
select * from tbl_Departman

delete from tbl_Departman where baskan='ali';
select * from tbl_Departman

truncate table tbl_departman;
select * from tbl_Departman

insert into tbl_Departman values (1,'yunus',2020,'emre')
insert into tbl_Departman values (2,'serhat',2022,'emre')
insert into tbl_Departman values (3,'ozgur',2023,'recep')
insert into tbl_Departman values (4,'enes',2025,'emre')
insert into tbl_Departman values (5,'metin',2027,'ramazan')
select * from tbl_Departman

use master
drop database VT_Sirket