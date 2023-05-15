use learning
go

create table stores
(
	store_id int not null,
	city varchar (50)
);

select * from stores

insert into stores ( store_id , city ) values (1, 'delhi')