var express = require('express'),
    categoryRepo = require('../repos/categoryRepo'),
	productRepo	= require('../repos/productRepo'),
	config = require('../config/config');

var router = express.Router();

router.get('/', (req, res) => {

	var page = req.query.page;
    if (!page) page = 1;
    if (page < 1) page = 1;

    var offset = (page - 1) * config.PRODUCTS_PER_PAGE;

     var p1 = productRepo.loadBanChay(offset);
    var p2 = productRepo.countBanChay();
    //
    //
   		var page2 = req.query.page;
	    if (!page2) page2 = 1;
	    if (page2 < 1) page2 = 1;

	    var offset2 = (page2 - 1) * config.PRODUCTS_PER_PAGE;

	     var p12 = productRepo.loadLuotXem(offset2);
	    // var p22 = productRepo.countLuotXem();
    //
    //
        var p13 = productRepo.loadPhatHanh(offset2);
    //
    //

    Promise.all([p1, p2,p12,p13]).then(([rows, count_rows,rows2,rows3]) => {
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
        //
        //
        	var total2 = count_rows[0].total;
	        var nPages2 = total2 / config.PRODUCTS_PER_PAGE;
	        if (total2 % config.PRODUCTS_PER_PAGE > 0)
	            nPages2++;

	        var numbers2 = [];
	        for (i = 1; i <= nPages2; i++) {
	            numbers2.push({
	                value2: i,
	                isCurrentPage2: i === +page
	            });
	        }
        //
        //
        var vm = {
            products: rows,
            noProducts: rows.length === 0,
            page_numbers: numbers,
            //
            products2: rows2,
            noProducts2: rows2.length ===0,
            page_numbers2: numbers2,
            //
            products3: rows3,
            noProducts3: rows3.length ===0
        };
        res.render('home/index', vm);

    // productRepo.loadBanChay().then(rows => {
    //     var vm = {
    //         products: rows,
    //         noProducts: rows.length === 0
    //     };
    //     res.render('home/index', vm);
    });
});

module.exports = router;

//

// router.get('/byCat/:catId', (req, res) => {
//     var catId = req.params.catId;

//     var page = req.query.page;
//     if (!page) page = 1;
//     if (page < 1) page = 1;

//     var offset = (page - 1) * config.PRODUCTS_PER_PAGE;

//     var p1 = productRepo.loadPageByCat(catId, offset);
//     var p2 = productRepo.countByCat(catId);
//     Promise.all([p1, p2]).then(([rows, count_rows]) => {
//         var total = count_rows[0].total;
//         var nPages = total / config.PRODUCTS_PER_PAGE;
//         if (total % config.PRODUCTS_PER_PAGE > 0)
//             nPages++;

//         var numbers = [];
//         for (i = 1; i <= nPages; i++) {
//             numbers.push({
//                 value: i,
//                 isCurrentPage: i === +page
//             });
//         }

//         var vm = {
//             products: rows,
//             noProducts: rows.length === 0,
//             page_numbers: numbers
//         };
//         res.render('product/byCat', vm);
//     });

   
// });

// 
// 
// 
// 
// 
// 
