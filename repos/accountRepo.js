var db = require('../fn/db');

exports.add = user => {
	var sql = `insert into users(f_Username, f_Password, f_Name, f_Email, f_DOB, f_Permission) values('${user.username}', '${user.password}', '${user.name}', '${user.email}', '${user.dob}', ${user.permisson})`;
	return db.save(sql);
}

exports.login = user => {
	var sql = `select * from users where f_Username = '${user.username}' and f_Password = '${user.password}'`;
	return db.load(sql);
}


exports.update = user =>
{
	var sql=`update users set f_Username='${user.tenDN}' , f_Password='${user.matKhau}', f_Email='${user.email}', f_Name='${user.hoten}' where f_ID='${user.idTK}'`;
	return db.load(sql);
}

exports.addInfo = user =>{
	var sql=`update users set f_phone= '${user.phone}',f_address='${user.address}' where f_ID='${user.idTK}'`;
	return db.load(sql);
}