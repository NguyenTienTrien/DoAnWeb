var  user_temp = 'admin';
var pass_temp = '123';
var user_temp2='user';
var pass_temp2='321';

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
			
			
			window.open('admin.html');
			
		
		}
		if(user==user_temp2 && pass==pass_temp2)
		{
			window.open('user.html');
			window.close('index.html');
		}
		else
		{
			alert('Đăng nhập thất bại');

		}
	}