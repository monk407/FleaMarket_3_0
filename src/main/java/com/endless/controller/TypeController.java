package com.endless.controller;

import com.endless.pojo.Type;
import com.endless.service.TypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/type")
public class TypeController {

    @Resource
    private TypeService typeService;

    @RequestMapping("typeNav.do")
    @ResponseBody
    public List<Type> typeNavSearch(){

        List<Type> typeList = typeService.getAllTypeDesc();
        //System.out.println(typeList);
        return typeList;

    }


}
