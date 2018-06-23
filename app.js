var express = require('express');
var exphbs = require('express-handlebars');
var exphbs_section = require('express-handlebars-sections');
var bodyParser = require('body-parser');
var path = require('path');
var wnumb = require('wnumb');

// var handleLayoutMDW = require('./middle-wares/handleLayout');
// var handle404MDW = require('./middle-wares/handle404');

// var categoryController = require('./controllers/categoryController');
// var productController = require('./controllers/productController');
var homeController = require('./controllers/homeController');

var app = express();

    app.engine('hbs', exphbs({
        defaultLayout: 'main',
        layoutsDir: 'views/_layouts/',
        helpers: {
            section: exphbs_section()//,
            // number_format: n => {
            //     var nf = wnumb({
            //         thousand: ','
            //     });
            //     return nf.to(n);
            // }
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

// app.use(handleLayoutMDW);

app.get('/', (req, res) => {
    res.redirect('/home');
});

app.use('/home', homeController);
// app.use('/category', categoryController);
// app.use('/product', productController);

// app.use(handle404MDW);

app.listen(4000, () => {
    console.log('server running on port 4000');
});