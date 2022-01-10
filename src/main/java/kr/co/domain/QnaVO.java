package kr.co.domain;

import java.io.Serializable;
import java.util.Objects;

public class QnaVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private int qna_no;
	private int board_no;
	private String member_id;
	private String qna_title;
	private String qna_content;
	private String qna_regdate;
	private String qna_updatedate;
	private String qna_answer;
	private int qna_repRoot;
	private int qna_repStep;
	private int qna_repIndent;

	public QnaVO() {
	}

	public QnaVO(int qna_no, int board_no, String member_id, String qna_title, String qna_content, String qna_regdate,
			String qna_updatedate, String qna_answer, int qna_repRoot, int qna_repStep, int qna_repIndent) {
		super();
		this.qna_no = qna_no;
		this.board_no = board_no;
		this.member_id = member_id;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_regdate = qna_regdate;
		this.qna_updatedate = qna_updatedate;
		this.qna_answer = qna_answer;
		this.qna_repRoot = qna_repRoot;
		this.qna_repStep = qna_repStep;
		this.qna_repIndent = qna_repIndent;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_regdate() {
		return qna_regdate;
	}

	public void setQna_regdate(String qna_regdate) {
		this.qna_regdate = qna_regdate;
	}

	public String getQna_updatedate() {
		return qna_updatedate;
	}

	public void setQna_updatedate(String qna_updatedate) {
		this.qna_updatedate = qna_updatedate;
	}

	public String getQna_answer() {
		return qna_answer;
	}

	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}

	public int getQna_repRoot() {
		return qna_repRoot;
	}

	public void setQna_repRoot(int qna_repRoot) {
		this.qna_repRoot = qna_repRoot;
	}

	public int getQna_repStep() {
		return qna_repStep;
	}

	public void setQna_repStep(int qna_repStep) {
		this.qna_repStep = qna_repStep;
	}

	public int getQna_repIndent() {
		return qna_repIndent;
	}

	public void setQna_repIndent(int qna_repIndent) {
		this.qna_repIndent = qna_repIndent;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		QnaVO other = (QnaVO) obj;
		return board_no == other.board_no && Objects.equals(member_id, other.member_id) && qna_no == other.qna_no;
	}

	@Override
	public String toString() {
		return "QnaVO [qna_no=" + qna_no + ", board_no=" + board_no + ", member_id=" + member_id + ", qna_title="
				+ qna_title + "]";
	}

}