package com.smhrd.hari.service;

import com.smhrd.hari.dto.RegisterShopDTO;
import com.smhrd.hari.dto.ShopMenuDTO;

import java.util.List;

public interface ShopService {
    int shopInsert(RegisterShopDTO registerShopDTO);

    RegisterShopDTO shopSelect(RegisterShopDTO registerShopDTO);

    RegisterShopDTO shopSelectOne(String bId);

    int shopUpdate(RegisterShopDTO registerShopDTO);

    public List<ShopMenuDTO> shopMenuList(String bId);

    int shopMenuInsert(ShopMenuDTO dto);

    // 상품삭제하기
    void shopMenuDelete(String mNo, String bId);
}
