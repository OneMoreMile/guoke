package cn.guohe.dao;

import cn.guohe.pojo.User;

/**
 * Created by dongliang on 8/30/17.
 */
public interface UserDao {
    User findByNameAndPasswd(String userName, String password);
}
