package utils;

import java.util.List;
import java.util.stream.Collectors;

public class ProductUtils {
    // Procesa la lista de títulos, por ejemplo, los convierte a mayúsculas
    public static List<String> processTitles(List<String> titles) {
        return titles.stream()
            .map(String::toUpperCase)
            .collect(Collectors.toList());
    }
}
