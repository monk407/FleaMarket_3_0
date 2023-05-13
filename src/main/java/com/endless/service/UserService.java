package com.endless.service;

import com.endless.pojo.User;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface UserService {

    List<User> findUser();

    User findUser2(User user);

    User login(String ue, String password);

    Boolean register(String username, String email, String password, String addressName, String phone, String address);


    Boolean AdminAddUser(String username, String email, String password, String addressName, String phone, String address,boolean isadmin);

    PageInfo<User> getUserpage(Integer pageNum);

    //读数据库行数
    int selectUserColumn();

    /**
     * 重置密码，传入要重置的用户id
     * @param id
     * @return 成功true，失败或者其他false
     */
    Boolean resetPassword(int id);

    /**
     * 删除用户，传入删除的id
     * @param id
     * @return 成功true，失败或者其他false
     */
    Boolean AdminDeleteUserByid(int id);

    /**
     * 更新用户，根据传入的id值查找该用户
     * 用于数据回显
     * @param id
     * @return
     */
    User AdminFindUpdateUser(int id);

    /**
     * 查看数据库中是否有除了该id之外相同的用户名和邮箱
     * @param user
     * @return
     */
    Boolean AdminUpdateUser(User user);

    /**
     * 搜索框模糊查询，可输入用户名，邮箱，收货人，手机号码，收获地址进行查询
     * @param searchValue
     * @return
     */
    List<User> AdminSearchUser(String searchValue);

    User findUserById(int id);

    /**
     * 修改收获人，手机号码，收获地址
     * @param id
     * @param name
     * @param phone
     * @param address
     * @return
     */
    Boolean UpdateUser(int id,String email,String name,String phone,String address);

    /**
     * 修改密码
     * @param id
     * @param password
     * @return
     */
    Boolean UpdateUserPassword(int id,String password);

    /**
     * 传入用户名和邮箱，返回该用户的id
     * @param ue
     * @param email
     * @return
     */
    User findUserByNameAndEmail(String ue,String email);

}
