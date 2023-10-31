package com.smhrd.hari.service;

import com.smhrd.hari.dto.*;

import java.util.List;

public interface OrderService {
        public List<ShopMenuDTO> orderMenu(String bId);
        String getbNameById(String bId); // 10-20-jihan
        ShopMenuDTO getMenuDetailByMNo(String mNo);
        // 10-24
        List<ShopMenuDTO> getMenuDetailByMName(String mName);


        // 수정된 시그니처
        public void addBasket(BasketDTO dto);

        public void addBasketForApi(BasketDTO basketItem);

        public List<BasketListDTO> basketList(String userId);



        public void insertOrderDetail(OrderDetailDTO orderDetail);

        OrderDetailDTO getOrderDetailByONo(String oNo);

        BasketListDTO getProductFromBasket(String mNo, String temperature);

        void clearBasket(String userId);
}
