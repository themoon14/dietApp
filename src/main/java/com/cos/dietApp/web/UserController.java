package com.cos.dietApp.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.dietApp.domain.user.User;
import com.cos.dietApp.domain.user.UserRepository;
import com.cos.dietApp.util.MyAlgorithm;
import com.cos.dietApp.util.SHA;
import com.cos.dietApp.util.Script;
import com.cos.dietApp.web.dto.JoinReqDto;
import com.cos.dietApp.web.dto.LoginReqDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class UserController {

	private final UserRepository userRepository;
	private final HttpSession session;

	// DI
//	public UserController(UserRepository userRepository, HttpSession session) {
//		this.userRepository = userRepository;
//		this.session = session;
//	}
	
		//창래
		@GetMapping("/myBody/{id}")
		public String myBody ( @PathVariable int id) {
			// 기본은 userRepository.findById(id) -> DB에서 가져와야 함
			// 우회적으로 session value 를 가져올 수 있다
			// Validation 체크 불필요 자신의 session 만 가져오기 때문
			return "user/userBody";
		}

		@GetMapping("/")
		public String main () {
			
			return "index";
		}
		
		//용세
		//규호
	
	
	@GetMapping("/joinForm")
	public String join() {
		return "user/joinForm"; // ViewResolver
	}
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "user/loginForm"; // ViewResolver
	}
	
	@GetMapping("/loginFormTest")
	public String loginFormTest() {
		return "user/loginFormTest"; // ViewResolver
	}
	


	@PostMapping("/join")
	public @ResponseBody String join(@Valid JoinReqDto joinDto, BindingResult bindingResult) { // username= &password= &email=으로 데이터가 들어온다
		
		// 1. 유효성 검사 실패 - 자바스크립트 응답(경고창 띄우고 뒤로가기)
		if(bindingResult.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			for(FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
				System.out.println("필드 : " + error.getField());
				System.out.println("메세지 : " + error.getDefaultMessage());
			}
			return Script.back(errorMap.toString());
		}
		
		String encPassword = SHA.encrypt(joinDto.getPassword(), MyAlgorithm.SHA256);
       
		joinDto.setPassword(encPassword);		
		
		// 2. 정상 - 로그인 페이지
		// User 객체에 데이터를 넣고 User 객체로 받기
		userRepository.save(joinDto.toEntity());
		
		return Script.href("/"); //리다이렉션(http상태코드: 300)
	}
	
	
	@PostMapping("/login") 
	public @ResponseBody String login(@Valid LoginReqDto loginDto, BindingResult bindingResult) {
<<<<<<< HEAD
		
		System.out.println("에러사이즈:"+bindingResult.getFieldErrors().size());
		
		// 1. 유효성 검사 실패 - 자바스크립트 응답(경고창 띄우고 뒤로가기)
		if(bindingResult.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			for(FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
				System.out.println("필드 : " + error.getField());
				System.out.println("메세지 : " + error.getDefaultMessage());
			}
			return Script.back(errorMap.toString());
		}
		
=======
>>>>>>> 3d20e0b9729d20e11e6823cb35323bb0b44d7038
		// 1. Get username, password 
		System.out.println("==========================================");
		System.out.println(loginDto.getUsername());
		System.out.println(loginDto.getPassword());
		System.out.println("==========================================");
		
		// 2. DB -> Select
		String encPassword = SHA.encrypt(loginDto.getPassword(), MyAlgorithm.SHA256);
<<<<<<< HEAD
		
=======

>>>>>>> 3d20e0b9729d20e11e6823cb35323bb0b44d7038
		User principal = userRepository.mLogin(loginDto.getUsername(), encPassword);
		System.out.println("==========================================");
		System.out.println(principal);
		System.out.println("==========================================");

		if(principal == null) {
			System.out.println("로그인 되지 않았습니다:");
<<<<<<< HEAD
			return "redirect:/";
=======
			return "redirect:/loginForm";

>>>>>>> 3d20e0b9729d20e11e6823cb35323bb0b44d7038
		} else {
			session.setAttribute("principal", principal);
<<<<<<< HEAD
		    return "redirect:/myBody" + principal.getId();
=======
			return Script.href("/myBody/" + principal.getId() , "로그인 성공");
>>>>>>> 3d20e0b9729d20e11e6823cb35323bb0b44d7038
		}
	}
	
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원정보페이지-----------------------------
	@GetMapping("user/{username}")
	public String userInfo(@PathVariable String username) {
		// 기본은 userRepository.findById(id)로 DB에서 가져와야함
		// 편법은 세션에서 값을 가져올 수도 있다 - 인증과 권한 필요 없음
		// 세션에 있는 값을 쓸거라서 모델에 담아 갈 필요가 없다(로그인을 했다)
		
		return "user/updateForm";
	}
}


//	@GetMapping("/userupdate")
//	public String userupdate () {
//		
//		return "user/updateForm";
//	}









