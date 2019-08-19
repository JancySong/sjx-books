package org.songjianxi.books.service;

import java.util.List;

import org.songjianxi.books.util.tips.RespChartData;

public interface ChartServiceI {

    public List<RespChartData> chart();

    public List<RespChartData> chartGroup();


    public List<RespChartData> bookChart();

}
