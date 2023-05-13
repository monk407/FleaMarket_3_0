package com.endless.controller;

import com.alibaba.fastjson.JSON;
import com.endless.pojo.Goods;
import com.endless.pojo.User;
import com.endless.service.UserService;
import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
//import javax.jws.soap.SOAPBinding;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping("/toIndex.do")
    public String ToIndex(){
        return "";
    }
//    @RequestMapping("/toAdminIndex.do")
//    public String ToAdminIndex(){
//        return "adminIndex";
//    }

    @RequestMapping("/toAdminIndex.do")
    public String ToAdminIndex(HttpServletResponse response) {
        return "redirect:/admin/SelectDataColumn.do";
    }
    @RequestMapping("/toAdminIndexTmp.do")
    public String toAdminIndexTmp(HttpServletResponse response) {
        return "/admin/HomePage";
    }

    @RequestMapping("/login.do")
    @ResponseBody
    public void Login( HttpServletResponse response,HttpServletRequest request, HttpSession session, @RequestParam("ipt")String ipt,@RequestParam("ue")String ue, @RequestParam("password")String password) throws IOException {
        String token = (String)request.getSession().getAttribute("verifyCode");

        System.out.println(token+"!!!!!!!!!!!!!!!!!!!!!!!!@#@!$@#$@#$%@#$%@#$%");
        System.out.println(ipt+"!!!!!!!!!!!!!!!!!!!!!!!!@#@!$@#$@#$%@#$%@#$%");
        System.out.println(ue+password);
        Boolean codefalg = false;
        //ModelAndView modelAndView = new ModelAndView();

        User user = userService.login(ue,password);
        Map<String,Object> map = new HashMap<>();

        if (token!=null && token.equalsIgnoreCase(ipt)){
            request.getSession().removeAttribute("verifyCode");
            codefalg = true;
            map.put("codefalg",codefalg);
        }else {
            codefalg = false;
            map.put("codefalg",codefalg);
        }
        if(user == null){
            System.out.println("用户名、邮箱或者密码错误，请重新登录！");
            map.put("isUser",false);
            System.out.println(JSON.toJSONString(map));
            response.getWriter().print(JSON.toJSONString(map));
        }
        else {
            //user对象放入session域
            session.setAttribute("user",user);
            if(user.isIsadmin()){
                map.put("isUser",true);
                map.put("isAdmin",true);
                map.put("user",user);
                System.out.println(JSON.toJSONString(map));
                response.getWriter().print(JSON.toJSONString(map));
            }
            else {
                map.put("isUser",true);
                map.put("isAdmin",false);
                map.put("user",user);
                System.out.println(JSON.toJSONString(map));
                response.getWriter().print(JSON.toJSONString(map));

            }
        }
    }


    @RequestMapping("/register.do")
    @ResponseBody
    public void register(HttpServletResponse response,HttpServletRequest request,@RequestParam("ipt") String ipt,@RequestParam("username")String username,@RequestParam("email")String email,
                         @RequestParam("password")String password,@RequestParam("addressName")String addressName,
                         @RequestParam("phone")String phone,@RequestParam("address")String address
    ) throws IOException{
        Map<String,Object> map = new HashMap<>();
        Boolean flag = false;
        Boolean codefalg = false;
        String token = (String)request.getSession().getAttribute("verifyCode");
        System.out.println(token+"!!!!!!!!!!!!!!!!!!!!!!!!@#@!$@#$@#$%@#$%@#$%");
        System.out.println(ipt+"!!!!!!!!!!!!!!!!!!!!!!!!@#@!$@#$@#$%@#$%@#$%");
        if (token != null && token.equalsIgnoreCase(ipt)){
            flag= userService.register(username,email,password,addressName,phone,address);
            if (flag){
                request.getSession().removeAttribute("verifyCode");
            }
            codefalg = true;
            map.put("flag",flag);
            map.put("codefalg",codefalg);
            System.out.println("注册成功");
            System.out.println(JSON.toJSONString(map));
            response.getWriter().print(JSON.toJSONString(map));
        }else {
            map.put("flag",flag);
            map.put("codefalg",codefalg);
            System.out.println(JSON.toJSONString(map));
            response.getWriter().print(JSON.toJSONString(map));
        }




    }

    @RequestMapping("/isLogin.do")
    @ResponseBody
    public String isLogin(HttpSession session){

        User user = (User) session.getAttribute("user");
        if(user == null){
            return "false";
        }
        return "true";
    }

    @RequestMapping("loadUserNamePhoneAddress.do")
    @ResponseBody
    public Map loadUserNamePhoneAddress(HttpSession session){

        User user = (User) session.getAttribute("user");

        User u = userService.findUserById(user.getId());

        Map map = new HashMap();

        map.put("name",u.getName());
        map.put("address",u.getAddress());
        map.put("phone",u.getPhone());



        return map;
    }


