package bdd.Runner;

import com.intuit.karate.junit5.Karate;



public class RunnerTest {

    @Karate.Test
    Karate testSystemProperty() {
        return Karate.run("classpath:bdd/Features")
                .tags("@ActualizarMascota")
                .karateEnv("cert");
    }
}