create database Labdeneme
use Labdeneme


create table musteri(
musteri_no int primary key identity(1,1),
adsoyad varchar(20));

insert into musteri values ('PESÝN')

create table urun(
urun_no int primary key identity(1,1),
ad varchar(20),
fiyat float check(fiyat>0));


create table siparis(
siparis_no int primary key identity(1,1),
urun_no int foreign key references urun(urun_no) on delete set NULL on update cascade,
musteri_no int default 1 foreign key references musteri(musteri_no) on delete set default on update cascade,
tutar float);


insert into musteri values ('Yunsu Emre Ay')
insert into musteri values ('Serhat Kamamcý')
insert into musteri values ('Özgür Kara')
insert into musteri values ('Metin Çetin Tekin')
insert into musteri values ('Enes Eren Seven')




insert into urun values ('Bisküvi',150)
insert into urun values ('Seker',230)
insert into urun values ('Yag',480)
insert into urun values ('Un',60)
insert into urun values ('Deterjan',50)


insert into siparis values (2,3,300);
insert into siparis values (1,1,60);
insert into siparis values (1,2,90);
insert into siparis values (2,1,200);
insert into siparis values (2,3,300);
insert into siparis values (3,1,260);


-- ON DELETE / ON UPDATE

-- NO ACTÝON
-- SET NULL
-- SET DEFAULT
-- CASCATE

select siparis.siparis_no, musteri.musteri_no, musteri.adsoyad,urun.urun_no, urun.ad from siparis
full join musteri on siparis.musteri_no = musteri.musteri_no
full join urun on siparis.urun_no = urun.urun_no -- full join kullandýk


create view siparis_ozet as 
select siparis.siparis_no, musteri.musteri_no, musteri.adsoyad,urun.urun_no, urun.ad from siparis
full join musteri on siparis.musteri_no = musteri.musteri_no
full join urun on siparis.urun_no = urun.urun_no


select * from siparis_ozet

delete from musteri where adsoyad = 'Özgür Kara'
select * from siparis_ozet

delete from urun where urun_no = 5;
select * from siparis_ozet


