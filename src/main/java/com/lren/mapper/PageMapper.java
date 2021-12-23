package com.lren.mapper;

import com.lren.pojo.Users;

import java.util.List;

public interface PageMapper {

    //1.定义接口：查询所有用户信息，按用户ID进行排序
    List<Users> selectUsers();

}
