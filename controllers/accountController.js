var express = require('express'),
    sha256 = require('crypto-js/sha256'),
    moment = require('moment');

var restrict = require('../middle_wares/restrict');
var accountRepo = require('../repos/accountRepo');
var cartRepo = require('../repos/cartRepo');
var payRepo=require('../repos/payRepo');
var router = express.Router();

router.get('/register', (req, res) => {
    res.render('account/register');
});

router.post('/register', (req, res) => {
    var dob = moment(req.body.dob, 'D/M/YYYY')
        .format('YYYY-MM-DDTHH:mm');

    var user = {
        username: req.body.username,
        password: sha256(req.body.rawPWD).toString(),
        name: req.body.name,
        email: req.body.email,
        dob: dob,
        permisson: 0
    };

    accountRepo.add(user).then(value => {
        res.render('account/register');
    });
});





router.get('/login', (req, res) => {
    res.render('account/login');
});

router.post('/login', (req, res) => {
    var user = {
        username: req.body.username,
        password: sha256(req.body.rawPWD).toString()
    };

    // accountRepo.login(user).then(rows => {
    //     if (rows.length > 0) {
    //         req.session.isLogged = true;
    //         req.session.curUser = rows[0];
    //         res.redirect('/');
    //     } else {
    //         var vm = {
    //             showError: true,
    //             errorMsg: 'Login failed'
    //         };
    //         res.render('account/login', vm);
    //     }
    // });
    accountRepo.login(user).then(rows => {
        if (rows.length > 0) {
            req.session.isLogged = true;
            req.session.curUser = rows[0];
            req.session.cart = [];

            var url = '/';
            if (req.query.retUrl) {
                url = req.query.retUrl;
            }
            res.redirect(url);
        } else {
            var vm = {
                showError: true,
                errorMsg: 'Login failed'
            };
            res.render('account/login', vm);
        }
    });
});

router.post('/logout', restrict, (req, res) => {
    req.session.isLogged = false;
    req.session.curUser = null;
    req.session.cart = [];

    res.redirect(req.headers.referer);
});

router.get('/profile/:idUser',restrict, (req, res) => {   //router.get('/profile', restrict, (req, res)
    res.render('account/profile');
});
//cập nhật thông tin

router.post('/profile/:idUser', (req, res) => {
    // var Id = req.params.idUser;
    
    // var DuLieu = {
        ID=req.params.idUser;
        // console.log(ID.toString());
        NewTenDN= req.body.loginName;
        // console.log(NewTenDN);

        NewPassword= sha256(req.body.rawPWD).toString();
        NewName= req.body.username;
        // console.log(NewName);

        NewEmail= req.body.Email;
    // };
    var DuLieu = {
        idTK: ID,
        tenDN: NewTenDN,
        hoten: NewName,
        matKhau: NewPassword,
        email: NewEmail
    };

     accountRepo.update(DuLieu).then(value => {
    //  logout

        req.session.isLogged = false;
        req.session.curUser = null;
        req.session.cart = [];

        var url = '/';
            if (req.query.retUrl) {
                url = req.query.retUrl;
            }
            res.redirect(url);
    });
    
});

router.get('/pay/:idUser',restrict, (req, res) => {  
     var p1 = cartRepo.TongTien(req.session.cart);
    Promise.all([p1]).then(([rows]) => {

        var vm = {
            items: req.session.cart,
            total: rows
        };
        
        res.render('account/pay',vm);
    });
    
});

router.post('/pay/:idUser', (req, res) => {
    // var Id = req.params.idUser;
    
    // var DuLieu = {
        var ID=req.params.idUser;
        // console.log(ID.toString());
        DienThoai= req.body.phone;
        DiaChi= req.body.address;

        var user={
            idTK: ID,
            phone: DienThoai,
            address: DiaChi,
        }
        accountRepo.addInfo(user);
        payRepo.add(req.session.cart,ID);
        payRepo.updateQuantity(req.session.cart);
        payRepo.updateSoLuongDaBan(req.session.cart);
        req.session.cart = [];
        res.redirect(req.headers.referer);
        
});

router.get('/LichSuThanhToan/:idUser',restrict, (req, res) => {  
    
   var p1= payRepo.loadAllOder(req.params.idUser);
    Promise.all([p1]).then(([rows]) => {

        var vm = {
            oders: rows
        };     
        res.render('account/LichSuThanhToan',vm);
    });
    // res.render('account/login');
});



module.exports = router;