use VT_ALISVERIS2

-- id si 1 olan m��terinin al��veri� ge�mi�i

select TblAlisverisKayit.alisveris_id, TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblAlisverisKayit.urun_fiyat as Eski_Fiyat, TblUrunler.fiyat as Yeni_Fiyat, TblAlisverisKayit.adet, TblMusteriAlisverisTarihi.tarih from (TblAlisverisKayit 
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id
inner join TblUrunKategori on TblUrunKategori.id = TblUrunler.urun_kategori_id
inner join TblMusteriAlisverisTarihi on TblAlisverisKayit.alisveris_id = TblMusteriAlisverisTarihi.id)
where TblMusteriler.id = 1

-- en son yap�lan al��veri� bilgilerini getir

select TblAlisverisKayit.alisveris_id, TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblAlisverisKayit.urun_fiyat as Eski_Fiyat, TblUrunler.fiyat as Yeni_Fiyat, TblAlisverisKayit.adet, TblMusteriAlisverisTarihi.tarih from (TblAlisverisKayit 
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id
inner join TblUrunKategori on TblUrunKategori.id = TblUrunler.urun_kategori_id
inner join TblMusteriAlisverisTarihi on TblAlisverisKayit.alisveris_id = TblMusteriAlisverisTarihi.id)
where TblMusteriAlisverisTarihi.id = (select max(id) from TblMusteriAlisverisTarihi)

-- t�m al��veri�lerin toplam fiyat tutarl�n�

select sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) as Toplam_Turar from TblAlisverisKayit

-- Her bir musterniin �u ana kadar yapt��� al��veri�lerin toplam fiyat tutar�

select TblAlisverisKayit.musteri_id, sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) as Toplam_Turar from TblAlisverisKayit group by TblAlisverisKayit.musteri_id

-- her musterninin isim, soyisim, ald��� �r�n ad� ve fiyat bilgisini sorgula

select TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblAlisverisKayit.urun_fiyat as Eski_Fiyat from (TblAlisverisKayit 
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id)