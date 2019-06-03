package com.bookshop.controller;

import com.bookshop.beans.Book;
import com.bookshop.beans.SearchResultsPaging;
import com.bookshop.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class SearchController {
    @Autowired
    SearchService searchService;

    //根据书名模糊查找书籍
    @RequestMapping("/toSearchResultsPage")
    private String paging(@RequestParam("pageNumber") int pagenumber,
                          @RequestParam(value = "queryCondition",required = false) String queryCondition,
                          HttpServletRequest request){
        int pageSize=20;
        SearchResultsPaging search=new SearchResultsPaging();
        if(queryCondition!=null&&queryCondition!="")
            search.setQueryCondition(queryCondition);
        search.setPageSize(pageSize);
        search.setPageNumber(pagenumber);
        search.setListCount(searchService.count(search));
        search.setTotalPageCount(search.getListCount()%pageSize==0? search.getListCount()/pageSize : search.getListCount()/pageSize+1 );
        search.setBookList(searchService.paging(search));
        request.setAttribute("result",search);
        return "searchResultsPage";
    }

    //根据书的id查找书
    @RequestMapping("/toBookInfoPage")
    private String toBookInfoPage(int id,HttpServletRequest request){
        Book book=searchService.searchBookById(id);
        request.setAttribute("book",book);
        return "bookInfoPage";
    }
}
