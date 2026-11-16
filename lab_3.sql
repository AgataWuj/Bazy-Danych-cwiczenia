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
    

CREATE TABLE sprint(
	id_sprintu INT PRIMARY KEY auto_increment,
    liczba_sprintu int unsigned,
    data_rozpoczecia date,
    data_zakończenia date);
    
    
Alter Table zadania DROP FOREIGN KEY zadania_ibfk_1;

select * from zadania;

alter table zadania drop column id_pracownika;

alter table projekt drop foreign key projekt_ibfk_1;

alter table projekt drop column menadzer_projektu;

alter table pracownik modify id_pracownika int not null;

alter table pracownik drop primary key;

select * from pracownik;

alter table pracownik drop column id_pracownika;

alter table pracownik add column id_pracownika int primary key auto_increment;

alter table zadania add column id_pracownika int;

alter table zadania add foreign key (id_pracownika) references pracownik(id_pracownika)on delete set null;

alter table projekt add column menadzer_projektu int;

alter table projekt add foreign key (menadzer_projektu) references pracownik(id_pracownika) on delete cascade;

alter table zadania add column godziny_szacowane integer default '8';

update zadania set godziny_szacowane = 4 where id_zadania = 1;
update zadania set godziny_szacowane = 12 where id_zadania = 2;
update zadania set godziny_szacowane = 16 where id_zadania = 3;

alter table zadania modify godziny_szacowane integer default '6';

insert into zadania(nazwa_zadania, id_pracownika) values ('mega_zadanie',2);

alter table projekt add column opis_kratki varchar(50);

alter table projekt modify opis_kratki varchar(200);

update projekt set opis_kratki = 'MVP' where id_projektu = 1;
update projekt set opis_kratki = 'Pilne wdrozenie' where id_projektu = 2;
update projekt set opis_kratki = 'wow' where id_projektu = 3;

alter table projekt drop column opis_kratki;

select * from zadania;

alter table zadania add foreign key (projekt) references projekt(id_projektu) on delete set null;

update zadania set projekt = 1 where id_zadania = 1;
update zadania set projekt = 2 where id_zadania = 2;
update zadania set projekt = 2 where id_zadania = 3;
update zadania set projekt = 1 where id_zadania = 4;

delete from projekt where id_projektu = 2;

select * from zadania;
















