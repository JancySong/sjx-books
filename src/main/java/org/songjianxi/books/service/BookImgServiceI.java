package org.songjianxi.books.service;

import java.io.Serializable;
import java.util.List;

import org.songjianxi.books.domain.BookImg;
import org.songjianxi.books.driven.BookImgDTO;
import org.songjianxi.books.util.tips.DataGridTip;

public interface BookImgServiceI {
    public List<String> getBookImgs(String bid);

    public DataGridTip<BookImgDTO> getBookImgsByConditon(BookImgDTO bookImgDTO);

    public Integer updateImgs(BookImgDTO bookImgDTO);

    public Integer deleteImgsByIds(String ids);

    public Integer countImgsByBookId(String id);

    public Serializable save(BookImg bookImg);
}
