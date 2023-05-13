package com.endless.service.impl;


import com.endless.dao.GoodsDao;
import com.endless.dao.TypeDao;
import com.endless.pojo.Goods;
import com.endless.pojo.Type;
import com.endless.service.TypeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class TypeServiceImpl implements TypeService {


    @Resource
    private TypeDao typeDao;
    @Resource
    private GoodsDao goodsDao;

    @Override
    public List<Type> AdminGetAllType() {
        List<Type> types = typeDao.SelectAllType();

        return types;
    }

    @Override
    public Boolean AdminAddTypeService(String name) {
        int count = 0;

        Type type = typeDao.FindTypeName(name);
        if (type == null){
            count = typeDao.AddType(name);
            System.out.println(count+"WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWQQ");
            if (count == 1) return true;
            else return false;
        }else return false;

    }

    @Override
    public Boolean AdminDeleteType(int typeid) {
//        点击要删除的类型
//        需要查找到所有该类型的货物，并且把这些货物的type_id改成1
        goodsDao.UpdateTypeid(typeid);
//        修改完成之后才可删除该类型
        int count = 0;
        count = typeDao.DeletaType(typeid);
        if (count != 0) return true;
        else return false;

    }

    @Override
    public Boolean AdminUpdateType(int id, String name) {
        Type type = typeDao.AdminFindTypeExceptThisId(id, name);
        if (type==null){
            int count = 0;
            count = typeDao.UpdateType(id, name);
            if (count != 0) return true;
            else return false;
        }else return false;

    }

    @Override
    public Type AdminGetTypeByid(int id) {
        Type type = typeDao.FindTypeID(id);
        return type;
    }

    @Override
    public List<Type> getAllTypeDesc() {
        List<Type> types = typeDao.getAllTypeDesc();
        return types;
    }
    @Override
    public List<Type> MyGoodGetAllType() {
        List<Type> types = typeDao.SelectAllType();

        return types;
    }
}
