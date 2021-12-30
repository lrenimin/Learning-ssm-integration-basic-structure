package com.lren.controller;

import com.github.pagehelper.PageInfo;
import com.lren.pojo.Users;
import com.lren.service.PageService;
import com.lren.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private PageService pageService;

    /*分页并将数据返回客户端*/
    @RequestMapping("/userList")
    public String selectAllUsers(Model model,
                                 @RequestParam(defaultValue = "1") Integer pageNum,
                                 @RequestParam(defaultValue = "4") Integer pageSize) {
        /*List<Users> usersList = userService.selectAllUsers();*/
        PageInfo<Users> usersPageInfo = pageService.queryByPage(pageNum, pageSize);
        model.addAttribute("userList", usersPageInfo);
        return "userList";
    }

    /*通过like查询关键字，进行用户检索*/
    @RequestMapping("/queryUser")
    public String selectUsersByLike(Model model, String userName) {
        List<Users> usersList = userService.selectUsersByLike(userName);
        model.addAttribute("queryUser", usersList);
        return "userList";
    }

    /*添加一个新的用户*/
    @RequestMapping("/addUser")
    public String addUser() {
        return "addUserList";
    }

    @RequestMapping("/addUserList")
    public String addUserList(Users users) {
        userService.insertUser(users);
        return "redirect:/user/userList";
    }

    /*修改用户信息*/
    @RequestMapping("/updateUser/{id}")
    public String updateUser(Model model, @PathVariable("id") int id) {
        Users users = userService.selectUsersByID(id);
        model.addAttribute("user", users);
        return "updateUserList";
    }

    @RequestMapping("/updateUserList")
    public String updateUserList(Users users) {
        userService.updateUserByID(users);
        return "redirect:/user/userList";
    }

    /*通过用户ID删除用户*/
    @RequestMapping("/deleteUser/{id}")
    public String deleteUserByID(@PathVariable("id") int id) {
        userService.deleteUserByID(id);
        return "redirect:/user/userList";
    }

    /**
     * 用户登录验证
     */
    @RequestMapping("/login")
    @ResponseBody
    public String loginVerify(String email, String password) {
        String msg = "";
        //帐号验证
        if ("admin".equals(email)) {
            msg = "OK";
        } else if ("admin".equals(password)) {
            msg = "SUCCESS";
        } else {
            msg = "ERROR";
        }
        return msg;
    }

}
