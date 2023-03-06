package board;

public class Board {
	private int boardID;
	private String boardUserID;
	private String boardContent;
	private String writeDate;
	private String bbsID;
	private int boardAva;
	
	public int getBoardAva() {
		return boardAva;
	}
	public void setBoardAva(int boardAva) {
		this.boardAva = boardAva;
	}
	public int getBoardID() {
		return boardID;
	}
	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}
	public String getBoardUserID() {
		return boardUserID;
	}
	public void setBoardUserID(String boardUserID) {
		this.boardUserID = boardUserID;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getBbsID() {
		return bbsID;
	}
	public void setBbsID(String bbsID) {
		this.bbsID = bbsID;
	}
}
