package com.project.study;

import com.project.study.repository.StudyDAO;

import lombok.Data;

@Data
public class Paging {
	 	private final static int pageCount = 5;
	    private int blockStartNum = 0;
	    private int blockLastNum = 0;
	    private int lastPageNum = 0;
	    String openstudyseq;
	    
	    public void makeBlock(int curPage){
	        int blockNum = 0;

	        blockNum = (int)Math.floor((curPage-1)/ pageCount);
	        blockStartNum = (pageCount * blockNum) + 1;
	        blockLastNum = blockStartNum + (pageCount-1);
	    }

	    
	    // 총 페이지의 마지막 번호
	    public void makeLastPageNum() {
	        StudyDAO dao = new StudyDAO();
	        int total = dao.getCount(openstudyseq);

	        if( total % pageCount == 0 ) {
	            lastPageNum = (int)Math.floor(total/pageCount);
	        }
	        else {
	            lastPageNum = (int)Math.floor(total/pageCount) + 1;
	        }
	    }

	    // 검색을 했을 때 총 페이지의 마지막 번호
	    public void makeLastPageNum(String kwd) {
	    	StudyDAO dao = new StudyDAO();
	        int total = dao.getCount(kwd);

	        if( total % pageCount == 0 ) {
	            lastPageNum = (int)Math.floor(total/pageCount);
	        }
	        else {
	            lastPageNum = (int)Math.floor(total/pageCount) + 1;
	        }
	        
	        
	        
}
