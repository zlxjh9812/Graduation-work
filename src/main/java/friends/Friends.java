package friends;

public class Friends {
	private String userID;
	private String friendsID;
	
	
	private boolean yNn;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getFriendsID() {
		return friendsID;
	}
	public void setFriendsID(String friendsID) {
		this.friendsID = friendsID;
	}
	public boolean getyNn() {
		return yNn;
	}
	public void setyNn(boolean yNn) {
		this.yNn = yNn;
	}
}
