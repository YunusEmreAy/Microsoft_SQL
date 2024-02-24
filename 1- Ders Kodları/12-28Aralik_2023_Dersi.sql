-- STORED PROCEDURE


select  * from TblMusteriler where id = 3


-- up --> user PROCEDURE

create procedure up_MusteriGetir as 
Begin 
	select * from TblMusteriler
end


up_MusteriGetir -- 2.yol
execute up_MusteriGetir -- 3.yol
exec up_MusteriGetir -- 4.yol

drop PROCEDURE up_MusteriGetir -- procedure silme iþlemi bu þekilde gerçekleþir

select * from TblMusteriler

create procedure up_MusteriGetir_CinsiyetveYasagore @Cins int,@Yas int
as
Begin 
	select * from TblMusteriler where cinsId = @Cins and yas = @Yas
End


execute up_MusteriGetir_CinsiyetveYasagore 1, 27
exec up_MusteriGetir_CinsiyetveYasagore 1, 27


-- var olan procedure üzerinde deðiþiklik yapmak istediðiðmizde anahtar keilmeyi "create" den "alter" a çevirerek yeniden tanýmlama iþlemi yapmamýz gerekmektedir.

sp_helptext up_MusteriGetir_CinsiyetveYasagore -- tanýmlamýþ olduðunuz procedure'ün kodlarýný getirir

sp_helptext sp_helpdiagrams -- sistem procedure

-------------------------------------------------------------------
drop proc [dbo].[up_MusteriGetir_CinsiyetveYasagore] -- procedur silmek için kullanýlýr.
drop procedure up_MusteriGetir_CinsiyetveYasagore -- procedure silmek için kullanýlýar

----------------------------------------------------------------------------------
alter procedure up_MusteriGetir_CinsiyetveYasagore
@cins int,
@yas int
with encryption -- kaynak kodu gizleme iþlemi için kullanýlýr. "sp_helptext" ile kod gözükmez.
as
begin 
	select * from TblMusteriler where cinsId = @Cins and yas = @Yas
end


sp_helptext up_MusteriGetir_CinsiyetveYasagore -- kaynak kod gözükmüyor

select * from TblMusteriler

create proc up_CinsiyeteGoreCalisanSayisi
@Cins int, -- input parameter
@CalisanSayisi int output
as
begin 
	select @CalisanSayisi = count(*) from TblMusteriler where cinsId = @Cins
end

execute up_CinsiyeteGoreCalisanSayisi -- donus deðerini alabilmek için bir deðiþken kullanmamýz lazým.


Declare @ToplamCalisanSayisi int 
execute up_CinsiyeteGoreCalisanSayisi 1, @ToplamCalisanSayisi output
select @ToplamCalisanSayisi
output -- output degiskeni de fonskiyon çaðrýlýrken belirtilmelidir.





---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Transaction SQL (T-SQL)
-- ORACLE (PL-SQL)

select * from TblUrunler

Declare @sayi int
select @sayi = count(*) from TblUrunler
if @sayi>1 -- birden fazlsa satýr olma durumunda begin / end kullanýlýr
	print '1 den fazla kayýt var, kayýt sayýsý:'+cast(@sayi as varchar(5))
else  -- birden fazlsa satýr olma durumunda begin / end kullanýlýr
	print 'kayýt yok'



Declare @sayi int
select @sayi = count(*) from TblUrunler
while @sayi>=1
begin 
	print @sayi
	set @sayi = @sayi - 1
end


------------------------------------------------------------------------------
if month (getdate()) in (12)
	begin
		print 'Aralik Ayindayiz'
	end
else 
	begin
		print 'Aralik Ayinda Degiliz'
	end




if month (getdate()) = 12
	begin
		print 'Aralik Ayindayiz'
	end
else 
	begin
		print 'Aralik Ayinda Degiliz'
	end

-------------------------------------------------------------------------
Declare @i int = 1
Declare @j int = 1
while @i<=10
	begin
		while @j<=20
			begin
				print 'A'
				set @j = @j + 1
			end
		set @j = 1
		set @i = @i + 1
	end
--------------------------------------------------------------------------
Declare @ay int
set @ay = 1
select case @ay
when 1 then 2+3
when 2 then 'subat'
when 3 then 'mart'
when 4 then 'nisan'
when 5 then 'mayýs'
when 6 then 'haziran'
when 7 then 'temmuz'
when 8 then 'agustos'
when 9 then 'eylul'
when 10 then 'ekim'
when 11 then 'kasim'
when 12 then 'aralik'
else 'cýkmaz ay'
end
-----------------------------------------------------------------------







