--1.afiseaza numele, prenumele, adresa si telefonul cititorului cu id-ul respectiv
SELECT Nume, Prenume, Adresa, Telefon FROM Cititori WHERE id_cititor=121;


--2.afiseaza ID-ul bibliotecii din Caracal		   
SELECT id_biblioteca FROM Biblioteca WHERE locatie='Caracal';


--3.afiseaza in ordine crescatoare autorii cu numele diferit
SELECT DISTINCT Nume FROM Autori ORDER BY Nume ASC;

--4.aliem(alaturam) editurile cu cartile asociate acestora, pentru ca fiecare carte apartine unei edituri
SELECT * FROM Edituri JOIN Carti ON Edituri.id_editura=Carti.id_editura;


--5.afiseaza angajatii care lucreaza in cadrul bibliotecii
SELECT * FROM Lucreaza NATURAL JOIN Angajati;


--6.afiseaza titlul cartii si numele editurii cu anul aparitiei si id-ul editurii date
SELECT titlul, nume FROM Carti c, Edituri e
WHERE c.anul_aparitiei=2015 and e.id_editura=1795;


--7.afiseaza ISBN-ul cartii si ID-ul autorului pentru datele introduse
SELECT isbn, id_autor FROM Carti c, Autori a
WHERE c.titlul='Sarah' and a.prenume='Irina';


--8.afisam titlul si isbn-ul cartilor care au anul de aparitie = 2017
SELECT Carti.titlul, Carti.isbn FROM Carti WHERE Anul_aparitiei = 2017;

--9.afisam editurile cu cartile asociate acestora in functie de id-ul editurii
SELECT * FROM Edituri INNER JOIN Carti USING (id_editura);


--10.afisam cartile cu categoria asociata acestora in functie de isbn
SELECT * FROM Carti INNER JOIN Apartin USING (isbn);


--11.afiseaza numele si prenumele autorilor in ordine crescatoare in functie de nume
SELECT Autori.nume, Autori.prenume FROM Autori ORDER BY nume;


--12.afiseaza toate titlurile cartilor cu informatii despre id-ul si numele editurii 
SELECT Carti.titlul, Edituri.id_editura, Edituri.nume FROM Carti 
INNER JOIN Edituri ON (Carti.id_editura = Edituri.id_editura); 


--13.afiseaza cnp-ul angajatilor cu informatii despre data imprumutului si restituirii unei carti, cat si id-ul cititorului
SELECT Angajati.cnp_angajat, Imprumuta.data_imprumutului, Imprumuta.data_restituirii, Imprumuta.id_cititor FROM Angajati 
INNER JOIN Imprumuta ON (Angajati.cnp_angajat = Imprumuta.cnp_angajat); 


--14.afiseaza id-ul si numele editurii cu informtii despre titlul cartii si isbn-ul publicarii
SELECT Edituri.id_editura, Edituri.nume, Carti.titlul, Publica.isbn FROM Edituri  
INNER JOIN Publica ON (Edituri.id_editura = Publica.id_editura) 
INNER JOIN Carti ON (Carti.id_editura = Publica.id_editura);


--15.afiseaza tipul categoriei cu informtii despre isbn-ul carei carti ii apartine
SELECT Categorie.tip_categorie, Apartin.isbn FROM Categorie 
INNER JOIN Apartin ON (Categorie.tip_categorie = Apartin.tip_categorie) 
INNER JOIN Carti ON (Carti.isbn = Apartin.isbn);


--16.afisam toate titlurile carilor si id-ul editurii
SELECT Carti.titlul, Edituri.id_editura FROM Carti
FULL OUTER JOIN Edituri on Carti.id_editura = Edituri.id_editura;


--17.afisam titlurile cartilor si anul aparitiei al acestora, cat si id-ul editurii ordonate in functie de isbn-ul cartii
SELECT Carti.titlul, Carti.anul_aparitiei, Edituri.id_editura FROM Carti
FULL OUTER JOIN Edituri ON Carti.id_editura = Edituri.id_editura ORDER BY Carti.isbn;


--18.afiseaza numarul total de angajati
SELECT COUNT(*) FROM angajati;


--19.afiseaza editurile grupandu-le dupa nume
SELECT Nume FROM Edituri GROUP BY Nume;


--20.afiseaza angajatii in ordine in functie de CNP
SELECT cnp_angajat, nume, prenume FROM Angajati ORDER BY cnp_angajat;


--21.afiseaza datele din tabelul cititori in ordine crescatoare in functie de id-ul cititorului
SELECT * FROM public.cititori ORDER BY id_cititor ASC;


