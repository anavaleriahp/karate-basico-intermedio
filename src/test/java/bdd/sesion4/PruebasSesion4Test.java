package bdd.sesion4;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.core.MockServer;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class PruebasSesion4Test {

    @Test
    void ejecutarEjerciciosSesion4() {
        MockServer servidor = MockServer
                .feature("classpath:simuladores/sesion4/mock-api-productos.feature")
                .http(0)
                .build();

        try {
            String etiquetaSeleccionada = Boolean.getBoolean("sesion4.ejecutar.base-datos")
                    ? "@sesion4"
                    : "@ejercicio2";

            Results resultados = Runner.path("classpath:bdd/sesion4")
                    .tags(etiquetaSeleccionada)
                    .systemProperty("sesion4.urlBase", "http://localhost:" + servidor.getPort())
                    .outputCucumberJson(true)
                    .parallel(1);

            assertEquals(0, resultados.getFailCount(), resultados.getErrorMessages());
        } finally {
            servidor.stop().join();
        }
    }
}
