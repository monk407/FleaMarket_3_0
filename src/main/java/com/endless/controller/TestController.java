package com.endless.controller;

import com.endless.pojo.User;
import com.endless.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/user")
public class TestController {

    @Resource
    private UserService userService;





    @RequestMapping("/test1.do")
    public ModelAndView test1(){

        ModelAndView mv = new ModelAndView();
        String mes = "嗨嗨嗨";
        mv.addObject("message",mes);
        //转发
        //mv.setViewName("test1");
        // mv.setViewName("test1")  等价于
         mv.setViewName("forward:/WEB-INF/jsp/test1.jsp");
        return mv;

    }

    //ajax
    @RequestMapping("/test2.do")
    @ResponseBody
    public List<User> test2(){

        List<User> userList = userService.findUser();
        System.out.println(userList);
        return userList;

    }

    //重定向不能访问/WEB-INF资源

    //重定向1
    @RequestMapping("test3.do")
    public ModelAndView test3(String name , String age){

        ModelAndView mv = new ModelAndView();
        mv.addObject("username",name);
        mv.addObject("userAge",age);

        //重定向
        mv.setViewName("redirect:/test3.jsp");
        return mv;

    }



    //重定向隐藏url参数
    @RequestMapping("test4.do")
    public String test4(Model model, RedirectAttributes attr,String msg,String name,String age){

        attr.addFlashAttribute("msg4","message4");
        attr.addFlashAttribute("name",name);
        attr.addFlashAttribute("age",age);

        return "redirect:/user/tmp.do";

    }
    @RequestMapping("tmp.do")
    public String Test4(Model model,@ModelAttribute("msg4") String msg,@ModelAttribute("name") String name,@ModelAttribute("age") String age){
        model.addAttribute("msg4",msg);
        model.addAttribute("name",name);
        model.addAttribute("age",age);
        return "test4";
    }

    @RequestMapping("test5.do")
    public String test5(@ModelAttribute("msg") String msg){

        System.out.println(msg);
        return "forward:/Test.jsp";

    }


}
