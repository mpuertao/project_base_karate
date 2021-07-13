function fn() {
    var env = karate.env;
    karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'dev';
    }
    var config = {
        appId: 'my.app.id',
        appSecret: 'my.secret',
        urlBase: 'http://localhost:8080',
        anotherUrlBase: 'https://dev-host.com/v1/'
    };
    if (env == 'qa') {
        config.urlBase = 'http://qa-localhost:8080';
    } else if (env == 'pdn') {
        config.urlBase = 'http://pdn-localhost:8443';
    }
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    karate.configure('ssl', true);
    return config;
}
