package com.bit.web.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MypageMainPlannerBean {
	private int planner_no;
	private String user_id;
	private int loc_pc;
	private String loc_name;
	private String loc_ctg1;
	private String loc_ctg2;
	private String loc_sg;
	private float loc_x;
	private float loc_y;
	private String planner_date;
	private String planner_shour;
	private String planner_smin;
}
