package kr.co.mlec.upload;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class UploadController {

	@Resource(name = "uploadPath")
	String upload_path;

	@PostMapping("/upload")
	@ResponseBody
	public List<Object> upload(MultipartHttpServletRequest request) throws Exception{

		Iterator<String> iter = request.getFileNames();
		String fieldName = "";
		MultipartFile mfile = null;
		List<Object> resultList = new ArrayList<>();
		
		while (iter.hasNext()) { 
			fieldName = (String) iter.next(); // 내용을 가져와서
			System.out.println(fieldName);
			mfile = request.getFile(fieldName); 

			String originFileName = mfile.getOriginalFilename();
			String file_name = System.currentTimeMillis() + '_' + originFileName;
			File upload_file = new File(upload_path + file_name);
//			mfile.transferTo(upload_file);
			
			Map<String, Object> file = new HashMap<>();
			file.put("origName", originFileName);
			file.put("fileName", upload_file.getName());
			
			resultList.add(file);
		}

		return resultList;

//		String savedName = file.getOriginalFilename();
//
//        File target = new File(uploadPath, savedName);
//
//        // 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
//        // FileCopyUtils.copy(바이트배열, 파일객체)
//        FileCopyUtils.copy(file.getBytes(), target);
//
//        mav.setViewName("upload/uploadResult");
//        mav.addObject("savedName", savedName);
//
//        return mav; // uploadResult.jsp(결과화면)로 포워딩

	}

}
