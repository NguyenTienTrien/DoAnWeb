var db = require('../fn/db');

exports.loadAll = () => {
	var sql = 'select * from NhaXuatBan';
	return db.load(sql);
}