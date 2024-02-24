use VT_SARF_MAZLEME

select * from MUSTERI
select * from SIPARIS
select * from URUN
select * from TEDARIKCI


-------------------- 1.Soru --------------------
create table TEDARIKCI(
T_ID int primary key,
AD varchar(30),
VERGI_NO int not null,
TEDARIK_EDILEN_URUN_KODU int,
ADRES varchar(30) default 'Konya',)


-------------------- 2.Soru --------------------
alter table MUSTERI alter column MUSTERI_NO int not null;
alter table MUSTERI add constraint pk_musteri primary key (MUSTERI_NO);
alter table SIPARIS add constraint Sk_siparis foreign key (MUSTERI_KODU) references MUSTERI(MUSTERI_NO) ON DELETE SET NULL;


-------------------- 3.Soru --------------------
alter table URUN alter column U_ID int not null;
alter table URUN add constraint pk_urun primary key (U_ID);
alter table TEDARIKCI add constraint sk_tedarikci foreign key (TEDARIK_EDILEN_URUN_KODU) references URUN(U_ID) ON DELETE cascade;


-------------------- 4.Soru --------------------
select sum(URUN.BIRIM_FIYAT*SIPARIS.MIKTAR) from SIPARIS inner join URUN ON SIPARIS.URUN_KODU = URUN.U_ID


-------------------- 5.Soru --------------------
select MUSTERI.AD, MUSTERI.SOYAD, MUSTERI.TELEFON, sum(URUN.BIRIM_FIYAT*SIPARIS.MIKTAR) as toplam_fiyat from SIPARIS
inner join MUSTERI on SIPARIS.MUSTERI_KODU = MUSTERI.MUSTERI_NO
inner join URUN on SIPARIS.URUN_KODU = URUN.U_ID where MUSTERI.AD = 'Ayse' and MUSTERI.SOYAD = 'Dagli' group by MUSTERI.AD, MUSTERI.SOYAD, MUSTERI.TELEFON


-------------------- 6.Soru --------------------
select MUSTERI.AD, MUSTERI.SOYAD, URUN.AD, URUN.BIRIM_FIYAT, SIPARIS.MIKTAR, URUN.BIRIM_FIYAT*SIPARIS.MIKTAR from SIPARIS
inner join MUSTERI on SIPARIS.MUSTERI_KODU = MUSTERI.MUSTERI_NO
inner join URUN on SIPARIS.URUN_KODU = URUN.U_ID


-------------------- 7.Soru --------------------
select ODEME_TURU, sum(SIPARIS.MIKTAR*URUN.BIRIM_FIYAT) AS Toplam_TUTAR from SIPARIS
inner join URUN on SIPARIS.URUN_KODU = URUN.U_ID GROUP BY ODEME_TURU


-------------------- 8.Soru --------------------
select MUSTERI.MUSTERI_NO, MUSTERI.AD+' '+MUSTERI.SOYAD from MUSTERI






