package com.smhrd.hari.controller;

import com.smhrd.hari.dto.RegisterShopDTO;
import com.smhrd.hari.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/hari")
public class StoreController {
    @Autowired
    private StoreService storeService;

    @GetMapping("/locateStores")
    @ResponseBody
    public List<Map<String, Object>> locateStore(@RequestParam("lat") double lat, @RequestParam("lon") double lon) {
        // 반경 2km 이내의 가게 정보를 조회하는 서비스 호출
        List<Map<String, Object>> stores = storeService.findStoresNearby(lat, lon, 2.0);

        // 10-19 <JiHan>
        for (Map<String,Object> store : stores) {
            String bId = (String)store.get("bId");
            store.put("bId", bId);
        }

        return stores;
    }
}
