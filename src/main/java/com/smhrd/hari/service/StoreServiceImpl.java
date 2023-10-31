package com.smhrd.hari.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StoreServiceImpl implements StoreService{
    private final SqlSessionTemplate sql;

    @Autowired
    public StoreServiceImpl(SqlSessionTemplate sql) {
        this.sql = sql;
    }


    @Override
    public List<Map<String, Object>> findStoresNearby(double lat, double lon, double radiusKm) {
        String query = "SELECT bId, bName, bCategory FROM tb_business " + // 10-19Jihan >> bId컬럼추가
                "WHERE (6371 * " +
                "ACOS(COS(RADIANS(?)) * COS(RADIANS(bLatitude)) * " +
                "COS(RADIANS(bLongitude) - RADIANS(?)) + SIN(RADIANS(?)) * " +
                "SIN(RADIANS(bLatitude)))) <= ?";

        Map<String, Object> params = new HashMap<>();

        params.put("lat", lat);
        params.put("lon", lon);
        params.put("radiusKm", radiusKm);

        return sql.selectList("Store.findStoresNearby", params);
    }
}
