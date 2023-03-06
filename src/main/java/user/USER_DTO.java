package user;

public class USER_DTO {
	private String userID;
	private String userPassWord;
	private String userPassWord2;
	private String profileURL;
	private String firstName;
	private String Name;
	private String userEmail;
	private String userPic;
	private String Usercalendar;
	public String getUsercalendar() {
		return Usercalendar;
	}
	public void setUsercalendar(String usercalendar) {
		Usercalendar = usercalendar;
	}
	public String getUserPic() {
		return userPic;
	}
	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}
	public String getProfileURL() {
		return profileURL;
	}
	public void setProfileURL(String profileURL) {
		this.profileURL = profileURL;
	}

	private String userEmailHash;
	private Boolean userEmailchecked;
	
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserPassWord() {
		return userPassWord;
	}
	public void setUserPassWord(String userPassWord) {
		this.userPassWord = userPassWord;
	}
	public String getUserPassWord2() {
		return userPassWord2;
	}
	public void setUserPassWord2(String userPassWord2) {
		this.userPassWord2 = userPassWord2;
	}
	
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getName() {
		return Name;
	} 
	public void setName(String name) {
		this.Name = Name;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	public String getUserEmailHash() {
		return userEmailHash;
	}
	public void setUserEmailHash(String userEmailHash) {
		this.userEmailHash = userEmailHash;
	}
	public Boolean getUserEmailchecked() {
		return userEmailchecked;
	}
	public void setUserEmailchecked(Boolean userEmailchecked) {
		this.userEmailchecked = userEmailchecked;
	}
public USER_DTO() {
		
	}
	
	public USER_DTO(String userID, String userPassWord, String firstName, String Name, String userEmail,String userPassWord2,
			String userEmailHash, Boolean userEmailchecked, String profileURL ,String Usercalendar) {
		super();
		this.userID = userID;
		this.userPassWord = userPassWord;
		this.userPassWord2 =userPassWord2;
		this.firstName = firstName;
		this.Name = Name;
		this.userEmail = userEmail;
		this.userEmailHash = userEmailHash;
		this.userEmailchecked = userEmailchecked;
		this.profileURL = profileURL;
		this.Usercalendar = Usercalendar;
	}
	
	
}
