package com.jewel.admin.paging;

import org.springframework.stereotype.Component;

@Component(value = "AdminIgnoreListPaging")
public class AdminIgnoreListPaging {
	private int currentPage;//현재페이지
	private int pageBlock;//[이전][][][다음]
	private int pageSize;//1페이지에 12개씩
	private int totalList;//총글수
	private StringBuffer pagingHTML;
	private String type;
	private String sort;
	private String keyword;
	private String path;
	public void makePagingHTML() {
		pagingHTML=new StringBuffer();
		int totalP=(totalList+pageSize-1)/pageSize;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		if(endPage>totalP)endPage=totalP;
		pagingHTML.append("<ul class='pagination' style='justify-content: center;'>");
		if(startPage>pageBlock)
			pagingHTML.append("<li class='page-item'><a class='page-link' href='"+path+"/adminIgnoreList?pg="+(startPage-1)+"'>이전</a></li>");
		
		for(int i=startPage;i<=endPage;i++) {
			if(i==currentPage) {
				pagingHTML.append("<li class='page-item active'><a class='page-link' href='"+path+"/adminIgnoreList?pg="+i+"'>"+i+"</a></li>");
			}else {
				pagingHTML.append("<li class='page-item'><a class='page-link' href='"+path+"/adminIgnoreList?pg="+i+"'>"+i+"</a></li>");
			}
			
			
		}
		
		if(endPage<totalP) {
			pagingHTML.append("<li class='page-item'><a class='page-link' href='"+path+"/adminIgnoreList?type="+type+"&pg="+(endPage+1)+"'>다음</a></li>");
		}
		pagingHTML.append("</ul>");
	}
	
	public void makeKeywordPagingHTML() {
		pagingHTML=new StringBuffer();
		int totalP=(totalList+pageSize-1)/pageSize;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		if(endPage>totalP)endPage=totalP;
		pagingHTML.append("<ul class='pagination' style='justify-content: center;'>");
		if(startPage>pageBlock)
			pagingHTML.append("<li class='page-item'><a class='page-link' href='"+path+"/item/itemList?keyword="+keyword+"&pg="+(startPage-1)+"&sort="+sort+"'>이전</a></li>");
		
		for(int i=startPage;i<=endPage;i++) {
			if(i==currentPage) {
				pagingHTML.append("<li class='page-item active'><a class='page-link' href='"+path+"/item/itemList?keyword="+keyword+"&pg="+i+"&sort="+sort+"'>"+i+"</a></li>");
			}else {
				pagingHTML.append("<li class='page-item'><a class='page-link' href='"+path+"/item/itemList?keyword="+keyword+"&pg="+i+"&sort="+sort+"'>"+i+"</a></li>");
			}
			
			
		}
		
		if(endPage<totalP) {
			pagingHTML.append("<li class='page-item'><a class='page-link' href='"+path+"/item/itemList?keyword="+keyword+"&pg="+(endPage+1)+"&sort="+sort+"'>다음</a></li>");
		}
		pagingHTML.append("</ul>");
	}
	

	/* setter & getter */
	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getPageBlock() {
		return pageBlock;
	}


	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getTotalList() {
		return totalList;
	}


	public void setTotalList(int totalList) {
		this.totalList = totalList;
	}


	public StringBuffer getPagingHTML() {
		return pagingHTML;
	}


	public void setPagingHTML(StringBuffer pagingHTML) {
		this.pagingHTML = pagingHTML;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getSort() {
		return sort;
	}


	public void setSort(String sort) {
		this.sort = sort;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public String getPath() {
		return path;
	}


	public void setPath(String path) {
		this.path = path;
	}
	
	
}
