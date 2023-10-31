package com.smhrd.hari.controller;

import com.smhrd.hari.dto.RegisterShopDTO;
import com.smhrd.hari.dto.RegisterUserDTO;
import com.smhrd.hari.dto.ShopMenuDTO;
import com.smhrd.hari.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Base64;
import java.util.List;

@Controller
@RequestMapping("/hari")
public class ShopController {
    @Autowired
    ShopService shopService;

//    @GetMapping("/totalSignIn")
//    public String totalSignIn() {
//        return "register/totalSignIn";
//    }

    @PostMapping("/shopSignInOk")
    public ModelAndView shopSignInOk(RegisterShopDTO registerShopDTO) {
        int result = 0;

        try {
            result = shopService.shopInsert(registerShopDTO);
        } catch (Exception e) {
            System.out.println("회원가입 실패!!!" + e.getMessage());
        }

        ModelAndView mav = new ModelAndView();

        if(result > 0) {
            mav.setViewName("register/totalLogIn");
        } else {
            mav.setViewName("register/registerResult");
        }

        return mav;
    }

//    @GetMapping("/totalLogIn")
//    public String totalLogIn() {
//        return "register/totalLogIn";
//    }

    @PostMapping("/shopLogInOk")
    public ModelAndView shopLogInOk(RegisterShopDTO registerShopDTO, HttpSession session) {
        RegisterShopDTO loginResult = shopService.shopSelect(registerShopDTO);

        ModelAndView mav = new ModelAndView();

        if(loginResult != null) {
            session.setAttribute("logId", registerShopDTO.getbId());
            session.setAttribute("logStatus", "Y");
            session.setAttribute("logType", "S");

            mav.setViewName("main");
        } else {
            mav.setViewName("register/loginResult");
        }

        return mav;
    }

//    @GetMapping("/logout")
//    public ModelAndView logout(HttpSession session) {
//        session.invalidate();
//
//        ModelAndView mav = new ModelAndView();
//
//        mav.setViewName("redirect:/");
//
//        return mav;
//    }

    @GetMapping("/shopEdit")
    public String shopEdit(HttpSession session, Model model) {
        String bId = (String) session.getAttribute("logId");

        RegisterShopDTO registerShopDTO = shopService.shopSelectOne(bId);

        model.addAttribute("shop", registerShopDTO);

        return "register/shopEdit";
    }

    @PostMapping("/shopEditOk")
    public ModelAndView shopEditOk(RegisterShopDTO registerShopDTO) {
        int result = shopService.shopUpdate(registerShopDTO);

        ModelAndView mav = new ModelAndView();

        if(result > 0) {
            mav.setViewName("main");
        } else {
            mav.setViewName("redirect:/hari/shopEdit");
        }

        return mav;
    }

//    2023-10-13-jihan

    // 메뉴리스트
    @GetMapping("/shopMenuList")
    public ModelAndView shopMenuList(HttpSession session) {
        String bId = (String)session.getAttribute("logId");

        List<ShopMenuDTO> list;
        list = shopService.shopMenuList(bId);

        ModelAndView mav = new ModelAndView();

        for (ShopMenuDTO dto : list){
            byte[] imageData = dto.getmImg();
            String base64ImageData = Base64.getEncoder().encodeToString(imageData);
            dto.setmImg_base64(base64ImageData);
        }

        // 상점 정보 가져오기
//        RegisterShopDTO registerShopDTO = shopService.shopSelectOne(bId);
//
//        if(registerShopDTO != null) {
//            // 모델에 상점이름 추가
//            mav.addObject("storeName", registerShopDTO.getbName());
//        } else {
//            // 가게 정보가 없는 경우, 에러 페이지로 리다이렉트 혹은 에러 메시지 출력 등의 처리 필요
//            mav.addObject("noStore", true);
//        }
        // 기존 코드 유지
        ShopMenuDTO shopMenuDTO = new ShopMenuDTO();
        mav.addObject("dto", shopMenuDTO);
        mav.addObject("list", list);

        mav.setViewName("shop/shopMenuList");

        return mav;
    }



    @PostMapping("/shopMenuInsert")
    public String insertShopMenu(ShopMenuDTO shopMenuDTO) {
        shopService.shopMenuInsert(shopMenuDTO);
        return "redirect:/shopMenuList";  // 메뉴 등록 후 메뉴 목록 페이지로 리다이렉트
    }


    @GetMapping("/shopMenuWrite")
    public ModelAndView shopMenuWrite(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
//        mav.addObject("bId",(String)request.getSession().getAttribute("logId"));
        mav.setViewName("shop/shopMenuWrite");
        return mav;
    }

    //등록 db에
    @PostMapping("/shopMenuWriteOk")
    public ModelAndView shopMenuWriteOk(HttpServletRequest request,
                                        ShopMenuDTO dto,
                                        @RequestParam("mImg_base64") String base64ImageData) {

        dto.setbId((String)request.getSession().getAttribute("logId"));
        // 이 부분에서 세션에서 logId 값을 가져와 dto의 bId에 세팅
        ModelAndView mav = new ModelAndView();

        try {
            // Base64 디코팅
            String[] parts = base64ImageData.split(",");
            if(parts.length > 1) {
                byte[] imgData = Base64.getDecoder().decode(parts[1]);
                dto.setmImg(imgData);
            } else {
                mav.setViewName("redirect:/shop/errorPage");
                return mav;
            }
        } catch (IllegalArgumentException e) {
            // 이미지 넣기 에러출력
            System.err.println("Received invalid Base64 data: " + base64ImageData);
            System.err.println("Invalid Base64 format.");
            mav.setViewName("redirect:/shop/errorrPage");
            return mav;
        } catch (Exception e) {
            e.printStackTrace();
            mav.setViewName("redirect:/shop/errorrPage");
            return mav;
        }
//        dto.setBId((String)request.getSession().getAttribute("logId"));

        try {
            int insertResult = shopService.shopMenuInsert(dto);
            mav.setViewName("redirect:/hari/shopMenuList");
        } catch (Exception e) {
            e.printStackTrace();
            mav.setViewName("redirect:/hari/shopMenuList");
        }

        return mav;
    }

    // 등록상품 삭제하기
    @PostMapping("/shopMenuDelete")
    public String deleteMenu(@RequestParam("mNo") String mNo,
                             @RequestParam("bId") String bId,
                             RedirectAttributes redirectAttributes) {
        try {
            shopService.shopMenuDelete(mNo, bId);
            redirectAttributes.addFlashAttribute("message", "상품이 성공적으로 삭제되었습니다.");
            return "redirect:/hari/shopMenuList";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "상품 삭제 중 오류가 발생했습니다.");
            e.printStackTrace();
            return "redirect:/hari/shopMenuList";
        }
    }

}
