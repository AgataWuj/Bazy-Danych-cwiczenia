CREATE TABLE pracownik(
	id_pracownika INT PRIMARY KEY auto_increment,
    imie varchar(40) not null,
    nazwisko varchar(50) not null,
    data_urodzenia date not null);

CREATE TABLE zadania(
	id_zadania INT PRIMARY KEY auto_increment,
    nazwa_zadania varchar(150) not null,
    priorytet ENUM ('normalny','wysoki','niski') default 'normalny',
    opis TEXT,
    id_pracownika INT,
    foreign key(id_pracownika) references pracownik(id_pracownika));

CREATE TABLE projekt(
	id_projektu INT PRIMARY KEY auto_increment,
    nazwa_projektu varchar(150) not null,
    data_rozpoczecia date not null,
    data_zakończenia date);
    

SELECT * FROM projekt;

