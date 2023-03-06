package file;

public class fileDTO {
	String FileName;
	String FileRealName;
	public String getFileName() {
		return FileName;
	}
	public void setFileName(String fileName) {
		FileName = fileName;
	}
	public String getFileRealName() {
		return FileRealName;
	}
	public void setFileRealName(String fileRealName) {
		FileRealName = fileRealName;
	}
	public fileDTO(String fileName, String fileRealName) {
		super();
		FileName = fileName;
		FileRealName = fileRealName;
	}
	
	
}
