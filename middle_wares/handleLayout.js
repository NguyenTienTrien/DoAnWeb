var categoryRepo = require('../repos/categoryRepo'),
	NXBRepo=require('../repos/NXBRepo'),
    cartRepo = require('../repos/cartRepo');

module.exports = (req, res, next) => {

     if (req.session.isLogged === undefined) {
        req.session.isLogged = false;
    }

    categoryRepo.loadAll().then(rows => {
        res.locals.layoutVM = {
            categories: rows,
            suppliers: rows,
            isLogged: req.session.isLogged,
            curUser: req.session.curUser,
            cartSummary: cartRepo.getNumberOfItems(req.session.cart)
        }

        
    });
    NXBRepo.loadAll().then(rows =>{
    	res.locals.layoutNXB={
    		NhaXuatBan: rows
    	}
    	next();
    });

}