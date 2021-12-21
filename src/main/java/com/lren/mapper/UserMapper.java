package com.lren.mapper;

import com.lren.pojo.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    //Retrieve all users
    List<Users> selectAllUsers();

    //Retrieve all users by id
    Users selectUsersByID(@Param("id") int id);

    //Create a new User
    int insertUser(Users users);

    //Update User Information
    int updateUserByID(Users users);

    //Delete User by ID
    int deleteUserByID(@Param("id") int id);


}
