package com.bit.web.alpha;

import com.bit.web.vo.MultiPageBean;

public class AlphaService {
	
	private MultiPageBean bean;
	
	public void makePageBean(int pageScale, int totalCount) {
		bean.setPageScale(pageScale);
		if(totalCount%bean.getPageScale()==0) {
			bean.setLastPageNum(totalCount/bean.getPageScale());
		}
		else {
			bean.setLastPageNum(totalCount/bean.getPageScale()+1);
			
		}
	}
	
	public void makeBlock(int curPage) {
		int blockNum = 0;
		
		blockNum = (curPage-1)/bean.getPageScale();
		bean.setBlockStartNum(bean.getPageScale()*blockNum+1);
		bean.setBlockEndNum(bean.getBlockStartNum()+bean.getPageScale()-1);
		
	}
	
	public MultiPageBean callBean() {
		return bean;
	}
	
    // �˻��� ���� �� �� �������� ������ ��ȣ
//    public void makeLastPageNum(String kwd) {
//        BoardDAO dao = new BoardDAO();
//        int total = dao.getCount(kwd);
//
//        if( total % pageCount == 0 ) {
//            lastPageNum = (int)Math.floor(total/pageCount);
//        }
//        else {
//            lastPageNum = (int)Math.floor(total/pageCount) + 1;
//        }
//    }

}
