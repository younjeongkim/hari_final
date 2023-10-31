package com.smhrd.hari.service;

import com.smhrd.hari.dto.RegisterShopDTO;
import com.smhrd.hari.dto.ShopMenuDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ShopServiceImpl implements ShopService {
    @Autowired
    SqlSessionTemplate sql;

    @Override
    public int shopInsert(RegisterShopDTO registerShopDTO) {
        return sql.insert("Shop.shopInsert", registerShopDTO);
    }

    @Override
    public RegisterShopDTO shopSelect(RegisterShopDTO registerShopDTO) {
        return sql.selectOne("Shop.shopSelect", registerShopDTO);
    }

    @Override
    public RegisterShopDTO shopSelectOne(String bId) {
        return sql.selectOne("Shop.shopSelectOne", bId);
    }

    @Override
    public int shopUpdate(RegisterShopDTO registerShopDTO) {
        return sql.update("Shop.shopUpdate", registerShopDTO);
    }

    @Override
    public List<ShopMenuDTO> shopMenuList(String bId) {
        return sql.selectList("Shop.shopMenuList",bId);
    }

    @Override
    public int shopMenuInsert(ShopMenuDTO shopMenuDTO) {
        return sql.insert("Shop.shopMenuInsert", shopMenuDTO);
    }

    @Override
    @Transactional
    public void shopMenuDelete(String mNo, String bId) {

        Map<String, Object> params = new HashMap<>();
        params.put("mNo", mNo);
        params.put("bId", bId);

        sql.delete("Shop.shopMenuDelete", params);
    }


}
