package com.kh.zipdream.attachment.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
 

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Attachment {
	
	private int attachmentNo;	//	ATTACHMENT_NO int AI PK 
	private int refUno;			//	REF_ANO int 
	private int refSno; 		//	REF_SNO int 
	private String originFile;	//	ORIGIN_FILE varchar(100) 
	private String changeName;	//	CHANGE_NAME varchar(100) 
	private String filePath;	//	FILE_PATH varchar(100)
	private int fileLevel;

}
