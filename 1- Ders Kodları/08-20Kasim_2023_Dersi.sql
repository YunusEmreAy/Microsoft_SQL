create database lab
use lab

CREATE table musteri(
musteri_id int primary key,
ad varchar(20),
soyad varchar(20),
adres varchar(20),
borc int check(borc>0),)

create table urun(
urun_id int primary key,
urun_ad varchar(20),
stok int default 1)

create table siparis(
tablo_id int primary key,
siparis_id int,
mus_id int,
u_id int,
tarih varchar(20))

alter table siparis add constraint fk_siparis_musteri foreign key (mus_id) references musteri(musteri_id);
alter table siparis add constraint fk_siparis_urun foreign key (u_id) references urun(urun_id);


insert into musteri(musteri_id,ad,soyad,adres,borc) values
(1,'Ali','Aydýn','Konya',1),
(2,'Enes','Seven','Sivas',10),
(3,'Veli','Apaydýn','Konya',3),
(4,'Ayþe','Aydan','Konya',1000),
(5,'Ahmet','Bidon','Konya',500),
(6,'Mehmet','Kaya','Konya',1);

select * from musteri

insert into urun (urun_id,urun_ad,stok) values
(1,'Bilgisayar',10),
(2,'Televizyon',1),
(3,'Ütü',7),
(4,'PS',10),
(5,'Çamaþýr Makinesi',1);

select * from urun

insert into siparis(tablo_id,siparis_id,mus_id,u_id,tarih) values
(1,1,1,1,'10.10.2023'),
(2,1,1,2,'10.10.2023'),
(3,1,1,4,'10.10.2023'),
(4,2,2,1,'15.10.2023'),
(5,3,4,3,'20.10.2023'),
(6,4,4,5,'10.12.2023'),
(7,5,5,2,'21.10.2021'),
(8,5,5,4,'10.10.2003'),
(9,6,2,2,'01.01.2023');

select * from siparis

select s.siparis_id,m.ad,m.soyad,u.urun_ad,s.tarih from siparis s, musteri m, urun u 
where m.musteri_id = s.mus_id and u.urun_id = s.u_id


select s.siparis_id,m.ad,m.soyad,u.urun_ad,s.tarih from 
(siparis s inner join musteri m on s.mus_id=m.musteri_id) inner join urun u on u.urun_id=s.u_id


update urun set stok=stok-1 where urun_id in 
(select u_id from siparis where mus_id in 
(select mus_id from musteri where ad='Ali'))


update urun set stok=stok+1 where urun_id in
(select u_id from siparis where mus_id =
(select musteri_id from musteri where ad='Ahmet' and soyad='Bidon'))

update musteri set borc=0 where ad='Veli' -- borc 0 dan küçük olamaz

update musteri set borc= m.borc+u.urun_id from musteri m, siparis s, urun u where 
m.musteri_id = s.mus_id and s.u_id = u.urun_id	
-- siparis tablosunda ürünü sipris veren kiþinin borcunu, siparis ettiði ürünün id si kadar arttýrýr

select * from musteri m, siparis s, urun u where m.musteri_id = s.mus_id and s.u_id = u.urun_id