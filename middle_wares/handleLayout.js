var categoryRepo = require('../repos/categoryRepo'),
	NXBRepo=require('../repos/NXBRepo');

module.exports = (req, res, next) => {
    categoryRepo.loadAll().then(rows => {
        res.locals.layoutVM = {
            categories: rows,
            suppliers: rows
        }

        
    });
    NXBRepo.loadAll().then(rows =>{
    	res.locals.layoutNXB={
    		NhaXuatBan: rows
    	}
    	next();
    });

}