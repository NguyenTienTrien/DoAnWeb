var express = require('express'),
    sha256 = require('crypto-js/sha256'),
    moment = require('moment');

var restrict = require('../middle_wares/restrict');
var adminRepo= require('../repos/adminRepo');
var router = express.Router();

router.get('/login',(req,res)=>{
    res.render('admin/login',{layout: false});
});

router.post('/login',(req,res)=>{
	   var user = {
        username: req.body.username,
        password: sha256(req.body.password).toString()
    };
     adminRepo.login(user).then(rows => {
        if (rows.length > 0) {
            req.session.isLogged = true;
          

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
            res.render('admin/login',{layout: false},vm);
        }
    });

});

module.exports = router;