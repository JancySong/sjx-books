package org.songjianxi.books.service;

import java.io.Serializable;

import org.songjianxi.books.domain.Admin;
import org.songjianxi.books.driven.AdminDTO;
import org.songjianxi.books.util.tips.DataGridTip;

public interface AdminServiceI {

    public Admin findAdminByNameAndPassWord(AdminDTO adminDTO);

    public Admin findAdminByName(AdminDTO adminDTO);

    public Serializable saveAdmin(Admin admin);

    public DataGridTip<AdminDTO> findAdminsByCondition(AdminDTO adminDTO);
}
