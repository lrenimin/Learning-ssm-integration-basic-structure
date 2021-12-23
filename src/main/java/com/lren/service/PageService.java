package com.lren.service;

import com.github.pagehelper.PageInfo;
import com.lren.pojo.Users;

public interface PageService {

    //分页1:对用户信息列表进行分页
    PageInfo<Users> queryByPage(Integer pageNo, Integer pageSize);

}