//    @RequestMapping("/login.do")
//    public ModelAndView Login( HttpServletResponse response, HttpSession session, @RequestParam("ue")String ue, @RequestParam("password")String password) throws IOException {
//
//        ModelAndView modelAndView = new ModelAndView();
//        User user = userService.login(ue,password);
//        if(user == null){
//            System.out.println("用户名、邮箱或者密码错误，请重新登录！");
//            modelAndView.setViewName("forward:/login.jsp");
//            //return modelAndView;
//        }
//        else {
//            //user对象放入session域
//            session.setAttribute("user",user);
//
//
//            if(user.isIsadmin()){
//                modelAndView.setViewName("redirect:/user/toAdminIndex.do");
//                //return modelAndView;
//            }
//            else {
//
//                modelAndView.setViewName("redirect:/index.jsp");
//                //return modelAndView;
//
//            }
//
//        }
//        return modelAndView;
//    }

    @Autowired
    private Producer kaptchaProducer;
    //生成验证码
    @RequestMapping("/getVerifyCode.do")
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response){
        response.setDateHeader("Expires",0);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");
        String capText = kaptchaProducer.createText();//生产验证码
        request.getSession().setAttribute("verifyCode", capText);
        BufferedImage bi = kaptchaProducer.createImage(capText);//把验证码渲染到图片
        ServletOutputStream out = null;
        try {
            out = response.getOutputStream();//得到输出流
            ImageIO.write(bi, "jpg", out);//把图片以输出流的方式输出
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @RequestMapping("/UpdateUser.do")
    @ResponseBody
    public String AdminUpdateUser(HttpSession session, @RequestParam("id") int id, @RequestParam("email") String email, @RequestParam("name") String name,
                                  @RequestParam("phone") String phone, @RequestParam("address") String address) {

        Boolean flag = userService.UpdateUser(id,email,name,phone,address);
        if (flag){
            System.out.println(id+","+email+","+name+","+phone+","+address);
//          数据库中没有新修改的并且相同的用户名和数据，那么执行修改
            System.out.println("修改成功！！");
            return "true";
        }else {
            System.out.println("修改失败！！");
            return "false";
        }
    }


    @RequestMapping("MyIfro.do")
    public String MyIfro(HttpSession session,@RequestParam("userid")int id){
        User user = userService.findUserById(id);
        System.out.println("user:"+user);
        session.setAttribute("user",user);
        return "forward:/MyIfro.jsp";
    }

    @RequestMapping("/UpdateUserPassword.do")
    @ResponseBody
    public String UpdateUserPassword(HttpSession session, @RequestParam("id") int id, @RequestParam("password") String password) {
        Boolean flag = userService.UpdateUserPassword(id,password);
        if (flag){
            User user = userService.findUserById(id);
//          数据库中没有新修改的并且相同的用户名和数据，那么执行修改
            session.setAttribute("user",user);
            System.out.println("修改成功！！");
            return "true";
        }else {
            System.out.println("修改失败！！");
            return "false";
        }
    }

    @RequestMapping("/UserLogout.do")
    public String UserLogout(HttpSession session) {
        User user = (User)session.getAttribute("user");
        if (user != null) {
            session.removeAttribute("user");
        }
        // 退出登录后重定向到首页
        return "redirect:/index.jsp";
    }

//    ModifyPassword
@RequestMapping("/ModifyPassword.do")
@ResponseBody
public String ModifyPassword(@RequestParam("username") String username,
                             @RequestParam("email") String email,
                             @RequestParam("password2") String password2) {
    User userByNameAndEmail = userService.findUserByNameAndEmail(username, email);
    if (userByNameAndEmail!=null){
        Boolean flag = userService.UpdateUserPassword(userByNameAndEmail.getId(),password2);
        if (flag){
            System.out.println("修改成功！！");
            return "true";
        }else {
            System.out.println("修改失败！！");
            return "false";
        }
    }else {
        return "false";
    }
}
}
