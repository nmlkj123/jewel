package com.jewel.admin.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jewel.admin.dao.AdminItemDAO;


@Service("AdminItemService")



public class AdminItemServiceImpl implements AdminItemService {
	@Resource(name="AdminItemDAO")
	private AdminItemDAO adminItemDAO;

	
	@Override
	public List<Map<String, Object>> selectItemList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminItemDAO.selectItemList(map);
	}

	@Override
	public Map<String, Object> selectItemDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminItemDAO.selectItemDetail(map);
	}

	@Override
	public void insertItemWrite(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminItemDAO.insertItemWrite(map);
	}

	@Override
	public void updateItemModify(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminItemDAO.updateItemModify(map);
	}

	@Override
	public void deleteItem(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminItemDAO.deleteItem(map);
	}

	@Override
	public int getTotalList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminItemDAO.getTotalList(map);
	}
	
	
	@Override
	public String restore(MultipartFile multipartFile,String uploadPath) throws Exception {
		String url = null;
		
		try {
			// 파일 정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName
				= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = multipartFile.getSize();
			
			// 서버에서 저장 할 파일 이름
			String saveFileName = originFilename;
			
			
			writeFile(multipartFile, saveFileName,uploadPath);
			url = uploadPath +"/"+ saveFileName;
		}
		catch (IOException e) {
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();	
			throw new RuntimeException(e);
		}
		return url;
	}
	
	/*
	 * private String genSaveFileName(String extName) { String fileName = "";
	 * 
	 * Calendar calendar = Calendar.getInstance(); fileName +=
	 * calendar.get(Calendar.YEAR); fileName += calendar.get(Calendar.MONTH);
	 * fileName += calendar.get(Calendar.DATE); fileName +=
	 * calendar.get(Calendar.HOUR); fileName += calendar.get(Calendar.MINUTE);
	 * fileName += calendar.get(Calendar.SECOND); fileName +=
	 * calendar.get(Calendar.MILLISECOND); fileName += extName;
	 * 
	 * return fileName; }
	 */
	
	
	// 파일을 실제로 write 하는 메서드
	private boolean writeFile(MultipartFile multipartFile, String saveFileName,String uploadPath)	throws IOException{
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(uploadPath + "/" + saveFileName);
		fos.write(data);
		fos.close();
		
		return result;
	}
}
