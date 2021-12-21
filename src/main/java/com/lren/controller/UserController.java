package com.lren.controller;

import com.lren.pojo.Users;
import com.lren.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/userList")
    public String selectAllUsers(Model model) {
        List<Users> usersList = userService.selectAllUsers();
        model.addAttribute("userList", usersList);
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
        model.addAttribute("user",users);
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

}