package com.lren.mapper;

import com.lren.pojo.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    /**
     * @Author: Riove
     * @Description: //Retrieve all users
     * @Date: 11:56 2021/12/26
     * @Param: NULL
     * @return: java.util.List<com.lren.pojo.Users>
     */
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
    //注意：@Param("")注解username，必须mapper.xml中保持一致，对应关系
    List<Users> selectUsersByLike(@Param("username") String name);

    //Create a new User
    int insertUser(Users users);

    //Update User Information
    int updateUserByID(Users users);

    //Delete User by ID
    int deleteUserByID(@Param("id") int id);


}
