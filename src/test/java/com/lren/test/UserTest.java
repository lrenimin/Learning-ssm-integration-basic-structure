package com.lren.test;

import com.lren.pojo.Users;
import com.lren.service.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * @ClassName: UserTest
 * @Description: //TODO
 * @Author: Riove
 * @Date: 2021/12/20 13:34
 * @Version: 1.0
 */
public class UserTest {

    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    UserService userServiceImpl = (UserService) context.getBean("UserServiceImpl");

    @Test
    public void selectAllUsersTest() {
        List<Users> usersList = userServiceImpl.selectAllUsers();
        for (Users users : usersList) {
            System.out.println(users);
        }
    }
    @Test
    public void selectUserByID() {
        Users users = userServiceImpl.selectUsersByID(1);
        System.out.println(users);
    }
    @Test
    public void insertUser() {
        Users users = new Users();
        users.setUsername("bdmin");
        users.setPassword("bdmin");
        users.setTelephone("18776257605");
        users.setEmail("2018909386@qq.com");
        userServiceImpl.insertUser(users);
    }
    @Test
    public void updateUser() {
        Users users = new Users();
        users.setId(1);
        users.setUsername("edmin");
        users.setPassword("edmin");
        users.setTelephone("18776257605");
        users.setEmail("2018909386@qq.com");
        userServiceImpl.updateUserByID(users);
    }
}
