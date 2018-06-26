var express = require('express'),
    productRepo = require('../repos/productRepo'),
    config = require('../config/config');

var router = express.Router();



router.get('/byCat/:catId', (req, res) => {
    var catId = req.params.catId;

    var page = req.query.page;
    if (!page) page = 1;
    if (page < 1) page = 1;

    var offset = (page - 1) * config.PRODUCTS_PER_PAGE;

    var p1 = productRepo.loadPageByCat(catId, offset);
    var p2 = productRepo.countByCat(catId);
    Promise.all([p1, p2]).then(([rows, count_rows]) => {
        var total = count_rows[0].total;
        var nPages = total / config.PRODUCTS_PER_PAGE;
        if (total % config.PRODUCTS_PER_PAGE > 0)
            nPages++;

        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurrentPage: i === +page
            });
        }

        var vm = {
            products: rows,
            noProducts: rows.length === 0,
            page_numbers: numbers
        };
        res.render('product/byCat', vm);
    });

   
});

router.get('/detail/:proId', (req, res) => {
    var proId = req.params.proId;
    // productRepo.single(proId).then(rows => {
    //     if (rows.length > 0) {
    //         var vm = {
    //             product: rows[0]
    //         };
    //         res.render('product/detail', vm);
    //     } else {
    //         res.end('NO PRODUCT');
    //     }
    // });
    var p1=productRepo.single(proId);
    var p2=productRepo.CungLoai(proId);
    var p3=productRepo.CungNXB(proId);
     Promise.all([p1, p2,p3]).then(([rows, rows2,rows3]) => {
        var vm = {
            product: rows[0],
            CungLoaiSP: rows2,
            noCungLoaiSP:  rows2.length === 0,
            CungNXB: rows3,
            noCungNXB: rows3.length ===0
        }
         res.render('product/detail', vm);
     });
});



router.get('/BanChay', (req, res) => {

    var page = req.query.page;
    if (!page) page = 1;
    if (page < 1) page = 1;

    var offset = (page - 1) * config.PRODUCTS_PER_PAGE;

     var p1 = productRepo.loadBanChay(offset);
    var p2 = productRepo.countBanChay();
    

    Promise.all([p1, p2]).then(([rows, count_rows]) => {
        var total = count_rows[0].total;
        var nPages = total / config.PRODUCTS_PER_PAGE;
        if (total % config.PRODUCTS_PER_PAGE > 0)
            nPages++;

        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurrentPage: i === +page
            });
        }
        
        var vm = {
            products: rows,
            noProducts: rows.length === 0,
            page_numbers: numbers,
            
        };
        res.render('product/BanChay', vm);

    // productRepo.loadBanChay().then(rows => {
    //     var vm = {
    //         products: rows,
    //         noProducts: rows.length === 0
    //     };
    //     res.render('home/index', vm);
    });
});

router.get('/XemNhieu', (req, res) => {

    var page = req.query.page;
    if (!page) page = 1;
    if (page < 1) page = 1;

    var offset = (page - 1) * config.PRODUCTS_PER_PAGE;

     var p1 = productRepo.loadLuotXem(offset);
    var p2 = productRepo.countLuotXem();
    

    Promise.all([p1, p2]).then(([rows, count_rows]) => {
        var total = count_rows[0].total;
        var nPages = total / config.PRODUCTS_PER_PAGE;
        if (total % config.PRODUCTS_PER_PAGE > 0)
            nPages++;

        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurrentPage: i === +page
            });
        }
        
        var vm = {
            products: rows,
            noProducts: rows.length === 0,
            page_numbers: numbers,
            
        };
        res.render('product/XemNhieu', vm);

    // productRepo.loadBanChay().then(rows => {
    //     var vm = {
    //         products: rows,
    //         noProducts: rows.length === 0
    //     };
    //     res.render('home/index', vm);
    });
});

router.get('/MoiPhatHanh', (req, res) => {

    var page = req.query.page;
    if (!page) page = 1;
    if (page < 1) page = 1;

    var offset = (page - 1) * config.PRODUCTS_PER_PAGE;

     var p1 = productRepo.loadPhatHanh(offset);
    var p2 = productRepo.countLuotXem();
    

    Promise.all([p1, p2]).then(([rows, count_rows]) => {
        var total = count_rows[0].total;
        var nPages = total / config.PRODUCTS_PER_PAGE;
        if (total % config.PRODUCTS_PER_PAGE > 0)
            nPages++;

        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurrentPage: i === +page
            });
        }
        
        var vm = {
            products: rows,
            noProducts: rows.length === 0,
            page_numbers: numbers,
            
        };
        res.render('product/MoiPhatHanh', vm);

    // productRepo.loadBanChay().then(rows => {
    //     var vm = {
    //         products: rows,
    //         noProducts: rows.length === 0
    //     };
    //     res.render('home/index', vm);
    });
});

module.exports = router;