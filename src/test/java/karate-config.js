function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env); 
  if (!env) {
    env = 'qa';
  }
  
  var config = {
    baseUrl: "https://demo-divoc.egov.org.in",
    grantType: "client_credentials" ,
    clientId: "admin-api" ,
     clientSecret:"7ac88c2b-87b4-4e46-be51-24ed36cead77"
     };

  
  karate.configure('connectTimeout', 200000);
  karate.configure('readTimeout', 200000);
  return config;
}
