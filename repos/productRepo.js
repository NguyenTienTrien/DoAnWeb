var db = require('../fn/db');
var config = require('../config/config');

exports.loadAll = () => {
	var sql = 'select * from products';
	return db.load(sql);
}

exports.loadAllByCat = catId => {
	var sql = `select * from products where CatID = ${catId}`;
	return db.load(sql);
}

exports.loadPageByCat = (catId, offset) => {
	var sql = `select * from products where CatID = ${catId} limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
	return db.load(sql);
}

exports.countByCat = catId => {
	var sql = `select count(*) as total from products where CatID = ${catId}`;
	return db.load(sql);
}

exports.single = id => {
	var sql = `select * from products where ProID = ${id}`;
	return db.load(sql);
}

//lấy loại sản phẩm từ id 1 sản phẩm
exports.CungLoai = id =>
{
	var sql = `
SELECT * FROM qlbh.products
where CatID in ( 
select ab.CatID
from qlbh.products ab
where ProID=${id}	
 ) limit 5`;
    return db.load(sql);
}
//cung nxb
exports.CungNXB = id =>
{
	var sql = `
SELECT * FROM qlbh.products
where NXBID in ( 
select ab.NXBID
from qlbh.products ab
where ProID=${id}	
 ) limit 5`;
    return db.load(sql);
}



exports.loadBanChay=(offset) =>{
	var sql=`select * from qlbh.products order by SoLuongDaBan DESC limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
	return db.load(sql);
}

exports.countBanChay = () => {
	var sql = `select count(*) as total from products`;
	return db.load(sql);
}


exports.loadLuotXem=(offset) =>{
	var sql=`select * from products order by SoLuotXem DESC limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
	return db.load(sql);
}

exports.countLuotXem = () => {
	var sql = `select count(*) as total from products`;
	return db.load(sql);
}


exports.loadPhatHanh=(offset) =>{
	var sql=`select * from products order by DateDangTai DESC limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
	return db.load(sql);
}