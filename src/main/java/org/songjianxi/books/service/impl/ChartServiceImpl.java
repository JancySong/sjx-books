package org.songjianxi.books.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.transform.Transformers;
import org.songjianxi.books.dao.BasicDaoI;
import org.songjianxi.books.service.ChartServiceI;
import org.songjianxi.books.util.tips.RespChartData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "chartService")
@SuppressWarnings(value = {"unchecked", "rawtypes"})
public class ChartServiceImpl implements ChartServiceI {

    private BasicDaoI basicDao;

    public BasicDaoI getBasicDao() {
        return basicDao;
    }

    @Autowired
    public void setBasicDao(BasicDaoI basicDao) {
        this.basicDao = basicDao;
    }



    public List<RespChartData> chart() {
        Calendar calendar = Calendar.getInstance();
        Date timeTo = calendar.getTime();
        calendar.add(Calendar.DAY_OF_MONTH, -7);
        Date timeFrom = calendar.getTime();
        return basicDao.executeSqlName("orderChart").setParameter("timeFrom", timeFrom).setParameter("timeTo", timeTo)
                .setResultTransformer(Transformers.aliasToBean(RespChartData.class)).list();
    }

    @Override
    public List<RespChartData> chartGroup() {
        Calendar calendar = Calendar.getInstance();
        Date timeTo = calendar.getTime();
        calendar.add(Calendar.DAY_OF_MONTH, -7);
        Date timeFrom = calendar.getTime();
        return basicDao.executeSqlName("orderChartGroup").setParameter("timeFrom", timeFrom).setParameter("timeTo", timeTo)
                .setResultTransformer(Transformers.aliasToBean(RespChartData.class)).list();
    }

    @Override
    public List<RespChartData> bookChart() {
        return basicDao.executeSqlName("bookChart").setResultTransformer(Transformers.aliasToBean(RespChartData.class)).setFirstResult(0)
                .setMaxResults(10).list();
    }

}
