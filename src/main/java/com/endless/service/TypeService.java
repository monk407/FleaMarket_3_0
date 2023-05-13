package com.endless.service;

import com.endless.pojo.Type;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TypeService {
    /**
     *
     * @return 得到所有的商品类型
     */
    List<Type> AdminGetAllType();

    //    添加商品类型
    Boolean AdminAddTypeService(String name);

    //删除商品类型
    Boolean AdminDeleteType(int id);

    //    修改商品类型
    Boolean AdminUpdateType(int id,String name);

    //    根据id获取商品类型信息
    Type AdminGetTypeByid(int id);

    List<Type> getAllTypeDesc();

    /**
     *
     * @return 得到所有的商品类型
     */
    List<Type> MyGoodGetAllType();



}
