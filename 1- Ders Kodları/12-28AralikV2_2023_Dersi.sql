select * from musteri
select * from KonusmaKaydi



select musteri.ad, musteri.soyad, KonusmaKaydi.yon, sum(saniye)  from KonusmaKaydi 
inner join musteri on KonusmaKaydi.Musterikey = musteri.musterikey group by musteri.ad, musteri.soyad, KonusmaKaydi.yon




Declare @degisken int
set @degisken = (select top 1 KonusmaKaydi.yon from KonusmaKaydi)  
select case @degisken
when 1 then 'Sehir ici'
when 2 then 'Sehirler Arasi'
when 3 then 'Gsm'
end




select musteri.Ad, Musteri.Soyad, 
sum(case KonusmaKaydi.Yon when 1 then KonusmaKaydi.Saniye end)as Sehir_ici,
sum(case KonusmaKaydi.Yon when 2 then KonusmaKaydi.Saniye end) as Sehirler_arasi,
sum(case KonusmaKaydi.Yon when 3 then KonusmaKaydi.Saniye end) as Gsm from KonusmaKaydi 
inner join musteri on musteri.MusteriKey=KonusmaKaydi.MusteriKey
group by musteri.Ad, Musteri.Soyad



select musteri.Ad, Musteri.Soyad, 
if KonusmaKaydi.Yon = 1 begin sum(KonusmaKaydi.Saniye) end else begin null end ,
sum(case KonusmaKaydi.Yon when 2 then KonusmaKaydi.Saniye else null end) as Sehirler_arasi,
sum(case KonusmaKaydi.Yon when 3 then KonusmaKaydi.Saniye else null end) as Gsm from KonusmaKaydi 
inner join musteri on musteri.MusteriKey=KonusmaKaydi.MusteriKey
group by musteri.Ad, Musteri.Soyad