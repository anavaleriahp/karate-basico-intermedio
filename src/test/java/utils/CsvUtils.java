package utils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class CsvUtils {

    private static BufferedReader reader(String resourcePath) {
        InputStream inputStream = Thread.currentThread()
                .getContextClassLoader()
                .getResourceAsStream(resourcePath);

        if (inputStream == null) {
            throw new IllegalArgumentException("No se encontro el archivo: " + resourcePath);
        }

        return new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));
    }

    public static long countRows(String resourcePath, boolean hasHeader) throws Exception {
        try (BufferedReader bufferedReader = reader(resourcePath)) {
            long lines = bufferedReader.lines()
                    .filter(line -> !line.isBlank())
                    .count();
            return hasHeader && lines > 0 ? lines - 1 : lines;
        }
    }

    public static List<String> headers(String resourcePath) throws Exception {
        try (BufferedReader bufferedReader = reader(resourcePath)) {
            String headerLine = bufferedReader.readLine();
            if (headerLine == null) {
                return List.of();
            }
            return Arrays.stream(headerLine.split(","))
                    .map(String::trim)
                    .toList();
        }
    }

    public static boolean hasRequiredHeaders(String resourcePath, List<String> requiredHeaders) throws Exception {
        List<String> actualHeaders = headers(resourcePath);
        return actualHeaders.containsAll(requiredHeaders);
    }

    public static Map<String, String> findFirstByColumn(String resourcePath, String columnName, String expectedValue) throws Exception {
        try (BufferedReader bufferedReader = reader(resourcePath)) {
            String headerLine = bufferedReader.readLine();
            if (headerLine == null) {
                return new LinkedHashMap<>();
            }

            List<String> columns = Arrays.stream(headerLine.split(","))
                    .map(String::trim)
                    .toList();
            int columnIndex = columns.indexOf(columnName);
            if (columnIndex < 0) {
                throw new IllegalArgumentException("No existe la columna: " + columnName);
            }

            String line;
            while ((line = bufferedReader.readLine()) != null) {
                if (line.isBlank()) {
                    continue;
                }

                String[] values = line.split(",", -1);
                if (columnIndex < values.length && expectedValue.equals(values[columnIndex].trim())) {
                    Map<String, String> row = new LinkedHashMap<>();
                    for (int i = 0; i < columns.size(); i++) {
                        row.put(columns.get(i), i < values.length ? values[i].trim() : "");
                    }
                    return row;
                }
            }

            return new LinkedHashMap<>();
        }
    }
}
