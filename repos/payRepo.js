var db = require('../fn/db');
var config = require('../config/config');

exports.add = (pay, userId) => {
    var s=`insert into orderdetails(Quantity, Price, Amount, ProID,f_ID, DatePay, Status) values`  ;

    for (var i = pay.length - 1; i >= 1; i--) {
        var s1=`('${pay[i].quantity}', '${pay[i].product.Price}', '${pay[i].amount}', '${pay[i].product.ProID}','${userId}', curdate(),'Chưa giao hàng' ),`;
        s=s+s1;
    }

    var s2=`('${pay[0].quantity}', '${pay[0].product.Price}', '${pay[0].amount}', '${pay[0].product.ProID}','${userId}',curdate(),'Chưa giao hàng' );`;
    var sql=s+s2;

    

    return db.load(sql);
}


exports.updateQuantity = (pay)=> {
    var sql=`update products set Quantity=case`;
    for (var i = pay.length - 1; i >= 0; i--){
        var s1=` when ProID=${pay[i].product.ProID} then  Quantity-${pay[i].quantity}`;
        sql=sql+s1;
    }

    var s2=` end where ProID in ( `;
    sql=sql+s2;

    for (var i = pay.length - 1; i >= 1; i--){
        var s3=`${pay[i].product.ProID},`;
        sql=sql+s3;
    }

    var s4=`${pay[i].product.ProID} );`;
    sql=sql+s4;

    return db.load(sql);
}

exports.updateSoLuongDaBan = (pay)=> {
    var sql=`update products set SoLuongDaBan=case`;
    for (var i = pay.length - 1; i >= 0; i--){
        var s1=` when ProID=${pay[i].product.ProID} then  SoLuongDaBan+${pay[i].quantity}`;
        sql=sql+s1;
    }

    var s2=` end where ProID in ( `;
    sql=sql+s2;

    for (var i = pay.length - 1; i >= 1; i--){
        var s3=`${pay[i].product.ProID},`;
        sql=sql+s3;
    }

    var s4=`${pay[i].product.ProID} );`;
    sql=sql+s4;

    return db.load(sql);
}

exports.loadAllOder = (id)=> {
    
    var sql = `select orderdetails.ID,products.ProID,products.ProName,orderdetails.Amount ,orderdetails.Quantity,orderdetails.Status,orderdetails.DatePay
    from orderdetails, products 
    where orderdetails.f_ID = ${id} and orderdetails.ProID=products.ProID`;
    return db.load(sql);
}