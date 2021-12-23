package com.lren.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lren.mapper.PageMapper;
import com.lren.pojo.Users;
import com.lren.service.PageService;

import java.util.List;

/**
 * @ClassName: PageServiceImpl
 * @Description: //TODO
 * @Author: Riove
 * @Date: 2021/12/23 12:12
 * @Version: 1.0
 */
public class PageServiceImpl implements PageService {

    private PageMapper pageMapper;

    public void setPageMapper(PageMapper pageMapper) {
        this.pageMapper = pageMapper;
    }

    //1.业务实现：对用信息列表进行分页
    public PageInfo<Users> queryByPage(Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<Users> usersList = pageMapper.selectUsers();
        PageInfo<Users> usersPageInfo = new PageInfo<Users>(usersList);
        System.out.println(usersPageInfo.getFirstPage());
        System.out.println(usersPageInfo.getNextPage());
        System.out.println(usersPageInfo.getTotal());
        return usersPageInfo;
    }
}
