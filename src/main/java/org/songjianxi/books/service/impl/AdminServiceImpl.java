package org.songjianxi.books.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.songjianxi.books.dao.AdminDaoI;
import org.songjianxi.books.domain.Admin;
import org.songjianxi.books.driven.AdminDTO;
import org.songjianxi.books.service.AdminServiceI;
import org.songjianxi.books.util.ConvertUtil;
import org.songjianxi.books.util.common.EmptyUtil;
import org.songjianxi.books.util.common.EncryptUtil;
import org.songjianxi.books.util.tips.DataGridTip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "adminService")
public class AdminServiceImpl implements AdminServiceI {

    private AdminDaoI adminDao;

    public AdminDaoI getAdminDao() {
        return adminDao;
    }

    @Autowired
    public void setAdminDao(AdminDaoI adminDao) {
        this.adminDao = adminDao;
    }


    @Override
    public Admin findAdminByNameAndPassWord(AdminDTO adminDTO) {
        Admin admin = null;
        String hql = " from Admin admin where admin.username = :username and admin.password = :password";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("username", adminDTO.getUsername());
        params.put("password", EncryptUtil.MD5(adminDTO.getPassword()));
        List<Admin> list = adminDao.find(hql, params);
        if (list != null && list.size() > 0) {
            admin = list.get(0);
        }
        return admin;
    }

    @Override
    public Admin findAdminByName(AdminDTO adminDTO) {
        Admin admin = new Admin();
        String hql = " from Admin admin where admin.username = :username";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("username", adminDTO.getUsername());
        List<Admin> list = adminDao.find(hql, params);
        if (list != null && list.size() > 0) {
            admin = list.get(0);
        }
        return admin;
    }

    @Override
    public Serializable saveAdmin(Admin admin) {
        return adminDao.save(admin);
    }

    @SuppressWarnings("unchecked")
    @Override
    public DataGridTip<AdminDTO> findAdminsByCondition(AdminDTO adminDTO) {
        DataGridTip<AdminDTO> dataGridTip = new DataGridTip<AdminDTO>();
        String hql = " from Admin admin where 1=1 ";
        Map<String, Object> params = new HashMap<String, Object>();
        int pageIndex = 1;
        int pageSize = 10;
        if (adminDTO.getPage() != 0) {
            pageIndex = adminDTO.getPage();
        }
        if (adminDTO.getRows() != 0) {
            pageSize = adminDTO.getRows();
        }
        if (EmptyUtil.isNotEmpty(adminDTO.getUsername())) {
            hql = hql + " and admin.username = :username";
            params.put("username", "%%" + adminDTO.getUsername() + "%%");
        }
        List<Admin> list = adminDao.find(hql, params, pageIndex, pageSize);
        List<AdminDTO> resLit = new ArrayList<AdminDTO>();
        if (EmptyUtil.isNotEmpty(list)) {
            resLit = (List<AdminDTO>) ConvertUtil.convertModel(list, AdminDTO.class);
        }
        String totalHql = "select count(*) " + hql;
        dataGridTip.setTotal(adminDao.count(totalHql, params));
        dataGridTip.setRows(resLit);
        return dataGridTip;
    }
}
