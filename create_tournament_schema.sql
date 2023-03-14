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

alter table teams
add foreign key (dni_dt) references dt(dni_dt);

alter table dt
add foreign key (id_team) references teams(id_team);

alter table players
add foreign key (id_team) references teams(id_team);

create table matches (
	id_match int not null primary key auto_increment,
    match_date datetime not null,
    id_tournament int not null,
    id_local int not null,
    id_visitor int not null,
    dni_referee int not null,
    goals_local tinyint not null,
    goals_visitor tinyint not null,
    penalties boolean not null,
    res_penalties_local tinyint,
    res_penalties_visitor tinyint,
    foreign key (id_tournament) references tournaments(id_tournament),
    foreign key (id_local) references teams(id_team),
    foreign key (id_visitor) references teams(id_team),
    foreign key (dni_referee) references referees(dni_referee)
);
