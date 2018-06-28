var express = require('express');
var exphbs = require('express-handlebars');
var exphbs_section = require('express-handlebars-sections');
var bodyParser = require('body-parser');
var path = require('path');
var wnumb = require('wnumb');
var session = require('express-session');

var handleLayoutMDW = require('./middle_wares/handleLayout');
var handle404MDW = require('./middle_wares/handle404');
var restrict = require('./middle_wares/restrict');


// var categoryController = require('./controllers/categoryController');
var productController = require('./controllers/productController');
var homeController = require('./controllers/homeController');
var accountController = require('./controllers/accountController');
var cartController = require('./controllers/cartController');
var searchController= require('./controllers/searchController');


var app = express();

    app.engine('hbs', exphbs({
        defaultLayout: 'main',
        layoutsDir: 'views/_layouts/',
        helpers: {
            section: exphbs_section(),
            number_format: n => {
                var nf = wnumb({
                    thousand: ','
                });
                return nf.to(n);
            }
        }
    }));
app.set('view engine', 'hbs');

app.use(express.static(
    path.resolve(__dirname, 'public')
));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true,
    // cookie: {
    //     secure: true
    // }
}));


app.use(handleLayoutMDW);

app.get('/', (req, res) => {
    res.redirect('/home');
});

app.use('/home', homeController);
// app.use('/category', categoryController);
app.use('/product', productController);
app.use('/account', accountController);
app.use('/cart', restrict, cartController);
app.use('/abcd',searchController);



app.use(handle404MDW);

app.listen(4000, () => {
    console.log('server running on port 4000');
});