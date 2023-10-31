package com.smhrd.hari.service;

import java.util.List;
import java.util.Map;

public interface StoreService {
    List<Map<String, Object>> findStoresNearby(double lat, double lon, double radiusKm);
}
