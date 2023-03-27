create schema tournament_schema;

use tournament_schema;

create table tournament_formats (
	id_format int not null primary key auto_increment,
    format_description varchar(40) not null
);

create table tournaments (
	id_tournament int not null primary key auto_increment,
    tournament_name varchar(40) not null,
    day_from date,
    day_tru date,
    teams_number int not null,
    id_format int not null,
    foreign key (id_format) references tournament_formats(id_format)
);

create table referees (
	dni_referee int not null primary key,
    referee_firstname varchar(20) not null,
    referee_lastname varchar(20) not null
);

create table teams (
	id_team int not null primary key auto_increment,
    team_name varchar (30) not null,
    dni_dt int not null,
    players_count int not null
);

create table dt (
	dni_dt int not null primary key,
    dt_firstname varchar(20) not null,
    dt_lastname varchar(20) not null,
    id_team int not null
);

create table players (
	dni_player int not null primary key,
    player_firstname varchar(20) not null,
    player_lastname varchar(20) not null,
    id_team int not null
);

alter table players
add foreign key (id_team) references teams(id_team);

create table matches (
	id_match int not null primary key auto_increment,
    match_date datetime not null,
    id_tournament int not null,
    id_team int not null,
    dni_referee int not null,
    goals tinyint not null,
    penalties boolean not null,
    res_penalties tinyint,
    foreign key (id_tournament) references tournaments(id_tournament),
    foreign key (id_team) references teams(id_team),
    foreign key (dni_referee) references referees(dni_referee)
);

insert into dt 
values 
(44640738, 'Roberto', 'Gomez', 1),
(32345907, 'Mauro', 'Rodriguez', 2),
(12546737, 'Jorge', 'Rafaele', 3),
(24666746, 'Marcelo', 'Gallardo', 4);

insert into teams (team_name, dni_dt, players_count)
values 
('Rosario Central', 44640738, 28),
('Lanus', 32345907, 20),
('Nueva Chicago', 12546737, 34),
('River Plate', 24666746, 30);

insert into referees 
values
(33837647, 'Pablo', 'Lunatti'),
(42647536, 'David', 'Herrera'),
(12546789, 'Gustavo', 'Lopez'),
(32435443, 'Christian', 'Conti');

insert into players 
values
(23665746, 'Ariel', 'Ortega', 4),
(33263747, 'Christian', 'Pavon', 1),
(23675645, 'Federico', 'Fazzi', 3),
(35879090, 'Jose', 'Paradela', 4),
(23546534, 'Miguel', 'Flores', 2),
(12546534, 'Nestor', 'Pitana', 2),
(32454636, 'Miguel', 'Osorio', 3),
(42635637, 'Juan', 'Sanchez', 1);

insert into tournament_formats (format_description)
values 
('Copa con eliminacion directa'),
('Copa con grupos'),
('Liga');

insert into tournaments (tournament_name, day_from, day_tru, teams_number, id_format)
values 
('Copa Bridgeston Libertadores 2015', '2015-04-16', '2015-06-20', 32, 2),
('Copa Argentina 2020', '2020-03-03', '2020-08-11', 64, 1),
('Liga Profesional Argentina 2022', '2022-03-10', '2022-11-20', 28, 3),
('Copa Sudamericana 2019', '2019-04-01', '2019-08-12', 32, 2);

insert into matches (match_date, id_tournament, id_team, dni_referee, goals, penalties, res_penalties)
values
('2020-01-22 16:00:00', 1, 2, 12546789, 2, false, null),
('2022-05-21 12:30:00', 3, 3, 33837647, 4, false, null),
('2023-02-23 20:00:00', 4, 1, 42647536, 0, true, 5),
('2018-12-09 21:00:00', 1, 4, 12546789, 3, false, null),
('2012-02-22 09:00:00', 3, 1, 12546789, 5, false, null),
('2017-08-21 21:30:00', 4, 4, 32435443, 1, true, 6);