package karate.demo1;

import com.intuit.karate.junit5.Karate;

public class DemoUnoRunner {

    @Karate.Test
    Karate demoUno() {
        return Karate.run("demo_uno").relativeTo(getClass());
    }
}
