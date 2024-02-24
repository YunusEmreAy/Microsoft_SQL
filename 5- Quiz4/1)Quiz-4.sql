use ARAC_SATIS2

select * from TblAraclar -- sat�l�k araclar -- bu tablodan sil (sat�lan arabay�)
select * from TblAracMusteri -- araclar� almak istiyorlar
select * from TblAracSahibi
select * from Tbl�l
select * from TblMarka
select * from TblModel
select * from TblSatilanAraclar 
select * from TblUrunlerAudit
select * from TblVites



create procedure araba_satma
@musteri_id int,
@arac_id int,
@fiyat float 
as
begin
	insert into TblSatilanAraclar values (@musteri_id, @arac_id, @fiyat)  -- TblSatilanAraclar tablosunda sat�lan ara� bilgileri ekleniyor
	delete from TblAraclar where arac_id = @arac_id -- TblAraclar tablosundan sat�lan ara� siliniyor // NO ACT�ON oldu�u i�in bu sat�r �al��t�r�lam�yor.
	insert into TblUrunlerAudit values ( cast(@arac_id as varchar(5))+' id li arac '+cast((year (getdate())) as nvarchar(10))+' tarihinde sat�lm��t�r') -- TblUrunlerAudit tablosunda sat�lma i�leminin ger�ekle�ti�i tarih bilgisi ekleniyor
end



create trigger arac_trigger
on TblSatilanAraclar 
for insert -- TblSatilanAraclar tablosunda eleman ekleme i�lemi ger�ekle�ti�inde �al���yor
as
begin
	select * from inserted
end


execute araba_satma 5,7,350000.0 -- araba_satma procedure'� �al��t�r�yoruz
