function fn() {
    var env = karate.env; // get java system property 'karate.env'
    karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'dev'; // a custom 'intelligent' default, per default is DEV
    }
    var config = { // base config JSON
        appId: 'my.app.id',
        appSecret: 'my.secret',
        // example url, replace per real in DEV o Local
        urlBase: 'http://localhost:8080',
        anotherUrlBase: 'https://dev-host.com/v1/'
    };
    if (env == 'qa') {
        // over-ride only those that need to be
        // example url, replace per URL in QA
        config.urlBase = 'http://qa-localhost:8080';
    } else if (env == 'pdn') {
        // example url, replace per URL in PDN for SMOKETEST
        config.urlBase = 'http://pdn-localhost:8443';
    }
    // don't waste time waiting for a connection or if servers don't respond within 5 seconds
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    karate.configure('ssl', true) // For omit certified in services
    return config;
}
