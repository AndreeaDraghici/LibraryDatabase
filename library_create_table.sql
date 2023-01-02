CREATE TABLE  Biblioteca (
    	ID_Biblioteca INT PRIMARY KEY,
	    Nume varchar(100) not null,
    	Locatie varchar(100) not null
); 


CREATE TABLE  Angajati (
    	CNP_Angajat INT PRIMARY KEY,
	    Nume varchar(100) not null,
    	Prenume varchar(100) not null
); 


CREATE TABLE  Autori (
    	ID_Autor INT PRIMARY KEY,
	    Nume varchar(100) not null,
    	Prenume varchar(100) not null
); 


CREATE TABLE  Edituri (
    	ID_Editura INT PRIMARY KEY,
	    Nume varchar(100) not null,
    	Adresa varchar(100) not null
);


CREATE TABLE  Cititori (
    	ID_Cititor INT PRIMARY KEY,
	    Nume varchar(100) not null,
	    Prenume varchar(100) not null,
    	Adresa varchar(100) not null,
	    Telefon INT not null
); 


CREATE TABLE  Categorie (
        Tip_categorie varchar(100) PRIMARY KEY
); 


CREATE TABLE  Carti (
    	ISBN INT PRIMARY KEY,
	    CNP_Angajat INT not null,
		ID_Editura INT not null,
		Titlul varchar(100) not null,
		Anul_aparitiei INT not null,
		foreign key(CNP_Angajat) references Angajati(CNP_Angajat) on delete cascade on update
cascade,
		foreign key(ID_Editura) references Edituri(ID_Editura) on delete cascade on update
cascade
); 


CREATE TABLE  Are (
		ID_Biblioteca INT not null,
		ISBN INT not null,
		Stoc INT not null,
		foreign key(ID_Biblioteca) references Biblioteca(ID_Biblioteca) on delete cascade on update
cascade,
		foreign key(ISBN) references Carti(ISBN) on delete cascade on update
cascade
); 


CREATE TABLE  Lucreaza (
		ID_Biblioteca INT not null,
		CNP_Angajat INT not null,
		foreign key(ID_Biblioteca) references Biblioteca(ID_Biblioteca) on delete cascade on update
cascade,
		foreign key(CNP_Angajat) references Angajati(CNP_Angajat) on delete cascade on update
cascade
); 


CREATE TABLE  Scrise (
		ISBN INT not null,
		ID_Autor INT not null,
		foreign key(ISBN) references Carti(ISBN) on delete cascade on update
cascade,
		foreign key(ID_Autor) references Autori(ID_Autor) on delete cascade on update
cascade
); 


CREATE TABLE  Imprumuta (
		ISBN INT not null,
		ID_Cititor INT not null,
		CNP_Angajat INT not null,
		Data_imprumutului date not null,
		Data_restituirii date not null,
		foreign key(ISBN) references Carti(ISBN) on delete cascade on update
cascade,
		foreign key(ID_Cititor) references Cititori(ID_Cititor) on delete cascade on update
cascade,
		foreign key(CNP_Angajat) references Angajati(CNP_Angajat) on delete cascade on update
cascade
); 


CREATE TABLE  Apartin (
		ISBN INT not null,
		Tip_categorie varchar(20) not null,
		foreign key(ISBN) references Carti(ISBN) on delete cascade on update
cascade,
		foreign key(Tip_categorie) references Categorie(Tip_categorie) on delete cascade on update
cascade
); 


CREATE TABLE  Publica (
		ISBN INT not null,
		ID_Editura INT not null,
		foreign key(ISBN) references Carti(ISBN) on delete cascade on update
cascade,
		foreign key(ID_Editura) references Edituri(ID_Editura) on delete cascade on update
cascade
);
$$ LANGUAGE plpgsql;
