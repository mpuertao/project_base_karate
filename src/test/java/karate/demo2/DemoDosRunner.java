package karate.demo2;

import com.intuit.karate.junit5.Karate;

public class DemoDosRunner {

    @Karate.Test
    Karate demoDos() {
        return Karate.run("demo_dos").relativeTo(getClass());
    }
}
