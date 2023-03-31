package com.bit.web.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.web.vo.SeatBoard;

public interface TicketService {
	void contentImg(int no,Model model);
	
	void musicalList(Model model,HashMap<String, Object>map);
	
	void movieList(Model model,HashMap<String, Object>map);
	
	void theaterList(Model model,HashMap<String, Object>map);
	
	void booking(int no,Model model,String date,String rundate);
	
	void ticketing(SeatBoard board,int no,String user_id,List<String>seatVal,Model model,String rundate);
}
