package com.bit.web.alpha;
import org.springframework.stereotype.Repository;
import com.bit.web.vo.MultiPageBean;

@Repository
public class PagingAlgo {
	
	//Scale Setting	
	public MultiPageBean settingScale(int blockScale, int pageScale, MultiPageBean pg){
		pg.setBlockScale(blockScale);
		pg.setPageScale(pageScale);
		
		return pg;
	}
	
	//Total Setting
	public MultiPageBean settingTotal(int totalContents, MultiPageBean pg) {
		int totalPage;
		if(totalContents%pg.getPageScale()==0) {
			totalPage = totalContents/pg.getPageScale();
		}
		else {
			totalPage = (totalContents/pg.getPageScale())+1;
		}
		
		pg.setTotalPage(totalPage);
		
		int totalBlock;
		
		if(pg.getTotalPage()%pg.getBlockScale()==0) {
			totalBlock = pg.getTotalPage()/pg.getBlockScale();
		}
		else {
			totalBlock = (pg.getTotalPage()/pg.getBlockScale())+1;
		}
		
		pg.setTotalBlock(totalBlock);
		return pg;
	}
	
	
	public MultiPageBean settingAll(int blockScale, int pageScale, int totalContentts, MultiPageBean pg) {
		this.settingScale(blockScale, pageScale, pg);
		this.settingTotal(totalContentts, pg);
		return pg;
	}
	
	public MultiPageBean settingStartEnd(int currentPage, int currentBlock, MultiPageBean pg) {
		int pageScale = pg.getPageScale();
		pg.setCurrentPage(currentPage);
		pg.setCurrentBlock(currentBlock);
		pg.setPageStart((currentPage-1)*pageScale);
		pg.setPageEnd(currentPage*pageScale);

		
		
		return pg;
	}

}
