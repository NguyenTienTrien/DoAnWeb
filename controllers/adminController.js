var express = require('express'),
    sha256 = require('crypto-js/sha256'),
    moment = require('moment');

var restrict = require('../middle_wares/restrict');
var adminRepo= require('../repos/adminRepo');
var router = express.Router();

router.get('/',(req,res)=>{
    res.render('admin/loginAdmin',{layout: false});
});
router.get('/login',(req,res)=>{
    res.render('admin/loginAdmin',{layout: false});
});
router.get('/dashboard', (req,res)=>{
    res.render('admin/admin',{layout: false});
})

router.post('/login',(req,res)=>{
    var user = {
        username: req.body.username,
        password: (req.body.password).toString()
    };

    adminRepo.login(user).then(rows => {
        if (rows.length > 0) {
            res.redirect('/admin/dashboard');

        } else {
            var vm = {
                showError: true,
                errorMsg: 'Login failed',
                layout:false,
            };
            res.render('admin/loginadmin', vm);
        }
    });
})

//nhà xuất bản
router.get('/nhaXB',(req,res)=>{
    var p1=adminRepo.NXB();
    // res.render('admin/nhaXB',{layout: false});


    Promise.all([p1]).then(([rows]) => {

        var vm = {
            nxb: rows,
            layout: false
        };     
        res.render('admin/nhaXB',vm);
    });
});

router.post('/themNXB',(req,res)=>{
    var name=req.body.themNXB;
    var p1=adminRepo.themNXB(name);
    // res.render('admin/nhaXB',{layout: false});
            res.redirect('/admin/nhaXB');
    
});

router.post('/suaNXB',(req,res)=>{
    var nameL=req.body.NXBcu;
    var nameN=req.body.NXBmoi
    var vm={
        nxbcu: nameL,
        nxbmoi: nameN,
        layout: false
    }
    var p1=adminRepo.suaNXB(vm);
    // res.render('admin/nhaXB',{layout: false});
            res.redirect('/admin/nhaXB');
    
});

router.post('/xoaNXB/:id',(req,res)=>{
     var  idNXB=req.params.id;
    var p1=adminRepo.xoaNXB(idNXB);
    // res.render('admin/nhaXB',{layout: false});
            res.redirect('/admin/nhaXB');
    
});
//loại sách
router.get('/loaiSach',(req,res)=>{
    var p1=adminRepo.loaiSach();
    // res.render('admin/nhaXB',{layout: false});


    Promise.all([p1]).then(([rows]) => {

        var vm = {
            sach: rows,
            layout: false
        };     
        res.render('admin/LoaiSach',vm);
    });
});

router.post('/themLoai',(req,res)=>{
    var name=req.body.themNXB;
    var p1=adminRepo.themLoai(name);
    // res.render('admin/nhaXB',{layout: false});
            res.redirect('/admin/LoaiSach');
    
});

router.post('/suaLoai',(req,res)=>{
    var nameL=req.body.NXBcu;
    var nameN=req.body.NXBmoi
    var vm={
        nxbcu: nameL,
        nxbmoi: nameN,
        layout: false
    }
    var p1=adminRepo.suaLoai(vm);
    // res.render('admin/nhaXB',{layout: false});
            res.redirect('/admin/LoaiSach');
    
});

router.post('/xoaLoai/:id',(req,res)=>{
     var  idNXB=req.params.id;
    var p1=adminRepo.xoaLoai(idNXB);
    // res.render('admin/nhaXB',{layout: false});
            res.redirect('/admin/LoaiSach');
    
});

module.exports = router;