package com.smhrd.hari.service;

import com.smhrd.hari.dto.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class OrderServiceImpl implements OrderService{
    @Autowired
    SqlSessionTemplate sql;


    @Override
    public List<ShopMenuDTO> orderMenu(String bId) {
        return sql.selectList("Order.orderMenu",bId);
    }

    @Override
    public String getbNameById(String bId) {
        return sql.selectOne("Order.getBNameById", bId);
    }

    @Override
    public ShopMenuDTO getMenuDetailByMNo(String mNo) {
        return sql.selectOne("Order.getMenuDetailByMNo", mNo);
    }

    @Override
    public List<ShopMenuDTO> getMenuDetailByMName(String mName) {
        return sql.selectList("Order.getMenuDetailByMName", mName);
    }

    @Override
    public void addBasket(BasketDTO dto) {
        sql.insert("Order.addBasket", dto);
    }

    @Override
    public void addBasketForApi(BasketDTO basketItem) {
        sql.insert("Order.addBasketForApi", basketItem);
    }


    @Override
    public List<BasketListDTO> basketList(String userid) {

        return sql.selectList("Order.basketList", userid);
    }


    @Override
    public void insertOrderDetail(OrderDetailDTO orderDetail) {

        sql.insert("insertOrderDetail", orderDetail);
    }

    @Override
    public OrderDetailDTO getOrderDetailByONo(String oNo) {
        return sql.selectOne("selectOrderDetailByONo", oNo);
    }

    @Override
    public BasketListDTO getProductFromBasket(String mNo, String temperature) {
        Map<String,String> map = new HashMap<>();
        map.put("mNo", mNo);
        map.put("temperature", temperature);

        BasketListDTO product = sql.selectOne("Order.getProductByMnoAndTemperature", map);

        if (product != null && product.getmImg() != null) {
            String base64ImageData = Base64.getEncoder().encodeToString(product.getmImg());
            product.setmImg_base64(base64ImageData);
        }

        return product;
    }

    @Override
    public void clearBasket(String userId) {
        sql.delete("Order.clearBasket", userId);
    }



}
