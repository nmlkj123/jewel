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
			// ���� ����
			String originFilename = multipartFile.getOriginalFilename();
			String extName
				= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = multipartFile.getSize();
			
			// �������� ���� �� ���� �̸�
			String saveFileName = originFilename;
			
			
			writeFile(multipartFile, saveFileName,uploadPath);
			url = uploadPath +"/"+ saveFileName;
		}
		catch (IOException e) {
			// ������� RuntimeException �� ��ӹ��� ���ܰ� ó���Ǿ�� ������
			// ���ǻ� RuntimeException�� ������.
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
	
	
	// ������ ������ write �ϴ� �޼���
	private boolean writeFile(MultipartFile multipartFile, String saveFileName,String uploadPath)	throws IOException{
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(uploadPath + "/" + saveFileName);
		fos.write(data);
		fos.close();
		
		return result;
	}

	@Override
	public String selectItemNum(Map<String, Object> map) throws Exception {
		
		return adminItemDAO.selectItemNum(map);
	}

	@Override
	public void insertOption(Map<String, Object> map) throws Exception {
		adminItemDAO.insertOption(map);
	}

	@Override
	public List<Map<String, Object>> selectOptionList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminItemDAO.selectOptionList(map);
	}

	@Override
	public void deleteOption(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminItemDAO.deleteOption(map);
	}

	@Override
	public int getOrderCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminItemDAO.getOrderCount(map);
	}

	@Override
	public int getQnACount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminItemDAO.getQnACount(map);
	}

	@Override
	public int getMemberCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminItemDAO.getMemberCount(map);
	}

	@Override
	public int getRefundCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminItemDAO.getRefundCount(map);
	}
}
