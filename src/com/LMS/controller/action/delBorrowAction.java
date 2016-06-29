package com.LMS.controller.action;

import org.hibernate.HibernateException;

import com.LMS.model.forms.RecordForm;
import com.LMS.model.service.RecordManager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class delBorrowAction extends ActionSupport {
	private RecordForm record;

	private RecordManager RecordManager;
	
	private String status;
	
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatus() {
		return this.status;
	}
	public RecordForm getRecord() {
		return record;
	}
	
	public void setRecord(RecordForm record) {
		this.record = record;
	}
	
	public void setRecordManager(RecordManager RecordManager) {
		this.RecordManager = RecordManager;
	}
	
	public String execute() throws HibernateException, InterruptedException {
		if(record.getBookId() == null || record.getBookId().equals("")) {
			status = "������bookId!";
			ActionContext.getContext().put("status",this.status);
			return ERROR;
		} else if(record.getUserId() == null || record.getUserId().equals("")){
			status = "������UserId!";
			ActionContext.getContext().put("status",this.status);
			return ERROR;
		}
		status = this.RecordManager.delBorrow(record);
		if(status.equals("Success")) {
			ActionContext.getContext().put("status",this.status);
			return SUCCESS;
		} else {
			ActionContext.getContext().put("status",this.status);
			return ERROR;
		}
	}
}
