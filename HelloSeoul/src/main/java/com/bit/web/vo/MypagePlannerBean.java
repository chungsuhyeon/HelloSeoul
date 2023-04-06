package com.bit.web.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MypagePlannerBean {
	private int planner_no;
	private String user_id;
	private String planner_start;
	private String planner_end;
	private String planner_title;
	private String planner_info;
}
