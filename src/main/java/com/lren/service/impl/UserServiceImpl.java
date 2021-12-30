package com.lren.service.impl;

import com.lren.mapper.UserMapper;
import com.lren.pojo.Users;
import com.lren.service.UserService;

import java.util.List;

/**
 * @ClassName: UserServiceImpl
 * @Description: //TODO
 * @Author: Riove
 * @Date: 2021/12/20 12:44
 * @Version: 1.0
 */
public class UserServiceImpl implements UserService {

    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public List<Users> selectAllUsers() {
        return userMapper.selectAllUsers();
    }

    public Users selectUsersByID(int id) {
        return userMapper.selectUsersByID(id);
    }

    public List<Users> selectUsersByLike(String name) {
        return userMapper.selectUsersByLike(name);
    }


    public int insertUser(Users users) {
        return userMapper.insertUser(users);
    }

    public int updateUserByID(Users users) {
        return userMapper.updateUserByID(users);
    }

    public int deleteUserByID(int id) {
        return userMapper.deleteUserByID(id);
    }

}
