-- TRIGGER(TET�KLEY�C�)

-- Veritaban�nda yapm�� oldu�umuz olaylar meydana geldi�inde veya gelmeden �nce otomatik olarak �al��an �zel bir strored procedurdur. 

-- Bir al��veri� sitesi d���nelim belirli bir fiyat �zerindeki m��teri bilgisini ba�ka bir tabloya elit m��teri olarak atanmas�n� triggers'lar ile sa�layabiliriz.
-- Kullan�c� taraf�ndan manuel olarak olu�turulamazlar.

-- Transaction commit

-- Transaction s�resince i�lem ba�ar�l� bir �ekilde ger�ekle�irse veritaban�nda kal�c� bir �ekilde kaydedilir.

-- Rollback

-- Transaction s�resince herhangi bir nedenden dolay� bir i�lem ba�ar�s�z olursa t�m s�recin geri al�nmas�na denir.

-- Trigger'lar commit ve rollback  i�lemlerini kendisi ger�ekle�tiremez.

-- Triggerslar ile ge�mi�e y�nelik loglar alabiliriz. Fakat cascade komutu sanki o veri veritaban�nda hi� yokmu� gibi silinmektedir.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- �r�nler tablosunun i�ine 7. �r�n� ekleyelim. Ekledi�imiz gibi eklenen kay�tlar�n ekrana getirilmesini sa�layan bir trigger olu�turaca��m

-- insert i�lemi ger�ekle�tirildkten sonra bir trigger olu�turaca��m� belirttim.
create trigger trg_tblUrunler_forInsert      
on TblUrunler -- TblUrunler tablosu kullan�lacak.
for insert -- insert i�lemi ger�ekle�ti�inde kullan�lacak.
as 
begin 
	select * from inserted-- Trigerlarda inserted'� bir de�i�ken olarak kullanaca��z. Kesinlikle inserted olacak.
	-- inserted olarak kullanaca��m�z zaman yeni bir �r�n ekledi�inde bunun tblUrunler tablosunda ya��laca�� bir tetikleme oldu�unu anl�yor.
	-- Trigger g�vdesinde kullan�lan bir tablo, ismi de�i�tirilemez�
end

-- Bu trigger tetiklenmesi i�in haz�r sadece insert komutunun �al��mas�n� bekliyor.

--insert into TblUrunler values('Makarna',2.75,106,1) -- Eklenen veriyi ekranda g�sterdi. Bana 'inserted' olan �zelli�i bana g�sterdi.


--***************************************************************************************

-- Yapt���m�z bu i�lemi yeni bir tabloya loglayabiliriz. �ncelikle log i�lemi i�in yeni bir tablo olu�turaca��m.

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
	select @id=ID from inserted -- yeni eklenen eleman�n id'si
	insert into TblUrunlerAudit
	values (cast(@id as nvarchar(5))+'id degerine sahip yeni urun'+cast(getdate() as nvarchar(20))+'tarihinde eklendi')
	-- Metinsel bir ifade i�in int ve getdata veri t�rlerinin yazd�r�lmas� i�in cast fonksiyonu ile bu veri tiplerinin
	-- nvarchar t�r�ne d�n��t�r�lmesi gerekir.
end

select * from TblUrunlerAudit

insert into TblUrunler values('Zurna D�ner',135,109,2)




--------------------------------------------------------------------------------------------------------------------------------------------
























