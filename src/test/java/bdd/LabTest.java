package bdd;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class LabTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:bdd")
                .outputCucumberJson(false)
                .parallel(5);
        assertEquals(0, results.getFailCount(),
                results.getErrorMessages());
    }

}
