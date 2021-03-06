var express = require('express');
var productRepo = require('../repos/productRepo'),
    cartRepo = require('../repos/cartRepo');

var router = express.Router();

router.get('/', (req, res) => {
     var p1 = cartRepo.TongTien(req.session.cart);
    Promise.all([p1]).then(([rows]) => {

        var vm = {
            items: req.session.cart,
            total: rows
        };
        
        res.render('cart/index', vm);
    });
    // res.render('cart/index', vm);
});

router.post('/add', (req, res) => {
    productRepo.single(req.body.proId).then(rows => {
        var item = {
            product: rows[0],
            quantity: +req.body.quantity,
            amount: rows[0].Price * +req.body.quantity
        };
        cartRepo.add(req.session.cart, item);
        res.redirect(req.headers.referer);
    });
});

router.post('/remove', (req, res) => {
    cartRepo.remove(req.session.cart, +req.body.proId);
    res.redirect(req.headers.referer);
});

module.exports = router;