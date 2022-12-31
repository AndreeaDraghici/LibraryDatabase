DELETE FROM Carti 
WHERE Anul_aparitiei = 2016 and Titlul = 'Sarah'

UPDATE Carti
SET Anul_aparitiei = 2019 where Titlul = 'Psihologie'


DELETE FROM Angajati
WHERE nume = 'Dragomir' and prenume= 'Maria'

UPDATE Angajati
SET nume = 'Olteanu' where cnp_angajat = 97860679 RETURNING *;


DELETE FROM Cititori
WHERE ID_Cititor = 135 and Telefon = 0735315415

UPDATE Cititori
SET Telefon = 0735000015 where ID_Cititor = 121 RETURNING *;


DELETE FROM Categorie
WHERE tip_categorie = 'Tehnologie'

UPDATE Carti
SET Titlul = 'De vorba cu EMMA' where ISBN = 60697805 RETURNING *;


SELECT * FROM Carti WHERE Anul_aparitiei=2019 and Titlul='Psihologie';
SELECT * FROM Cititori;
SELECT * FROM Angajati;
