var  user_temp = 'admin';
var pass_temp = '123';

var inputUsername= document.getElementById('username');
var inputPassword= document.getElementById('password1');



var formLogin=	document.getElementById('form-login');

if(formLogin.attachEvent)
	{
		formLogin.attachEvent('submit', onFormSubmit);
	}
	else
	{
		formLogin.addEventListener('submit', onFormSubmit);
	}

	function onFormSubmit() {
		
		var user=inputUsername.value;
		var pass=inputPassword.value;
		if(user==user_temp && pass==pass_temp)
		{
			alert('Đăng nhập thành công');
		
		}
		else
		{
			alert('Đăng nhập thất bại');

		}
	}