module.exports = (req, res, next) => {
    if (req.session.isLogged === false) {
        res.redirect('/account/login');
    } else {
        next();
    }
}