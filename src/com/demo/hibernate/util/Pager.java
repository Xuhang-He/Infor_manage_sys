package com.demo.hibernate.util;

import java.util.List;

public class Pager {
	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public List<?> getResultList() {
		return resultList;
	}

	public void setResultList(List<?> resultList) {
		this.resultList = resultList;
	}

	//页面大小
	protected int[] pageSizeList={10,25,50,100,200,300,500};
	// 一页显示的记录数
	protected int pageSize = 25;
	// 当前页码
	protected int pageNo = 1;
	//记录总数
	protected int rowCount = 0;
	//总页数
	protected int pageCount = 1;
	//起始行数
	protected int startIndex = 1;
	//结束行数
	protected int endIndex = 1;
	
	protected int firstPageNo=1;
	protected int prePageNo=1;
	protected int nextPageNo=1;
	protected int lastPageNo=1;
	
	// 结果集存放List
	protected List<?> resultList;
	
	public Pager(int pageSize,int pageNo,int rowCount,List<?> resultList){
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.rowCount = rowCount;
		this.resultList = resultList;
		
		
		if(rowCount%pageSize == 0){
			this.pageCount = rowCount/pageSize;
			
		}else{
			this.pageCount = rowCount/pageSize+1;
		}
		
		this.startIndex = pageSize*(pageNo-1);
		this.endIndex = this.startIndex+resultList.size();
		
		this.lastPageNo = this.pageCount;
		if(this.pageNo>1) this.prePageNo = this.pageNo-1;
		
		if(this.pageNo == this.lastPageNo){
			this.nextPageNo = this.lastPageNo;
		}else{
			this.nextPageNo = this.pageNo +1;
		}
		
	}
	
	
			
}
