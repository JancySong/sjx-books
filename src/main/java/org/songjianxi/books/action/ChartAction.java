package org.songjianxi.books.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.songjianxi.books.service.ChartServiceI;
import org.songjianxi.books.util.tips.RespChartData;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@ParentPackage("sjxPackage")
@Namespace("/")
@Action(value = "chartAction")
public class ChartAction implements ServletResponseAware {

    private ChartServiceI chartService;

    public ChartServiceI getChartService() {
        return chartService;
    }

    @Autowired
    public void setChartService(ChartServiceI chartService) {
        this.chartService = chartService;
    }

    HttpServletResponse response;

    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    public void chart() {
        List<RespChartData> list = chartService.chart();
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        try {
            response.getWriter().write(gson.toJson(list));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void chartGroup() {
        List<RespChartData> list = chartService.chartGroup();
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        try {
            response.getWriter().write(gson.toJson(list));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void bookChart() {
        List<RespChartData> list = chartService.bookChart();
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        try {
            response.getWriter().write(gson.toJson(list));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
