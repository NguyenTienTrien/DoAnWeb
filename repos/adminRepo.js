var db = require('../fn/db');


exports.login = user => {
	var sql = `select * from admin where f_Username = '${user.username}' and f_Password = '${user.password}'`;
	return db.load(sql);
	
}