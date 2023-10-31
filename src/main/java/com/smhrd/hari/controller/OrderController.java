    package com.smhrd.hari.controller;

    import com.smhrd.hari.dto.*;
    import com.smhrd.hari.service.OrderService;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Controller;
    import org.springframework.transaction.annotation.Transactional;
    import org.springframework.web.bind.annotation.*;
    import org.springframework.web.servlet.ModelAndView;
    import org.slf4j.Logger;
    import org.slf4j.LoggerFactory;

    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpSession;
    import java.text.DecimalFormat;
    import java.time.LocalDateTime;
    import java.util.ArrayList;
    import java.util.Base64;
    import java.util.Calendar;
    import java.util.List;

    // api합치는 import
    import com.smhrd.hari.dto.BasketDTO;
    import org.springframework.web.bind.annotation.GetMapping;
    import org.springframework.web.bind.annotation.RequestMapping;
    import org.springframework.web.bind.annotation.RequestParam;

    @Controller
    @RequestMapping("/hari")
    public class OrderController {

        private static final Logger logger = LoggerFactory.getLogger(OrderController.class); // 이 부분을 추가합니다.

        @Autowired
        OrderService orderService;

@GetMapping("/orderMenu")
public ModelAndView orderMenu(@RequestParam("bId") String bId) {
    List<ShopMenuDTO> list;
    list = orderService.orderMenu(bId);

    ModelAndView mav = new ModelAndView();

    for (ShopMenuDTO dto : list) {
        byte[] imageData = dto.getmImg();
        String base64ImageData = Base64.getEncoder().encodeToString(imageData);
        dto.setmImg_base64(base64ImageData);
    }
    String bName = orderService.getbNameById(bId);  // 10-20 jihan
    mav.addObject("bName", bName);

    ShopMenuDTO shopMenuDTO = new ShopMenuDTO(); // ShopMenuDTO의 인스턴스 생성
    mav.addObject("dto", shopMenuDTO); // 모델에 ShopMenuDTO 객체 추가
    mav.addObject("list", list);
    mav.setViewName("order/orderMenu");

    return mav;
}
        @GetMapping("/orderOption")
        public ModelAndView orderOption(@RequestParam String mNo, @RequestParam String bId, HttpSession session) {

            // getMenuDetailByMNo 메서드를 호출하여 메뉴 상세 정보를 가져옴.
            ShopMenuDTO selectedMenu = orderService.getMenuDetailByMNo(mNo); // mNo 값을 사용하여 메뉴 상세 정보 조회

            // 여기에 사용자가 선택한 메뉴와 관련된 옵션을 가져오는 코드를 추가.
            String selectedTemperature = ""; // 사용자가 선택한 온도를 저장할 변수

            // 10-19JIHAN
            ModelAndView mav = new ModelAndView();
            String bName = orderService.getbNameById(bId);  // 10-20 jihan
            mav.addObject("bName", bName);
            // 10-19 Jihan
            mav.addObject("selectedMenu", selectedMenu); // 모델에 선택된 메뉴의 상세 정보 객체 추가
            mav.addObject("selectedTemperature", selectedTemperature); // 모델에 사용자가 선택한 온도 추가
            mav.addObject("bId", bId);  // 모델에 bId 추가
            session.setAttribute("selectedTemperature", selectedTemperature);
            session.setAttribute("bId", bId);  // 세션에 값 저장

            mav.setViewName("order/orderOption");
            return mav;
        }

        // 카트담기
        // 장바구니에 추가
        @PostMapping("/addBasket")
        public String addBasket(@ModelAttribute BasketDTO dto, HttpSession session, HttpServletRequest request) {
            String userId = (String) session.getAttribute("logId");
            dto.setUserId(userId);
            dto.setCreated_at(LocalDateTime.now());
            String bId = request.getParameter("bId");
            // 사용자가 선택한 옵션 설정.
            String temperature = request.getParameter("temperature");
            dto.setTemperature(temperature);
            dto.setbId(bId); // bID 값 설정

            try {
                orderService.addBasket(dto); // 수정된 시그니처에 따라 서비스 호출
                return "redirect:/hari/orderMenu?bId=" + bId;
            } catch (Exception e) {
                e.printStackTrace();
                return "fail"; // 실패 시 "fail" 문자열 반환
            }
        }


        // 장바구니 목록
        @GetMapping("/orderBasket")
        public ModelAndView getBasketList(HttpServletRequest request) {
            ModelAndView mav = new ModelAndView();
            // cartList 데이터를 얻는 로직 (예를 들어, service.carList(...) 등)

            List<BasketListDTO> basketList = orderService.basketList((String) request.getSession().getAttribute("logId"));

            // 10-20 jihan
            String bId = (String) request.getSession().getAttribute("bId");
            if(basketList != null && !basketList.isEmpty() && bId != null){
                String bName = orderService.getbNameById(bId);
                mav.addObject("bName", bName);
            }

            for (BasketListDTO dto : basketList) {
                byte[] imageData = dto.getmImg();
                String base64ImageData = Base64.getEncoder().encodeToString(imageData);
                dto.setmImg_base64(base64ImageData);
            }

            mav.addObject("basketList", basketList);

            mav.setViewName("order/orderBasket");
            return mav;
        }

        //    // 장바구니 삭제
        //    @ResponseBody
        //    @PostMapping("/delCart")
        //    public int delCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartDTO dto) {
        //        String userid = (String) session.getAttribute("logId");
        //
        //        int result = 0;
        //        int c_no = 0;
        //
        //        if(userid != null) {
        //            dto.setUserid(userid);
        //
        //            for(String i : chArr) {
        //                c_no = Integer.parseInt(i);
        //                dto.setC_no(c_no);
        //                service.delCart(dto);
        //            }
        //            result = 1;
        //        }
        //        return result;
        //    }

        @PostMapping("/orderBasket")
        @Transactional
        public ModelAndView order(HttpSession session, OrderDetailDTO orderDetail) {

            String userId = (String) session.getAttribute("logId");
            Calendar cal = Calendar.getInstance();

            int year = cal.get(Calendar.YEAR);
            String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
            String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
            String subNum = "";

            for (int i = 1; i <= 6; i++) {
                subNum += (int) (Math.random() * 10);
            }

            String orderId = ymd + subNum;
            long orderIdInt = Long.parseLong(orderId);
            orderDetail.setoNo(orderIdInt);
            orderDetail.setUserId(userId);

            orderService.insertOrderDetail(orderDetail);

            // ModelAndView 객체를 생성하고 basketList와 userId를 담아서 orderDetail 페이지로 전달
            ModelAndView mav = new ModelAndView("orderDetail");
            mav.addObject("basketList", orderService.basketList(userId)); // basketList를 가져와서 전달
            mav.addObject("userId", userId); // userId도 전달
            return mav;
        }

        // 여기부터는 주문합니다
        // 주문 상세 페이지로 이동

        @PostMapping("/orderDetail")
        public ModelAndView orderDetail(@RequestParam("selectedProducts") String selectedProducts, HttpServletRequest request) {
            ModelAndView mav = new ModelAndView();
            String bId = request.getParameter("bId");
            if (selectedProducts.isEmpty()) {
                mav.setViewName("error");
                mav.addObject("message", "선택된 상품이 없습니다.");
                return mav;
            }

            logger.info("Selected Products:" + selectedProducts);
            String[] items = selectedProducts.split(",");
            List<BasketListDTO> selectedProductsList = new ArrayList<>();

            int totalAmount = 0; // 주문 금액임

            for (int i = 0; i < items.length; i += 2) {
                String mNo = items[i];
                String temperature = items[i + 1];

                BasketListDTO product = orderService.getProductFromBasket(mNo, temperature);

                if (product != null) {
                    selectedProductsList.add(product);
                    totalAmount += product.getmPrice() * product.getmCnt(); // 상품가격 * 수량임
                    logger.info("Added product: " + product);
                } else {
                    logger.error("Product not found: " + mNo + ", " + temperature);
                }
            }
            String bName = orderService.getbNameById(bId);  // 10-20 jihan
            mav.addObject("bName", bName);
            mav.addObject("selectedProducts", selectedProductsList);

            // 할인 금액 및 최종 결제 금액 계산 로직
            int discountAmount = 0; // 할인 금액
            int payAmount = totalAmount - discountAmount; // 최종 결제 금액

            mav.addObject("totalAmount", totalAmount); // 주문 금액 추가
            mav.addObject("discountAmount", discountAmount); // 할인 금액 추가 default 0으로 설정해놔서 노상관
            mav.addObject("payAmount", payAmount); // 최종 결제급 추가

            mav.setViewName("order/orderDetail");
            return mav;
        }

        @PostMapping("/clearBasket")
        @ResponseBody
        public String clearBasket(HttpSession session) {
            String userId = (String) session.getAttribute("logId");

            try {
                orderService.clearBasket(userId);

                return "success";
            } catch (Exception e) {
                e.printStackTrace();

                return "fail";
            }
        }

    }