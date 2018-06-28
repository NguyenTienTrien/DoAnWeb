var db = require('../fn/db');

exports.TimKiemTheoTen = user => {
	var sql = `select * from products where ProName like '%${user}%'`;
	return db.load(sql);
}

// exports.TimKiemTheoLoai = user => {
// 	var sql = `select * from qlbh.products
// where CatID = (
// select ab.CatID
// from qlbh.categories ab
// where ab.CatName like '${user}'
// )`;
// 	return db.load(sql);
// }

// exports.TimKiemTheoNXB = user => {
// 	var sql = `select * from qlbh.products
// where NXBID = (
// select ab.NXBID
// from qlbh.nhaxuatban ab
// where ab.NXBName='${user}'
// )`;
// 	return db.load(sql);
// }