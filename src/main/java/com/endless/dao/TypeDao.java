package com.endless.dao;

import com.endless.pojo.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TypeDao {

    //    查询所有的类型
    List<Type> SelectAllType();

    //    添加商品类型
    int AddType(@Param("name") String name);

    //删除商品类型
    int DeletaType(@Param("id") int id);

    //    修改商品类型
    int UpdateType(@Param("id") int id, @Param("name") String name);

    Type FindTypeName(@Param("name") String name);

    Type FindTypeID(@Param("id") int id);

    Type AdminFindTypeExceptThisId(@Param("id") int id,@Param("name") String name);

    List<Type> getAllTypeDesc();

    int findTypeIdByName(@Param("typeName") String type);
}
