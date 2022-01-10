package kr.co.repository;

import java.util.List;
import java.util.Map;

import kr.co.domain.PageTO;
import kr.co.domain.ReviewVO;

public interface ReviewDAO {

	void insert(Map<String, Object> map);

	int getAmountReplyByBno(int board_no);

	List<ReviewVO> getRepliesPage(PageTO<ReviewVO> pt, int board_no);

	List<ReviewVO> getAllReplies(int board_no);

	void updateReview(ReviewVO rvo);

	void deleteReview(int review_no);

}