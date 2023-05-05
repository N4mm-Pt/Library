create database qlthuvienvui
use qlthuvienvui
go
create table LoaiSach(
	MaLS Varchar(50) not null primary key,
	TenLS Nvarchar(100),
	MaNhom varchar(20),
	foreign key (MaNhom) references NhomTheLoai(MaNhom)
	ON Delete Cascade
)
go
create table NhomTheLoai(
	MaNhom varchar(20) not null primary key,
	TenNhom nvarchar(100)
)
go
create table Sach(
	MaSach varchar(20) not null primary key,
	TenSach Nvarchar(100),
	He Nvarchar(20),
	Soluong int,
	Giatien int,
	MaTG varchar(20),
	MaNXB varchar(20),
	MaLS varchar(50),
	foreign key (MaLS) references LoaiSach(MaLS) 
	ON Delete Cascade,
	foreign key (MaTG) references TacGia(MaTG) 
	ON Delete Cascade,
	foreign key (MaNXB) references NhaXB(MaNXB) 
	ON Delete Cascade
)
go
create table TacGia(
	MaTG varchar(20) not null primary key,
	TenTG nvarchar(100)
)
go
create table NhaXB(
	MaNXB varchar(20) not null primary key,
	TenNXB nvarchar(100),
	NoiXB nvarchar(100),
	NamXB int
)
go
create table SoDKCB(
	MasoSoDK int not null primary key,
	STT int IDENTITY(1,1),
	NgayVaoSo datetime,
	SovaosoTQ int,
	NgayVaoSoBBX datetime,
	MaSach varchar(20),
	NamKK int,
	foreign key (MaSach) references Sach(MaSach)
	ON Delete Cascade
)
go

select sum(Sach.Soluong) from Sach, LoaiSach, NhomTheLoai where LoaiSach.MaNhom = '"+cb_nhomtheloai.Text+"' and Sach.MaLS = LoaiSach.MaLS and LoaiSach.MaNhom = NhomTheLoai.MaNhom
select sum(Sach.Soluong) from Sach, LoaiSach where Sach.MaLS = LoaiSach.MaLS and LoaiSach.MaLS = '"+cb_theloai.Text+"'