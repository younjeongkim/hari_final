package com.smhrd.hari.controller;

import com.smhrd.hari.dto.BasketDTO;
import com.smhrd.hari.dto.ShopMenuDTO;
import com.smhrd.hari.service.OrderService;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/hari")
public class ApiController {

    @Autowired
    private OrderService orderService;  // OrderService를 주입
    @GetMapping("/main")
    public ModelAndView Test(@RequestParam(value = "order", required = false) String order, HttpSession session) throws UnsupportedEncodingException {
        ModelAndView mav = new ModelAndView();
        System.out.println(order);
        if (order != null) {
            // 주문 테스트
            String encodedOrder = URLEncoder.encode(order, StandardCharsets.UTF_8.toString());
            String url = "http://127.0.0.1:8000/klue/predict?order=" + encodedOrder;
            StringBuilder sb = new StringBuilder();
            try {
                HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
                String line;

                while ((line = br.readLine()) != null) {
                    sb.append(line).append("");
                }
                    // 10-24
                    // 음성 인식 결과 파싱
                    JSONParser parser = new JSONParser();
                    JSONObject jsonOrder;
                    try{
                        jsonOrder= (JSONObject)parser.parse(sb.toString());
                    }catch(ParseException e){
                        e.printStackTrace();
                        mav.addObject("result", "Error parsing the voice recognition result.");
                        mav.addObject("fail", true);
                        mav.setViewName("main");
                        return mav;
                    }
                    // 2023-10-24 jihan 수정
// JSON 객체 안에 'temperature', 'mName', 'mCnt' 필드 모두 존재하면 정상적인 결과로 간주
                    if(jsonOrder.containsKey("temperature") && jsonOrder.containsKey("mName") && jsonOrder.containsKey("mCnt")){
                        System.out.println("test");
                    // BasketDTO 객체 생성 및 설정
                    BasketDTO basketItem= new BasketDTO();
                    String userId = (String)session.getAttribute("logId");  // 세션에서 사용자 ID 가져오기
                    if(userId == null){
                        mav.addObject("result", "You need to log in first.");
                        mav.addObject("fail", true);
                        mav.setViewName("main");
                        return mav;
                    }

                    basketItem.setUserId(userId);
                    // JSON 응답 파싱 및 예외 처리 시작
                    try {
                        String mName = jsonOrder.get("mName") != null ? jsonOrder.get("mName").toString() : null;
                        Integer mCnt = jsonOrder.get("mCnt") != null ? Integer.parseInt(jsonOrder.get("mCnt").toString()) : null;
                        String temperature = jsonOrder.get("temperature") != null ? jsonOrder.get("temperature").toString() : null;

                        if(mName == null || mCnt == null || temperature == null){
                            throw new Exception();
                        }
                        // DB에서 mName에 해당하는 메뉴의 mNo 찾기
                        List<ShopMenuDTO> menuInfos = orderService.getMenuDetailByMName(mName);

                        if(menuInfos == null) {
                            mav.addObject("result", "The menu does not exist.");
                            mav.addObject("fail", true);
                            mav.setViewName("main");
                            return mav;
                        }
                        basketItem.setCreated_at(LocalDateTime.now());
                        basketItem.setUserId(userId);  // 사용자 ID
                        ShopMenuDTO menuInfo = menuInfos.get(0);
                        basketItem.setmNo(menuInfo.getmNo());  // 메뉴 번호
                        basketItem.setTemperature(temperature);  // 온도
                        basketItem.setmCnt(mCnt);  // 메뉴 수량 설정


                    } catch(Exception e) {
                        e.printStackTrace();
                        mav.addObject("result", "Error parsing the voice recognition result.");
                        mav.addObject("fail", true);
                        mav.setViewName("main");
                        return mav;
                    }
// JSON 응답 파싱 및 예외 처리 끝
                    List<BasketDTO> basket;

                    if(session.getAttribute("basket") == null){
                        basket= new ArrayList<>();
                    } else{
                        basket= (List<BasketDTO>)session.getAttribute("basket");
                    }

                    // 여기에 로그 출력 코드 추가 10-24-17:22 음성 인식 API 호출 결과(sb.toString())
                    Object attribute = session.getAttribute("basket");
                    if (attribute == null) {
                        System.out.println("Basket is null");
                    } else {
                        if (attribute != null) {
                            System.out.println(attribute);
                        }
                    }

                    basket.add(basketItem);
                    session.setAttribute("basket",basket);

// 여기에 로그 출력 코드 추가 10-24-17:22 음성 인식 API 호출 결과(sb.toString())
                    System.out.println("User ID from session: " + userId);

                    if(session.getAttribute("basket") == null){
                        basket= new ArrayList<>();
                    } else{
                        basket= (List<BasketDTO>)session.getAttribute("basket");
                    }
                    System.out.println("Basket from session: " + basket);
                    System.out.println("Basket from session: " + order);
                    // addBasket 호출 및 예외 처리 시작
                    try{
                        orderService.addBasketForApi(basketItem);
                    } catch(Exception e) {
                        e.printStackTrace();
                        mav.addObject("result", "Error adding the item to the basket.");
                        mav.addObject("fail", true);
                        mav.setViewName("main");
                        return mav;
                    }
// addBasket 호출 및 예외 처리 끝
                }
                br.close();

            } catch (MalformedURLException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

            mav.addObject("result", sb.toString());
        } else {
            mav.addObject("result", "No order provided.");
        }

        mav.addObject("fail", false);
        mav.setViewName("main");
        return mav;
    }
}