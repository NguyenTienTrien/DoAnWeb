var express = require('express'),
    sha256 = require('crypto-js/sha256'),
    moment = require('moment');
var searchRepo= require('../repos/searchRepo');

var router = express.Router();

router.post('/',(req, res)=>{
	 // var valueSearch = req.body.option;
	
	 var Ten = req.body.searchntt;
	
	 // if(valueSearch == 0)
  //   {
  //       searchRepo.TimKiemTheoTen(Ten).then(rows => {
		// 	var vm = {
		// 		products: rows,
  //           	noProducts: rows.length === 0
		// 	};
		// 	res.render('/search/searchSP',vm);
		// });
  //   }
  //   else if(valueSearch == 1)
  //   {
  //       searchRepo.TimKiemTheoLoai(Ten).then(rows => {
		// 	var vm = {
		// 		products: rows,
  //           	noProducts: rows.length === 0
		// 	};
		// 	res.render('/search/searchSP',vm);
		// });
  //   }
  //   else {
  //       searchRepo.TimKiemTheoNXB(Ten).then(rows => {
		// 	var vm = {
		// 		products: rows,
  //           	noProducts: rows.length === 0
		// 	};
		// 	res.render('search/searchSP',vm);
		// });
    // }

  	// res.render('home/index');
  	searchRepo.TimKiemTheoTen(Ten).then(rows => {
			var vm = {
				products: rows,
            	noProducts: rows.length === 0
			};
			res.render('search/searchSP',vm);
		});
	
});


module.exports = router;