package com.cuiwei.mapper;

import com.cuiwei.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component
public interface UserMapper {
    public User get(String loginname);
    User getByLoginname(@Param("loginname") String loginname, @Param("password") String password);
    void setuser(@Param("loginname") String loginname, @Param("password") String password, @Param("username") String username);
    int updatepassword(@Param("loginname") String loginname, @Param("newpassword") String newpassword);

}
