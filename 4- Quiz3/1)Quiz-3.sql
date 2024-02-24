use ARAC_SATIS  -- 21100011016 / Yunus Emre Ay --
				

select * from TblAraclar
select * from TblAracSahibi
select * from TblÝl
select * from TblMarka
select * from TblModel
select * from TblVites

---------------------- 1.Soru ----------------------
-- 1. Araç markasý-modeli, araç sahibinin adý-soyadý-ceptelefonu, aracýn vites türü, kilometresi ve fiyat bilgilerini getren sorguyu yazýnýz.

Select TblMarka.isim, TblModel.model, TblAracSahibi.isim, TblAracSahibi.soyisim, TblAracSahibi.ceptel, TblVites.tur, TblAraclar.km, TblAraclar.fiyat from TblAraclar
inner join TblMarka on TblAraclar.marka_id = TblMarka.id
inner join TblModel on TblAraclar.model_id = TblModel.id
inner join TblAracSahibi on TblAraclar.sahip_id = TblAracSahibi.id
inner join TblVites on TblAraclar.vites_id = TblVites.id


---------------------- 2.Soru ----------------------
-- 2. Her Araç Sahibinin kaç aracý olduðunu getiren sorguyu yazýnýz.

select TblAracSahibi.isim, TblAracSahibi.soyisim, count(*) as Arac_sayisi from TblAraclar  
inner join TblAracSahibi on TblAraclar.sahip_id = TblAracSahibi.id group by TblAracSahibi.isim, TblAracSahibi.soyisim


---------------------- 3.Soru ----------------------
-- 3. Markalara göre araçlarýn ortalama fiyatlarýný pahalýdan ucuza doðru getiren sorguyu yazýnýz. 

select TblMarka.isim, avg(TblAraclar.fiyat) as ortalama_fiyat from TblAraclar
inner join TblMarka on TblAraclar.marka_id = TblMarka.id group by TblMarka.isim


---------------------- 4.Soru ----------------------
-- 4. 100000 km altýndaki düz vites araçlarýn marko, model, km, yýl ve fiyat bilgilerini getiren sorguyu yazýnýz.

select TblMarka.isim, TblModel.model, TblAraclar.km, TblAraclar.yýl, TblAraclar.fiyat from TblAraclar
inner join TblMarka on TblAraclar.marka_id = TblMarka.id
inner join TblModel on TblAraclar.model_id = TblModel.id
inner join TblVites on TblAraclar.vites_id = TblVites.id
where TblAraclar.km < 100000 and TblVites.tur='DÜZ'


---------------------- 5.Soru ----------------------
-- 5. Markalara göre A'dan Z'ye ve fiyata göre pahalýdan ucuza doðru araçlarý listeleyen sorguyu yazýnýz. 

Select TblMarka.isim, TblModel.model, TblAracSahibi.isim, TblAracSahibi.soyisim, TblAracSahibi.ceptel, TblVites.tur, TblAraclar.yýl, TblAraclar.km, TblAraclar.fiyat, TblAraclar.ilan_tarihi from TblAraclar
inner join TblMarka on TblAraclar.marka_id = TblMarka.id
inner join TblModel on TblAraclar.model_id = TblModel.id
inner join TblAracSahibi on TblAraclar.sahip_id = TblAracSahibi.id
inner join TblVites on TblAraclar.vites_id = TblVites.id
order by TblMarka.isim asc, TblAraclar.fiyat desc


---------------------- 6.Soru ----------------------
-- 6. Düz vites ve otomatik araçlarýn ortalama fiyatlarýný getiren sorguyu yazýnýz.

select TblVites.tur, avg(TblAraclar.fiyat) as ortalama_fiyat from TblAraclar 
inner join TblVites on TblAraclar.vites_id = TblVites.id where TblVites.tur = 'Düz' or TblVites.tur = 'Otomatik'
group by TblVites.tur


---------------------- 7.Soru ----------------------
--7. Araç sahiplerinin ad, soyad ve cep telefonu ile birlikte sahip olduklarý araçlarýn piyasa deðerine göre çoktan aza doðru listeleyen kodu yazýnýz.

select TblAracSahibi.isim, TblAracSahibi.soyisim, TblAracSahibi.ceptel,TblMarka.isim, TblModel.model, TblAraclar.fiyat from TblAraclar
inner join TblMarka on TblAraclar.marka_id = TblMarka.id
inner join TblModel on TblAraclar.model_id = TblModel.id
inner join TblAracSahibi on TblAraclar.sahip_id = TblAracSahibi.id
order by TblAraclar.fiyat desc