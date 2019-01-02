package kr.co.mlec.upload;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
	public String upload(MultipartHttpServletRequest request) {
		List<MultipartFile> fileList = request.getFiles("file");
        String src = request.getParameter("src");
        System.out.println("src value : " + src);

        
        for (MultipartFile mf : fileList) {
        	System.out.println(mf);
        	
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

            String safeFile = upload_path + System.currentTimeMillis() + originFileName;
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        
        return "success";

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
