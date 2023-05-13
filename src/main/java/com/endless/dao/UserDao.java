package com.endless.dao;

import com.endless.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {

    List<User> selectUser();

    User selectUser2(User user);

    User selectByUsernamePassword(@Param("username") String username, @Param("password") String password);

    User selectByEmailPassword(@Param("email") String email,@Param("password") String password);

    List<User> isUserNameAndEmail(@Param("username") String username, @Param("email") String email);

    int addUser(User user);


    //读数据库行数
    int selectUserColumn();

    //    CYJ！！！！！！！！！！！
    int AdminAddUser1(User user);
    int AdminAddUser0(User user);
    int AdminResetPassword(@Param("id") int id);
    int AdminDeleteUser(@Param("id") int id);
    User AdminFindUpdateUser(@Param("id") int id);
    User AdminFindUserExceptThisId(@Param("id") int id, @Param("username") String username, @Param("email") String email);
    int AdminUpdateUser1(User user);
    int AdminUpdateUser0(User user);
    List<User> AdminSearchUser(@Param("searchValue") String searchValue);
    User findUserById(@Param("id") int id);

    int UpdateUser(@Param("id")int id, @Param("email")String email, @Param("name")String name, @Param("phone")String phone, @Param("address")String address);
    int UpdateUserPassword(@Param("id")int id, @Param("password")String password);

    User findUserByNameAndEmail(@Param("username") String username,@Param("email") String email);
    //    CYJ

}
