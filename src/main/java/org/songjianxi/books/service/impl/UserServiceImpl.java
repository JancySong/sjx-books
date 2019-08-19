package org.songjianxi.books.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.songjianxi.books.dao.UserDaoI;
import org.songjianxi.books.domain.User;
import org.songjianxi.books.driven.UserDTO;
import org.songjianxi.books.service.UserServiceI;
import org.songjianxi.books.util.BeanUtils;
import org.songjianxi.books.util.tips.DataGridTip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "userService")
public class UserServiceImpl implements UserServiceI {

    private UserDaoI userDao;

    public UserDaoI getUserDao() {
        return userDao;
    }

    @Autowired
    public void setUserDao(UserDaoI userDao) {
        this.userDao = userDao;
    }

    @Override
    public User checkUser(User user) {
        String hql = "from User u where u.username = :userName and u.password = :passWord and u.isActivate = :isActivate";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("userName", user.getUsername());
        params.put("passWord", user.getPassword());
        params.put("isActivate", 1);
        return userDao.get(hql, params);
    }

    @Override
    public User isExistUserName(String username) {
        String hql = "from User u where u.username = :userName";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("userName", username);
        return userDao.get(hql, params);
    }

    @Override
    public User addUser(User user) {
        Serializable id = userDao.save(user);
        if (id != null && !id.equals("")) {
            return user;
        } else {
            return null;
        }
    }

    @Override
    public DataGridTip<UserDTO> getUserByCondition(UserDTO userDTO) {
        DataGridTip<UserDTO> dataGridTip = new DataGridTip<UserDTO>();
        Map<String, Object> params = new HashMap<String, Object>();
        int pageIndex = 1, pageSize = 10;
        if (userDTO.getPage() != null && userDTO.getPage() != 0) {
            pageIndex = userDTO.getPage();
        }
        if (userDTO.getRows() != null && userDTO.getRows() != 0) {
            pageSize = userDTO.getRows();
        }
        String hql = "from User user where 1=1 ";
        String totalHql = "";
        if (userDTO.getUsername() != null) {
            hql = hql + " and user.username like :username ";
            params.put("username", "%%" + userDTO.getUsername() + "%%");
        }
        if (userDTO.getStatus() != null) {
            hql = hql + " and user.status = :status ";
            params.put("status", userDTO.getStatus());
        }
        if (userDTO.getCreateTimeFrom() != null) {
            hql = hql + " and user.createTime between :createTimeFrom and :createTimeTo ";
            params.put("createTimeFrom", userDTO.getCreateTimeFrom());
            params.put("createTimeTo", userDTO.getCreateTimeTo());
        }
        if (userDTO.getIsActivate() != null) {
            hql = hql + " and user.isActivate = :isActivate ";
            params.put("isActivate", userDTO.getIsActivate());
        }
        List<User> list = userDao.find(hql, params, pageIndex, pageSize);
        List<UserDTO> resultList = new ArrayList<UserDTO>();
        UserDTO resUserDTO = null;
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                resUserDTO = new UserDTO();
                BeanUtils.copyNotNullProperties(list.get(i), resUserDTO);
                resultList.add(resUserDTO);
                System.out.println(resUserDTO);
            }
        }
        totalHql = "select count(*) " + hql;
        dataGridTip.setRows(resultList);
        dataGridTip.setTotal(userDao.count(totalHql, params));
        return dataGridTip;
    }

    @Override
    public Integer activeUser(UserDTO userDTO) {
        String hql =
                "update User user set user.isActivate = :isActivate where user.username = :username and user.activationCode = :activationCode";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("isActivate", 1);
        params.put("username", userDTO.getUsername());
        params.put("activationCode", userDTO.getActivationCode());
        return userDao.update(hql, params);
    }

    @Override
    public Integer userOnlineOrOutline(UserDTO userDTO) {
        String hql = "update User user set user.status = :status where user.userId = :userId";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("status", userDTO.getStatus());
        params.put("userId", userDTO.getUserId());
        return userDao.update(hql, params);
    }
}
