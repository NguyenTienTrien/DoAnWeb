var express = require('express'),
    categoryRepo = require('../repos/categoryRepo');

var router = express.Router();

router.get('/', (req, res) => {
    categoryRepo.loadAll().then(rows => {
        var vm = {
            categories: rows
        };
        res.render('home/index', vm);
    });
});

// router.get('/', (req, res) => {
//     res.render('home/index');
// });

// router.get('/about', (req, res) => {
//     res.render('home/about');
// });

module.exports = router;