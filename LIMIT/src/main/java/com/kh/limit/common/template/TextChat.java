package com.kh.limit.common.template;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

import org.apache.commons.io.FilenameUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.kh.limit.common.model.vo.Chat;


public class TextChat {
	public static String dirPath = "C:\\final-project\\LIMIT\\src\\main\\webapp\\resources\\chatList\\"; 
	
	public static ArrayList<Chat> readChat(String url, String userId) {
		//메모장에 있는 모든 text를 불러오는 메소드
		ArrayList<Chat> textList = new ArrayList<Chat>();
		String lastMsgWriter="";
		System.out.println(url);
		Scanner scanner = null;
		try {
			scanner = new Scanner(new File(url));
			String lastReadStatus = "";
			while(scanner.hasNextLine()) {
				JSONParser parser = new JSONParser();				
				JSONObject jsonObj = (JSONObject) parser.parse(scanner.nextLine());
				String date = (String)jsonObj.get("date"); 
				String text = (String)jsonObj.get("text");
				String msgWriter = (String)jsonObj.get("msgWriter");
				lastReadStatus = (String)jsonObj.get("readStatus");
				lastMsgWriter = msgWriter;
				textList.add(new Chat(text, date, msgWriter));
				
//				textList.add(new Chat(scanner.nextLine(), "test"));
				
			} 
			scanner.close();
			System.out.println("마지막 행의 user ID : " +lastMsgWriter);
			System.out.println("userId : " + userId);
			System.out.println("마지막 행의 readStatus : " + lastReadStatus);
			if(!lastMsgWriter.equals(userId) && lastReadStatus.equals("N")) {
				//마지막행 
				scanner = new Scanner(new File(url));
				File originFile = new File(url);
				
				
				String newFileName = url.substring(0, url.lastIndexOf('.')) + "_temp" + ".txt";
				System.out.println("newFileName : " + newFileName);

				File newFile = new File(newFileName);
				BufferedWriter fw = new BufferedWriter(new FileWriter(newFileName, true));
				String regex = "\"readStatus\":\"N\"";
				String replacement = "\"readStatus\":\"Y\"";
				while(scanner.hasNextLine()) {															
					fw.write(scanner.nextLine().replaceAll(regex, replacement) + "\r\n");
					fw.flush();
				}
				fw.close();
				scanner.close();
				originFile.delete();	            				
				newFile.renameTo(new File(url));
			}			
		} catch (FileNotFoundException e) {
			e.printStackTrace();		
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return textList;
	}
	public static String[] searchChat(String userId) {
		//chat 을 찾아주는 메소드
		File searchPath = new File(dirPath);
				
		FilenameFilter filter = new FilenameFilter() {
			public boolean accept(File file, String name) {								
				String[] names = FilenameUtils.getBaseName(name).split("_");				
				if(names[0].equals(userId)) {
					return true;
				}else if(names[1].equals(userId)){
					return true;
				}
				return false;
			}
		};		
		
		String files[] = searchPath.list(filter);
		if(files.length > 0) {
			return files;
		}
		
			
		return null;
	}
	public static String[] filesToUsers(String[] files,String userId){
		//file 이름을 to user의 이름으로 바꿔주는 메소드
		String toUsers[] = new String[files.length];
		int index = 0;
		for(String s : files) {
			String[] names = FilenameUtils.getBaseName(s).split("_");
			if(names[0].equals(userId)) {
				toUsers[index] = names[1];
			}else {
				toUsers[index] = names[0];
			}
			index++;
		}
		return toUsers;
	}
	public static String searchChat(String userId, String userId2) {
		//현재 원하는 하나의 채팅 텍스트를 찾아줌
		File searchPath = new File(dirPath);
		System.out.println(userId + "  " + userId2);
		FilenameFilter filter = new FilenameFilter() {
			public boolean accept(File file, String name) {
				return name.equals(userId + "_" + userId2 + ".txt");
			}
		};
		FilenameFilter filter2 = new FilenameFilter() {
			public boolean accept(File file, String name) {
				return name.equals(userId2 + "_" + userId + ".txt");
			}
		};
		
		File files[] = searchPath.listFiles(filter);
		if(files.length > 0) {
			return dirPath + userId + "_" + userId2 + ".txt";
		}
		
		File files2[] = searchPath.listFiles(filter2);
		
		if(files2.length > 0) {
			return dirPath + userId2 + "_" + userId + ".txt";
		}		
		return null;
	}
	public static boolean chatFileInsert(String fileName, String text) {
		//text에 값 넣기
		
		try {			
			if(text != null) {
				BufferedWriter fw = new BufferedWriter(new FileWriter(fileName, true));
				fw.write(text+"\r\n");
//				fw.newLine();
				fw.flush();
				fw.close();	
			}else {
				BufferedWriter fw = new BufferedWriter(new FileWriter(dirPath + fileName, true));
				fw.close();
			}
//			else {
//				File file = new File(dirPath + fileName);
//				FileOutputStream fileOutputStream = new FileOutputStream(file, true);
//			}
								
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}				
		return true;
	}
	
	public static ArrayList<String> chatLastLine(String files[]) {
		
		ArrayList<String> lastTextList = new ArrayList<String>();
		Scanner scanner = null;
		try {			
			for(String s : files) {
				scanner = new Scanner(new File(dirPath + s));
				String lastLine = "";
				
				while(scanner.hasNextLine()) {
					JSONParser parser = new JSONParser();				
					JSONObject jsonObj = (JSONObject) parser.parse(scanner.nextLine());					 
					lastLine = (String)jsonObj.get("text");															
	//				textList.add(new Chat(scanner.nextLine(), "test"));				
				}				
				if(!lastLine.equals("")) {
					lastTextList.add(lastLine);
				}else {
					lastTextList.add("대화한 내역이 없습니다.");
				}
			}				
		} catch (FileNotFoundException e) {
			e.printStackTrace();		
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		if(scanner != null) scanner.close();
		
		return lastTextList;
	}
	
	
	
	public static ArrayList<String> chatLastDate(String files[]) {
		
		ArrayList<String> lastDateList = new ArrayList<String>();
		Scanner scanner = null;
		try {			
			for(String s : files) {
				scanner = new Scanner(new File(dirPath + s));
				String lastLine = "";
				
				while(scanner.hasNextLine()) {
					JSONParser parser = new JSONParser();				
					JSONObject jsonObj = (JSONObject) parser.parse(scanner.nextLine());					 
					lastLine = (String)jsonObj.get("date");										
					//				textList.add(new Chat(scanner.nextLine(), "test"));				
				}				
				if(!lastLine.equals("")) {
					lastDateList.add(lastLine);
				}else {
					lastDateList.add("대화한 내역이 없습니다.");
				}
			}				
		} catch (FileNotFoundException e) {
			e.printStackTrace();		
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		if(scanner != null) scanner.close();
		
		return lastDateList;
	}
	
	public static ArrayList<String> chatLastReadStatus(String files[]) {
		
		ArrayList<String> lastReadStatus = new ArrayList<String>();
		Scanner scanner = null;
		try {			
			for(String s : files) {
				scanner = new Scanner(new File(dirPath + s));
				String readStatus = "";
				
				while(scanner.hasNextLine()) {
					JSONParser parser = new JSONParser();				
					JSONObject jsonObj = (JSONObject) parser.parse(scanner.nextLine());					 
					readStatus = (String)jsonObj.get("readStatus");										
					//				textList.add(new Chat(scanner.nextLine(), "test"));				
				}				
				if(!readStatus.equals("")) {
					lastReadStatus.add(readStatus);
				}else {
					lastReadStatus.add("대화한 내역이 없습니다.");
				}
			}				
		} catch (FileNotFoundException e) {
			e.printStackTrace();		
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		if(scanner != null) scanner.close();
		
		return lastReadStatus;
	}
	public static ArrayList<String> chatLastLineWrtier(String files[]) {
		
		ArrayList<String> lastWriter = new ArrayList<String>();
		Scanner scanner = null;
		try {			
			for(String s : files) {
				scanner = new Scanner(new File(dirPath + s));
				String msgWriter = "";
				
				while(scanner.hasNextLine()) {
					JSONParser parser = new JSONParser();				
					JSONObject jsonObj = (JSONObject) parser.parse(scanner.nextLine());					 
					msgWriter = (String)jsonObj.get("msgWriter");										
					//				textList.add(new Chat(scanner.nextLine(), "test"));				
				}				
				if(!msgWriter.equals("")) {
					lastWriter.add(msgWriter);
				}else {
					lastWriter.add("");
				}
			}				
		} catch (FileNotFoundException e) {
			e.printStackTrace();		
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		if(scanner != null) scanner.close();
		
		return lastWriter;
	}
	
}
