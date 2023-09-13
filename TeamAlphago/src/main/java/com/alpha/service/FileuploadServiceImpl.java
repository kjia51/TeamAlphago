package com.alpha.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alpha.controller.FileuploadController;
import com.alpha.mapper.FileuploadMapper;
import com.alpha.vo.FileuploadVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FileuploadServiceImpl implements FileuploadService {

	@Autowired
	FileuploadMapper mapper;

	@Override
	public int insert(FileuploadVO vo) {
		// TODO Auto-generated method stub
		return mapper.insert(vo);
	}
	
		
	public String getContent() {
		String uploadPath = "content" + File.separator;
		log.info("경로 : " + uploadPath);
		
		File saveDir = new File(FileuploadController.ATTACHES_DIR + uploadPath);
		if(!saveDir.exists()) {
			if(saveDir.mkdirs()) {
				log.info("폴더 생성!!");
			}else {
				log.info("폴더 생성 실패!!");
			}
		}
		
		return uploadPath;
	}


	@Override
	public int fileupload(List<MultipartFile> files, String c_no) throws Exception {
		// TODO Auto-generated method stub
		int insertRes = 0;
		for(MultipartFile file : files) {
			if(file.isEmpty()) {
				continue;
			}
			log.info("=====================================");
			log.info("oFileName : "+file.getOriginalFilename());
			log.info("name : "+file.getName());
			log.info("size : "+file.getSize());
			
			try {
				/**
				 * 소프트웨어 구축에 쓰이는 식별자 표준
				 * 파일이름이 중복되어 파일이 소실되지 않도록 uuid를 붙여서 저장
				 */
				String saveFileName = c_no+file.getOriginalFilename();
				String uploadPath = getContent();
				
				File sFile = new File(FileuploadController.ATTACHES_DIR
						+uploadPath
						+saveFileName);
				
				// file(원본파일)을 sFile(저장 대상 파일)에 저장
				file.transferTo(sFile);
				
				//주어진 파일의 Mine유형
				String contentType = Files.probeContentType(sFile.toPath());
				FileuploadVO Fileuploadvo = new FileuploadVO();
				
				if(contentType.startsWith("image")) {
					Fileuploadvo.setFiletype("I");
					
				}else {
					Fileuploadvo.setFiletype("F");
				}
				
				Fileuploadvo.setC_no(c_no);
				Fileuploadvo.setUploadpath(uploadPath);
				Fileuploadvo.setFilename(file.getOriginalFilename());
				
				int res = insert(Fileuploadvo);
				
				if(res>0) {
					insertRes++;
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습니다.(IllegalStateException)");
			} catch (IOException e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습니다.(IOException)");
			} catch(Exception e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습니다.(Exception)");
			}
	}
		return insertRes;
	}
	@Override
	public int fileEdit(List<MultipartFile> files, String c_no) throws Exception {
		// TODO Auto-generated method stub
		int insertRes = 0;
		for(MultipartFile file : files) {
			if(file.isEmpty()) {
				continue;
			}
			log.info("=====================================");
			log.info("oFileName : "+file.getOriginalFilename());
			log.info("name : "+file.getName());
			log.info("size : "+file.getSize());
			
			try {
				/**
				 * 소프트웨어 구축에 쓰이는 식별자 표준
				 * 파일이름이 중복되어 파일이 소실되지 않도록 uuid를 붙여서 저장
				 */
				String saveFileName = c_no+file.getOriginalFilename();
				String uploadPath = getContent();
				
				File sFile = new File(FileuploadController.ATTACHES_DIR
						+uploadPath
						+saveFileName);
				
				// file(원본파일)을 sFile(저장 대상 파일)에 저장
				file.transferTo(sFile);
				
				//주어진 파일의 Mine유형
				String contentType = Files.probeContentType(sFile.toPath());
				FileuploadVO Fileuploadvo = mapper.selectOne(c_no);
				
				if(contentType.startsWith("image")) {
					Fileuploadvo.setFiletype("I");
					
				}else {
					Fileuploadvo.setFiletype("F");
				}
				
				Fileuploadvo.setFilename(file.getOriginalFilename());
				
				int res = update(Fileuploadvo);
				
				if(res>0) {
					insertRes++;
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습니다.(IllegalStateException)");
			} catch (IOException e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습니다.(IOException)");
			} catch(Exception e) {
				e.printStackTrace();
				throw new Exception("첨부파일 등록중 예외사항이 발생 하였습니다.(Exception)");
			}
		}
		return insertRes;
	}


	@Override
	public int update(FileuploadVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}


	@Override
	public FileuploadVO selectOne(String c_no) {
		// TODO Auto-generated method stub
		return mapper.selectOne(c_no);
	}


}
