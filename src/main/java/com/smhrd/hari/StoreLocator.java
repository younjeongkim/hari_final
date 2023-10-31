package com.smhrd.hari;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;

@Repository
public class StoreLocator {
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public StoreLocator(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<String> findStoresNearby(double lat, double lon, double radiusKm) {
        // 반경 2km 이내의 가게 이름을 조회하는 쿼리 작성
        String sql = "SELECT bName FORM tb_business " +
                "WHERE (6371 * " +
                "ACOS(COS(RADIANS(?)) * COS(RADIANS(bLatitude)) * " +
                "COS(RADIANS(bLongitude) - RADIANS(?)) + SIN(RADIANS(?)) * " +
                "SIN(RADIANS(bLatitude)))) <= ?";

        List<String> nearbyStores = jdbcTemplate.queryForList(sql, String.class, lat, lon, lat, radiusKm);

        return nearbyStores;
    }
}
