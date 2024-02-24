use VT_ALISVERIS2

-- id si 1 olan müþterinin alýþveriþ geçmiþi

select TblAlisverisKayit.alisveris_id, TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblAlisverisKayit.urun_fiyat as Eski_Fiyat, TblUrunler.fiyat as Yeni_Fiyat, TblAlisverisKayit.adet, TblMusteriAlisverisTarihi.tarih from (TblAlisverisKayit 
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id
inner join TblUrunKategori on TblUrunKategori.id = TblUrunler.urun_kategori_id
inner join TblMusteriAlisverisTarihi on TblAlisverisKayit.alisveris_id = TblMusteriAlisverisTarihi.id)
where TblMusteriler.id = 1

-- en son yapýlan alýþveriþ bilgilerini getir

select TblAlisverisKayit.alisveris_id, TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblAlisverisKayit.urun_fiyat as Eski_Fiyat, TblUrunler.fiyat as Yeni_Fiyat, TblAlisverisKayit.adet, TblMusteriAlisverisTarihi.tarih from (TblAlisverisKayit 
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id
inner join TblUrunKategori on TblUrunKategori.id = TblUrunler.urun_kategori_id
inner join TblMusteriAlisverisTarihi on TblAlisverisKayit.alisveris_id = TblMusteriAlisverisTarihi.id)
where TblMusteriAlisverisTarihi.id = (select max(id) from TblMusteriAlisverisTarihi)

-- tüm alýþveriþlerin toplam fiyat tutarlýný

select sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) as Toplam_Turar from TblAlisverisKayit

-- Her bir musterniin þu ana kadar yaptýðý alýþveriþlerin toplam fiyat tutarý

select TblAlisverisKayit.musteri_id, sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) as Toplam_Turar from TblAlisverisKayit group by TblAlisverisKayit.musteri_id

-- her musterninin isim, soyisim, aldýðý ürün adý ve fiyat bilgisini sorgula

select TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblAlisverisKayit.urun_fiyat as Eski_Fiyat from (TblAlisverisKayit 
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id)