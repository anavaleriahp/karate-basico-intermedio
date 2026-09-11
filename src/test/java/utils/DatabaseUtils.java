package utils;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.LinkedHashMap;
import java.util.Map;

public class DatabaseUtils {

    private static final String URL = getConfig("mysql.url", "MYSQL_URL", "jdbc:mysql://localhost:3306/karate_training");
    private static final String USER = getConfig("mysql.user", "MYSQL_USER", "karate_user");
    private static final String PASSWORD = getConfig("mysql.password", "MYSQL_PASSWORD", "karate_pass");

    private static String getConfig(String propertyName, String environmentName, String defaultValue) {
        String propertyValue = System.getProperty(propertyName);
        if (propertyValue != null && !propertyValue.isBlank()) {
            return propertyValue;
        }

        String environmentValue = System.getenv(environmentName);
        if (environmentValue != null && !environmentValue.isBlank()) {
            return environmentValue;
        }

        return defaultValue;
    }

    public static Map<String, Object> querySingle(String sql) throws Exception {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            if (!resultSet.next()) {
                return new LinkedHashMap<>();
            }

            ResultSetMetaData metaData = resultSet.getMetaData();
            Map<String, Object> row = new LinkedHashMap<>();
            for (int i = 1; i <= metaData.getColumnCount(); i++) {
                row.put(metaData.getColumnLabel(i).toLowerCase(), normalize(resultSet.getObject(i)));
            }
            return row;
        }
    }

    public static Map<String, Object> querySingle(String sql, Object parameter) throws Exception {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setObject(1, parameter);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (!resultSet.next()) {
                    return new LinkedHashMap<>();
                }

                ResultSetMetaData metaData = resultSet.getMetaData();
                Map<String, Object> row = new LinkedHashMap<>();
                for (int i = 1; i <= metaData.getColumnCount(); i++) {
                    row.put(metaData.getColumnLabel(i).toLowerCase(), normalize(resultSet.getObject(i)));
                }
                if (resultSet.next()) {
                    throw new IllegalStateException("Se esperaba una fila, pero la consulta devolvió más de una");
                }
                return row;
            }
        }
    }

    private static Object normalize(Object value) {
        if (value instanceof BigDecimal decimal) {
            return decimal.doubleValue();
        }
        return value;
    }
}
