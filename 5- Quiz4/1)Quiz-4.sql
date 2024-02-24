use ARAC_SATIS2

select * from TblAraclar -- satýlýk araclar -- bu tablodan sil (satýlan arabayý)
select * from TblAracMusteri -- araclarý almak istiyorlar
select * from TblAracSahibi
select * from TblÝl
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
	insert into TblSatilanAraclar values (@musteri_id, @arac_id, @fiyat)  -- TblSatilanAraclar tablosunda satýlan araç bilgileri ekleniyor
	delete from TblAraclar where arac_id = @arac_id -- TblAraclar tablosundan satýlan araç siliniyor // NO ACTÝON olduðu için bu satýr çalýþtýrýlamýyor.
	insert into TblUrunlerAudit values ( cast(@arac_id as varchar(5))+' id li arac '+cast((year (getdate())) as nvarchar(10))+' tarihinde satýlmýþtýr') -- TblUrunlerAudit tablosunda satýlma iþleminin gerçekleþtiði tarih bilgisi ekleniyor
end



create trigger arac_trigger
on TblSatilanAraclar 
for insert -- TblSatilanAraclar tablosunda eleman ekleme iþlemi gerçekleþtiðinde çalýþýyor
as
begin
	select * from inserted
end


execute araba_satma 5,7,350000.0 -- araba_satma procedure'ü çalýþtýrýyoruz
