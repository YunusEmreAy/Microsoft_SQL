-- TRIGGER(TETÝKLEYÝCÝ)

-- Veritabanýnda yapmýþ olduðumuz olaylar meydana geldiðinde veya gelmeden önce otomatik olarak çalýþan özel bir strored procedurdur. 

-- Bir alýþveriþ sitesi düþünelim belirli bir fiyat üzerindeki müþteri bilgisini baþka bir tabloya elit müþteri olarak atanmasýný triggers'lar ile saðlayabiliriz.
-- Kullanýcý tarafýndan manuel olarak oluþturulamazlar.

-- Transaction commit

-- Transaction süresince iþlem baþarýlý bir þekilde gerçekleþirse veritabanýnda kalýcý bir þekilde kaydedilir.

-- Rollback

-- Transaction süresince herhangi bir nedenden dolayý bir iþlem baþarýsýz olursa tüm sürecin geri alýnmasýna denir.

-- Trigger'lar commit ve rollback  iþlemlerini kendisi gerçekleþtiremez.

-- Triggerslar ile geçmiþe yönelik loglar alabiliriz. Fakat cascade komutu sanki o veri veritabanýnda hiç yokmuþ gibi silinmektedir.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- ürünler tablosunun içine 7. ürünü ekleyelim. Eklediðimiz gibi eklenen kayýtlarýn ekrana getirilmesini saðlayan bir trigger oluþturacaðým

-- insert iþlemi gerçekleþtirildkten sonra bir trigger oluþturacaðýmý belirttim.
create trigger trg_tblUrunler_forInsert      
on TblUrunler -- TblUrunler tablosu kullanýlacak.
for insert -- insert iþlemi gerçekleþtiðinde kullanýlacak.
as 
begin 
	select * from inserted-- Trigerlarda inserted'ý bir deðiþken olarak kullanacaðýz. Kesinlikle inserted olacak.
	-- inserted olarak kullanacaðýmýz zaman yeni bir ürün eklediðinde bunun tblUrunler tablosunda yaðýlacaðý bir tetikleme olduðunu anlýyor.
	-- Trigger gövdesinde kullanýlan bir tablo, ismi deðiþtirilemezç
end

-- Bu trigger tetiklenmesi için hazýr sadece insert komutunun çalýþmasýný bekliyor.

--insert into TblUrunler values('Makarna',2.75,106,1) -- Eklenen veriyi ekranda gösterdi. Bana 'inserted' olan özelliði bana gösterdi.


--***************************************************************************************

-- Yaptýðýmýz bu iþlemi yeni bir tabloya loglayabiliriz. Öncelikle log iþlemi için yeni bir tablo oluþturacaðým.

create table TblUrunlerAudit(
id int primary key identity(1,1),
AuditData nvarchar(100))

-- Audit denetim, denetlemek demektir.

create trigger trg_TblUrunler_forinsert2
on TblUrunler
for insert 
as 
begin
	Declare @id int
	select @id=ID from inserted -- yeni eklenen elemanýn id'si
	insert into TblUrunlerAudit
	values (cast(@id as nvarchar(5))+'id degerine sahip yeni urun'+cast(getdate() as nvarchar(20))+'tarihinde eklendi')
	-- Metinsel bir ifade için int ve getdata veri türlerinin yazdýrýlmasý için cast fonksiyonu ile bu veri tiplerinin
	-- nvarchar türüne dönüþtürülmesi gerekir.
end

select * from TblUrunlerAudit

insert into TblUrunler values('Zurna Döner',135,109,2)




--------------------------------------------------------------------------------------------------------------------------------------------
























