package com.lren.service;

import com.lren.pojo.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {

    //Retrieve all users
    List<Users> selectAllUsers();

    //Retrieve all users by id
    Users selectUsersByID(@Param("id") int id);

    /**
     * @Author: lrenimin
     * @Description: //Retrieve Users By Like
     * @Date: 12:01 2021/12/26
     * @Param: [name]
     * @return: java.util.List<com.lren.pojo.Users>
     */
    List<Users> selectUsersByLike(@Param("username") String name);

    //Create a new User
    int insertUser(Users users);

    //Update User Information
    int updateUserByID(Users users);

    //Delete User by ID
    int deleteUserByID(@Param("id") int id);

}
