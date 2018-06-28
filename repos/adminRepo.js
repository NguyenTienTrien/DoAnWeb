var db = require('../fn/db');


exports.login = user => {
	var sql = `select * from admin where f_Username = '${user.username}' and f_Password = '${user.password}'`;
	return db.load(sql);
	
}
//nhà xuất bản
exports.NXB = user => {
	var sql = `select * from NhaXuatBan`;
	return db.load(sql);
	
}

exports.themNXB = user =>{
	var sql=`insert into NhaXuatBan (NXBName) values ('${user}')`;
	return db.load(sql);
}

exports.suaNXB = user =>{
	var sql=`update NhaXuatBan set NXBName = '${user.nxbmoi}' where NXBName='${user.nxbcu}'`;
	return db.load(sql);
}

exports.xoaNXB = user =>{
	var sql=`delete from NhaXuatBan where NXBID=${user}`;
	return db.load(sql);
}
//loại sách
exports.loaiSach = user => {
	var sql = `select * from categories`;
	return db.load(sql);
}

exports.themLoai = user =>{
	var sql=`insert into categories (CatName) values ('${user}')`;
	return db.load(sql);
}
exports.suaLoai = user =>{
	var sql=`update categories set CatName = '${user.nxbmoi}' where CatName='${user.nxbcu}'`;
	return db.load(sql);
}

exports.xoaLoai = user =>{
	var sql=`delete from categories where CatID=${user}`;
	return db.load(sql);
}