--22.afisam suma totala a stocului cu carti din biblioteca grupandu-le dupa id-ul bibliotecii
SELECT id_biblioteca, SUM(stoc) FROM Are GROUP BY id_biblioteca;


--23.afiseaza editurile in ordine crescatoare in functie de adresa grupandu-le dupa adresa si nume
SELECT Adresa, Nume FROM Edituri GROUP BY Adresa, Nume ORDER BY Adresa ASC;


--24.afisam stocul total al fiecarui isbn selectand singurele isbn-uri care au stocul mai mare ca 20
SELECT isbn, SUM(stoc) FROM Are GROUP BY isbn HAVING SUM(stoc) > 20;


--25.afiseaza stocul minim si maxim de carti
SELECT MIN(stoc), MAX(stoc) FROM Are;


--26.afiseaza stocul minim, maxim si mediu
SELECT MIN(stoc), MAX(stoc), AVG(stoc) FROM Are;


--27.afiseaza media stocului 
SELECT AVG(stoc) FROM Are;


--28.afiseaza in ordine autorii cu ID-ul cuprins intre 271 si 292	
SELECT Nume, Prenume FROM Autori WHERE id_autor BETWEEN 271 AND 292 ORDER BY Nume;


--29.afiseaza ISBN-ul si titlul cartilor cu ID-ul editurii mai mare decat cel dat
SELECT isbn, titlul FROM Carti
WHERE id_editura > SOME(SELECT id_editura FROM Carti WHERE id_editura > 1790);


--30.afiseaza cartile care au editura la fel cu cea introdusa de utilizator
SELECT * FROM Carti
WHERE id_editura IN (SELECT id_editura FROM Edituri WHERE Nume LIKE '%Corint%');


--31.afiseaza titlurile cartilor cu anul aparitiei mai mare decat cel al cartii cu ISBN-ul dat
SELECT titlul FROM Carti
WHERE anul_aparitiei > ANY(SELECT anul_aparitiei FROM Carti WHERE isbn=60697809);


--32.afiseaza numele, prenumele si id-ul cititorilor ce au imprumutat carti intre data respectiva 
SELECT nume, prenume, id_cititor FROM Cititori 
WHERE id_cititor IN(
                      SELECT Imprumuta.id_cititor FROM Cititori 
                      INNER JOIN Imprumuta ON Imprumuta.id_cititor=Cititori.id_cititor 
                      WHERE Imprumuta.data_imprumutului BETWEEN '2021-01-10' AND '2021-09-12' ) ORDER BY Cititori.nume;
		
		
					
--33.afiseaza in ordine dupa isbn datele despre carti unde id ul eiturii este mai mare ca 1792					
SELECT * FROM Carti
WHERE titlul IN (SELECT titlul  FROM Carti WHERE id_editura > 1792) ORDER BY isbn;					
				
				
					
--34.afiseaza dupa ordinea cnp-ului numele si prenumele angajatilor care lucreaza in cadrul bibliotecii					
SELECT Nume, Prenume FROM Angajati 
WHERE EXISTS(SELECT * FROM Biblioteca) ORDER BY cnp_angajat;


--35.afiseaza numele si prenumele cititorilor cu adresa mai lunga decat cea a cititorului cu ID-ul dat
SELECT Nume, Prenume FROM Cititori
WHERE adresa > ALL(SELECT adresa FROM Cititori WHERE id_cititor=121);


--36.cream o vedere din tabelul cititori cu date ordonate in functie de id ul cititorului
create view vedere_cititori as
SELECT id_cititor, nume, prenume, telefon FROM Cititori ORDER BY id_cititor;

SELECT * FROM vedere_cititori;


--37.cream o vedere din tabelul carti cu date ordonate in functie de isbn
create view detalii_carte as
SELECT isbn, titlul, anul_aparitiei FROM Carti ORDER BY isbn;

SELECT * FROM detalii_carte;


--38.cream o vedere din tabelul autori cu date ordonate in functie de id ul autorului
create view vedere_autori as
SELECT id_autor, nume, prenume FROM Autori ORDER BY id_autor;

SELECT * FROM vedere_autori;


--39.cream o vedere din tabelul angajati cu date ordonate in functie de cnp ul angalajatului
create view detalii_angajati as
SELECT nume, prenume FROM Angajati ORDER BY cnp_angajat;

SELECT * FROM detalii_angajati;

--40.cream o vedere din tabelul are cu stocurile mai mari decat 15 
create view detalii_stoc as
SELECT stoc FROM Are WHERE stoc>15;

SELECT * FROM detalii_stoc;

$$ LANGUAGE plpgsql;
