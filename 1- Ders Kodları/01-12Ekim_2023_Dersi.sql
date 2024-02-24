create database VT_OKUL

use VT_OKUL
create table tbl_Ogrenci(
id int not null primary key, 
isim varchar(30) not null,
soyisim varchar(30));

alter table tbl_Ogrenci add dogumtarihi varchar(30)

alter table tbl_Ogrenci alter column dogumtarihi date;

alter table tbl_Ogrenci alter column isim nvarchar(20)

insert into tbl_Ogrenci values (1, 'Ali', 'Kaya', '1986')

select * from tbl_Ogrenci

insert into tbl_Ogrenci values (2, 'Ay�e', 'Da�', '')

select * from tbl_Ogrenci

insert into tbl_Ogrenci (id, isim, soyisim) values (3, 'ozgur', 'kara')

select * from tbl_Ogrenci

-- �oklu kay�t ekleme
insert into tbl_Ogrenci values (4, 'Veli', 'Alan', '1995'),
							   (5, 'Fatma', 'Y�lmaz', '2003')

select * from tbl_Ogrenci

-- yorum sat�r� ekleme
----------------------------------------------------------------------------------------


create table tbl_Ogretmen (id int not null)

insert into tbl_Ogretmen values (1), (2), (3)

select * from tbl_Ogretmen


alter table tbl_Ogretmen alter column id varchar(2)

select * from tbl_Ogretmen

insert into tbl_Ogretmen values ('4')

select * from tbl_Ogretmen

alter table tbl_Ogretmen alter column id int

select * from tbl_Ogretmen

alter table tbl_Ogretmen alter column id varchar(2)
insert into tbl_Ogretmen values ('a')
select * from tbl_Ogretmen

alter table tbl_Ogretmen alter column id int -- o kadar da de�il
----------------------------------------------------------------------------------------

create table tbl_Dersler (id int identity(1,1) primary key, ders_adi varchar(20)); 
-- identity 2 parametre al�r, ilk parametre nereden ba�layaca��, 2. parametre ad�m say�s�


go 
insert into tbl_Dersler values ('matematik')
go 5

select * from tbl_Dersler

update tbl_Dersler set ders_adi = 'T�rkce'
select * from tbl_Dersler

update tbl_Dersler set ders_adi = 'Beden'
where id = 3
select * from tbl_Dersler
----------------------------------------------------------------------------------------

delete top(2) from tbl_Dersler
select * from tbl_Dersler

delete from tbl_Dersler where id = 4
select * from tbl_Dersler

insert into tbl_Dersler values ('matematik')
select * from tbl_Dersler

delete from tbl_Dersler
insert into tbl_Dersler values ('m�zik')
select * from tbl_Dersler

truncate table tbl_Dersler-- id leri de siler
select * from tbl_Dersler


insert into tbl_Dersler values ('m�zik')
select * from tbl_Dersler

drop table tbl_Dersler


USE master
drop database VT_OKUL