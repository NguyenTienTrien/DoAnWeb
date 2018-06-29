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

//sản phẩm
exports.sanPham = user => {
	var sql = `select * from products`;
	return db.load(sql);
}

exports.xoaSP = user =>{
	var sql=`delete from products where ProID=${user}`;
	return db.load(sql);
}

exports.sin = user => {
	var sql = `select * from products where ProID=${user}`;
	return db.load(sql);
}

exports.TimKiemTenSP = user => {
	var sql = `select * from products where ProName like '%${user}%'`;
	return db.load(sql);
}

exports.LoadDonHanglan1  =()=> {
    
    var sql = `select orderdetails.ID,products.ProID,products.ProName,orderdetails.Amount ,orderdetails.Quantity,orderdetails.Status,orderdetails.DatePay
    from orderdetails, products 
    where  orderdetails.ProID = products.ProID`;
 
    return db.load(sql);
}

exports.ThayDoiStatus = user => {
    
    var sql = `update orderdetails set Status='Đã giao hàng' where ID='${user}'`;
   
    return db.load(sql);
}

exports.ThayDoiStatus2 = user => {
    
    var sql = `update orderdetails set Status='Chưa giao hàng' where ID='${user}'`;
   
    return db.load(sql);
}

exports.themsanpham = user => {
    
    var sql = `insert into products (ProName,TinyDes,FullDes,Price,CatID,Quantity,NXBID) values('${user.nameSP}','${user.nameTG}',
    			'${user.moTa}','${user.gia}','1','${user.soLuong}','2')`;
   
    return db.load(sql);
}

exports.ChinhSuaSP = user => {
    
    var sql = `update products set ProName='${user.nameSP}',TinyDes='${user.nameTG}',Price=${user.gia},Quantity=${user.soLuong}
    				where ProID=${user.MaSP}`;
   
    return db.load(sql);
}