function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env); 
  if (!env) {
    env = 'qa';
  }
  
  var config = {
    baseUrl: "https://divoc.egov.org.in",
    grantType: "#################" ,
    clientId: "#########" ,
     clientSecret:"################"
     };

  
  karate.configure('connectTimeout', 200000);
  karate.configure('readTimeout', 200000);
  return config;
}
