package com.endless.service.impl;

import com.endless.dao.GoodsDao;
import com.endless.dao.OrderDao;
import com.endless.dao.OrderItemDao;
import com.endless.dao.UserDao;
import com.endless.pojo.Goods;
import com.endless.pojo.Order;
import com.endless.pojo.OrderItem;
import com.endless.pojo.User;
import com.endless.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;
    @Resource
    private OrderDao orderDao;
    @Resource
    private OrderItemDao orderItemDao;
    @Resource
    private GoodsDao goodsDao;

    @Override
    public List<User> findUser() {

        List<User> userList = userDao.selectUser();
        return userList;

    }

    @Override
    public User findUser2(User user) {

        User user1 = new User();
        user1.setName("admin");
        user1.setAddress("GCC");

        User user2 = userDao.selectUser2(user);
        return user;

    }

    @Override
    public User login(String ue, String password) {

        User user = null;

        user = userDao.selectByUsernamePassword(ue, password);
        if (user != null) {
            return user;
        }
        user = userDao.selectByEmailPassword(ue, password);
        if (user != null) {
            return user;
        }
        return null;

    }

    @Override
    public Boolean register(String username, String email, String password, String name, String phone, String address) {

        List<User> user = userDao.isUserNameAndEmail(username, email);

        if (user.size() == 0) {
            int count = userDao.addUser(new User(username, email, password, name, phone, address));
            if (count == 1) {
                return true;
            }
            return true;
        } else {
            return false;
        }

    }


    @Override
    public Boolean AdminAddUser(String username, String email, String password, String name, String phone, String address, boolean isadmin) {
        List<User> user = userDao.isUserNameAndEmail(username, email);
        User user1 = new User(username, email, password, name, phone, address, isadmin);
        if (user.size() == 0) {
            if (isadmin == true) {
                int count = userDao.AdminAddUser1(user1);
                if (count == 1) {
                    return true;
                } else return false;
            } else {
                int count = userDao.AdminAddUser0(user1);
                if (count == 1) {
                    return true;
                } else return false;
            }
        } else {
            return false;
        }
    }

    @Override
    public PageInfo<User> getUserpage(Integer pageNum) {
//        开启分页功能
        PageHelper.startPage(pageNum, 4);
//        查询所有的员工信息
        List<User> userList = userDao.selectUser();
//        获取分页相关的数据
        PageInfo<User> page = new PageInfo<>(userList, 5);
        return page;
    }

    @Override
    public Boolean resetPassword(int id) {
        int count = userDao.AdminResetPassword(id);
        if (count != 0) {
            return true;
        } else return false;

    }

    @Override
    public Boolean AdminDeleteUserByid(int userid) {

//        ----------------------------------------
//        判断删除订单的时候该订单状态是否全为3，true表示全为3，false表示不全为3
        boolean orderStatusAll3 = false;
//        判断删除货物的时候，该good是否存在,true表示存在，false表示不存在
        boolean goodbyUserexist = true;
//        判断在删除货物中的orderitem是否存在，true表示存在，false表示不存在
        boolean goodorderItemExist = true;
//        判断货物中要买的订单项里面的订单状态是否全为3，true表示全为3，false表示不全为3
        boolean goodOrderitemStatus = false;

//        1、首先删除该用户的order
//        根据user.id = order.user_id查看是否有订单
        List<Order> ORDERS = orderDao.selectUserOrder(userid);
        List<Goods> GOODS = goodsDao.SelectUseridGoods(userid);
        List<OrderItem> ORDERITEMS = new ArrayList<>();

        if (ORDERS.size() == 0 && GOODS.size() == 0) {
            //**************删user***************************
            int count = userDao.AdminDeleteUser(userid);
            if (count != 0) {
                return true;
            } else return false;
        }

//            判断有没有订单
//            有：根据user.id = order.user_id查出status：
        if (ORDERS.size() != 0) {
            for (Order order : ORDERS) {
//                  若不全为3：return false
                if (order.getStatus() != 3) {
                    System.out.println("该用户的订单还有未完成的！！");
                    return false;
                }
            }
//                  若全为3：
            System.out.println("订单全部完成！！！！！！");
            orderStatusAll3 = true;
  /*
//                      根据order.id = orderitem.order_id 删除orderitem
            for (Order order : ORDERS) {
                orderItemDao.deleteItem(order.getId());
            }
//                      然后根据userid删除order；
            orderDao.deleteOrderByUserid(userid);
*/
        }

        //无：执行2、
//            ==============2======================
//        2、然后删除该用户上架的goods
//            根据user.id = good.user_id 查出是否有good
        List<OrderItem> ORDERITEMS2 = new ArrayList<>();
        if (GOODS.size() != 0) {
            //  有：根据good.id = orderitem.good_id 查询是否有orderitem
            for (Goods good : GOODS) {
                List<OrderItem> orderItems1 = orderItemDao.SelectGoodidItem(good.getId());
                ORDERITEMS2.addAll(orderItems1);
            }
            if (ORDERITEMS2.size() != 0) {
//                            有：根据orderitem.order_id = order.id 的status是否全为3
                for (OrderItem orderItem : ORDERITEMS2) {
//                                不全为3：return false
                    if (orderItem.getOrder().getStatus() != 3) {
                        System.out.println("该货物还有订单没有卖出去！！！");
                        return false;
                    }
                }
                System.out.println("货物中的订单全部卖出去了！！！");
                goodOrderitemStatus = true;
/*
//                              全为3：修改orderitem.good_id = 1
                    for (OrderItem orderItem : ORDERITEMS) {
//            修改这个订单项的good_id为1，表示已经下架。
                        orderItemDao.Updategoodid(orderItem.getId());
                    }
//                              删除good
                    for (Goods good : GOODS) {
                        goodsDao.deletegoods(good.getId());
                    }
                    */
            } else {
//                    无item：删除good
                System.out.println("上架的货物没有一个卖出去的，无item");
                goodorderItemExist = false;
                /*
                    //            无item：删除good
                    for (Goods good : GOODS) {
                        goodsDao.deletegoods(good.getId());
                    }
                    */
            }

        } else {// 无：执行3
            System.out.println("用户没有上传的货物！！！");
            goodbyUserexist = false;

        }
//            ==============2======================

        if (orderStatusAll3 == true && goodbyUserexist == false) {
//               ========orderStatusAll3=======
//         根据order.id = orderitem.order_id 删除orderitem
            for (Order order : ORDERS) {
                orderItemDao.deleteItem(order.getId());
            }
//                      然后根据userid删除order；
            orderDao.deleteOrderByUserid(userid);

//                =================goodbyUserexist=============
//**************删user***************************
            int count = userDao.AdminDeleteUser(userid);
            if (count != 0) {
                return true;
            } else return false;
        } else if (orderStatusAll3 == true && goodorderItemExist == false) {
            //               ========orderStatusAll3=======
//         根据order.id = orderitem.order_id 删除orderitem
            for (Order order : ORDERS) {
                orderItemDao.deleteItem(order.getId());
            }
//                      然后根据userid删除order；
            orderDao.deleteOrderByUserid(userid);

//               ===========goodorderItemExist ==========
//            无item：删除good
            for (Goods good : GOODS) {
                goodsDao.deletegoods(good.getId());
            }
//**************删user***************************
            int count = userDao.AdminDeleteUser(userid);
            if (count != 0) {
                return true;
            } else return false;
        } else if (orderStatusAll3 == true && goodOrderitemStatus == true) {
            //               ========orderStatusAll3=======
//         根据order.id = orderitem.order_id 删除orderitem
            for (Order order : ORDERS) {
                orderItemDao.deleteItem(order.getId());
            }
//                      然后根据userid删除order；
            orderDao.deleteOrderByUserid(userid);

            //              ==============goodOrderitemStatus========
//           全为3：修改orderitem.good_id = 1
            for (OrderItem orderItem : ORDERITEMS2) {
//            修改这个订单项的good_id为1，表示已经下架。
                orderItemDao.Updategoodid(orderItem.getId());
            }
//                删除good
            for (Goods good : GOODS) {
                goodsDao.deletegoods(good.getId());
            }

            //**************删user***************************
            int count = userDao.AdminDeleteUser(userid);
            if (count != 0) {
                return true;
            } else return false;
        }
        if (ORDERS.size() == 0 && goodbyUserexist == false) {

//**************删user***************************
            int count = userDao.AdminDeleteUser(userid);
            if (count != 0) {
                return true;
            } else return false;
        } else if (ORDERS.size() == 0 && goodorderItemExist == false) {

//               ===========goodorderItemExist ==========
//            无item：删除good
            for (Goods good : GOODS) {
                goodsDao.deletegoods(good.getId());
            }
//**************删user***************************
            int count = userDao.AdminDeleteUser(userid);
            if (count != 0) {
                return true;
            } else return false;
        } else if (ORDERS.size() == 0 && goodOrderitemStatus == true) {
            //              ==============goodOrderitemStatus========
//           全为3：修改orderitem.good_id = 1
            for (OrderItem orderItem : ORDERITEMS2) {
//            修改这个订单项的good_id为1，表示已经下架。
                orderItemDao.Updategoodid(orderItem.getId());
            }
//                删除good
            for (Goods good : GOODS) {
                goodsDao.deletegoods(good.getId());
            }

            //**************删user***************************
            int count = userDao.AdminDeleteUser(userid);
            if (count != 0) {
                return true;
            } else return false;
        }

        return false;
    }

    @Override
    public User AdminFindUpdateUser(int id) {
        User user = userDao.AdminFindUpdateUser(id);
        if (user != null) {
            return user;
        } else return null;
    }

    @Override
    public Boolean AdminUpdateUser(User user) {
        User user2 = userDao.AdminFindUserExceptThisId(user.getId(), user.getUsername(), user.getEmail());
        System.out.println(user2 + "执行AdminFindUsereExceptThisId之后！！！！！！！！！！！！！！！！user2的值");
        if (user2 == null) {
            if (user.isIsadmin()) {
                int count = userDao.AdminUpdateUser1(user);
                System.out.println(count + "################count#########################");
                if (count == 0) {
                    return false;
                } else return true;
            } else {
                int count = userDao.AdminUpdateUser0(user);
                System.out.println(count + "################count#########################");
                if (count == 0) {
                    return false;
                } else return true;
            }

        } else {
            return false;
        }
    }

    @Override
    public User findUserById(int id) {

        User user = userDao.findUserById(id);

        return user;
    }


    //读数据库行数
    @Override
    public int selectUserColumn() {
        return userDao.selectUserColumn();
    }

    //    搜索功能
    @Override
    public List<User> AdminSearchUser(String searchValue) {
        List<User> users = userDao.AdminSearchUser(searchValue);
        return users;
    }

    @Override
    public Boolean UpdateUser(int id, String email, String name, String phone, String address) {

        System.out.println("UpdateUser:" + id + "," + email + "," + name + "," + phone + "," + address);

        int count = userDao.UpdateUser(id,email,name,phone,address);
        System.out.println(count + "################count#########################");
        if (count == 0) {
            return false;
        } else return true;

    }

    @Override
    public Boolean UpdateUserPassword(int id, String password) {
        int count = userDao.UpdateUserPassword(id,password);
        System.out.println(count + "################count#########################");
        if (count == 0) {
            return false;
        } else return true;
    }

    @Override
    public User findUserByNameAndEmail(String ue, String email) {
        User user = userDao.findUserByNameAndEmail(ue,email);
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:"+user);
        return user;
    }
}
