
	 (function() {
	    var po = document.createElement('script');
	    po.type = 'text/javascript'; po.async = true;
	    po.src = 'https://plus.google.com/js/client:plusone.js';
	    var s = document.getElementsByTagName('script')[0];
	    s.parentNode.insertBefore(po, s);
	  });
	
	
	function signUpGoogle()
	{
		var myParams = {
		'clientid' : '750054133790-ch1jripuakpmgt52ehbod1sbm003rrhj.apps.googleusercontent.com', //You need to set client id
		'apiKey' : 'AIzaSyDgSxPnxtKEbA8xImpuBT6gotH1iRsujX8',
		'cookiepolicy' : 'single_host_origin',
		'callback' : 'loginGoogle', //callback function
		'approvalprompt':'force',
		'scopes' : 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.me https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile'
		};
		gapi.auth.signIn(myParams);
	}
	
	
	function loginGoogle(result)
	{
		console.log(result);	
		if(result.access_token){
			console.log('success');
	    	gapi.client.load('plus','v1', function(){ 
	        var request = gapi.client.plus.people.get({'userId' : 'me'});
	        request.execute(function(response) {
	            console.log('ID: ' + response.id);
	            console.log('Display Name: ' + response.displayName);
	            console.log('Image URL: ' + response.image.url);
	            console.log('Profile URL: ' + response.url);
	        });
	    });
		} else if (authResult.error) {
		    console.log('There was an error: ' + authResult.error);
		}
	}
	