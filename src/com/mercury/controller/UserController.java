package com.mercury.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.bean.User;
import com.mercury.service.JavaMailService;
import com.mercury.service.UserService;

@Controller
@SessionAttributes
public class UserController {
	@Autowired
	@Qualifier("userService")
	private UserService us;

	@Autowired
	@Qualifier("javaMailService")
	private JavaMailService jms;

	private org.springframework.security.core.userdetails.User getLoginUser() {
		return (org.springframework.security.core.userdetails.User) SecurityContextHolder
				.getContext().getAuthentication().getPrincipal();
	}
	
	/*
	 * User Login
	 */
	@RequestMapping(value = "/home", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView homePage(HttpServletRequest request) {	
		ModelAndView mav = new ModelAndView("home");
		String status = request.getParameter("status");
		if (status != null) {
			if (status.equals("login_success")) 
				mav.addObject("success", "Welcome back " + getLoginUser().getUsername() + "!");
			else if (status.equals("login_error")) 
				mav.addObject("error", "Invalid username or password, please try again.");
		}
		return mav;
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String accountPage() {
		return "account/signup";
	}
	
	/* 
	 * Register account
	 */
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("user") User user) {
		ModelAndView mav = new ModelAndView();
		// username is existed
		if (us.checkUser(user.getUsername()) != null) {
			mav.setViewName("account/signup");  // go back to signup page
			mav.addObject("error", "Sorry, username already exists.");
			return mav;
		} else {
			// encrypt by md5
			String encryptedPassword = us.getMd5Password(user.getPassword());  
//			System.out.println("Encrypted Password: " + encryptedPassword);  /*** Testing ***/
			user.setPassword(encryptedPassword);
			// send email to user to activate the account 
			String from = "ykzhang2013@gmail.com";
			String to = user.getEmail();
			String subject = "EMC - Registration Successfully!";
			String msg = "Dear " + user.getUsername() + ",\n\n" 
					+ "Thanks for your registration! Please click the following link to activate your account.\n\n"
					+ "http://localhost:8080/EMC/activate.html?id=" + user.getUsername();
			jms.sendMail(from, to, subject, msg);  // send email first
			us.saveUser(user);  // then create this account
			mav.setViewName("home");  // go to home page
			mav.addObject("success_long", "Congratulation!  Your account is created successfully.<br/>Please check your email (" + to + ") to activate your account.");
			return mav;
		}
	}
	
	/*
	 *  Activate account
	 */
	@RequestMapping(value = "/activate", method = RequestMethod.GET)
	public ModelAndView activateAccount(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView("home");
		String[] messages = us.activateUser(id);
		mav.addObject(messages[0], messages[1]);
		return mav;
	}

	@RequestMapping(value = "/updatePassword", method = RequestMethod.GET)
	public String updatePasswordPage() {
		return "account/updatePassword";
	}
	
	/*
	 *  Update Password
	 */
	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
	public ModelAndView updatePassword(
			@RequestParam("oldPassword") String oldPassword,
			@RequestParam("newPassword") String newPassword) {
		ModelAndView mav = new ModelAndView();
		User user = us.checkUser(getLoginUser().getUsername());
		// old password is wrong
		String encryptedOldPassword = us.getMd5Password(oldPassword); 
		if (!encryptedOldPassword.equals(user.getPassword())) {
			mav.setViewName("account/updatePassword"); // go back to updatePassword page
			mav.addObject("error", "Sorry, your old password is wrong.");
		} else {
			us.updatePassword(getLoginUser().getUsername(), newPassword);
			mav.setViewName("home"); // go to home page
			mav.addObject("success", "Your password is updated successfully.");
		}
		return mav;
	}

	@RequestMapping(value = "/updateEmail", method = RequestMethod.GET)
	public String updateEmailPage() {
		return "account/updateEmail";
	}
	
	/*
	 *  Update Email
	 */
	@RequestMapping(value = "/updateEmail", method = RequestMethod.POST)
	public ModelAndView updateEmail(@RequestParam("newEmail") String newEmail) {
		ModelAndView mav = new ModelAndView("home");  // go to home page
		us.updateEmail(getLoginUser().getUsername(), newEmail);
		mav.addObject("success", "Your email is updated successfully.");
		return mav;
	}
	
	@RequestMapping(value = "/forgetPassword", method = RequestMethod.GET)
	public String showForgetPasswordPage() {
		return "account/forgetPassword";
	}
	
	/* 
	 * Forget Password
	 */
	@RequestMapping(value = "/forgetPassword", method = RequestMethod.POST)
	public ModelAndView sendEmailToForgetPassword(
			@RequestParam("username") String username,
			@RequestParam("email") String email) {
		ModelAndView mav = new ModelAndView();
		User user = us.checkUser(username);
		// username is existed
		if (user!= null) {
			// send email to user to reset password 
			String from = "mercurysystemsinc.emc@gmail.com";
			//send to the email address that user entered,not the email of the user in the DB
			String to = email;
			String subject = "EMC - Reset Password";
			String msg = "Dear "  + user.getUsername() + ",\n\n"
					+ "Please click the following link to reset your password.\n\n"
					+ "http://localhost:8080/EMC/resetPassword.html?username=" +user.getUsername();
			jms.sendMail(from, to, subject, msg);
			mav.setViewName("home");  // go to home page
			mav.addObject("success_long", "Please check your email (" + to + ") to reset your password.");
			return mav;
		} else {
			mav.setViewName("account/forgetPassword");  // go back to forgetPassword page
			mav.addObject("error", "Sorry, username does not exist.");
			return mav;
		}
	}
	
	@RequestMapping(value = "/resetPassword", method = RequestMethod.GET)
	public ModelAndView showResetPasswordPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/resetPassword");
		mav.addObject("username", request.getParameter("username"));
		return mav;
	}
	
	/*
	 *  Reset password
	 */
	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public ModelAndView resetPassword(
			@RequestParam("newPassword") String newPassword,
			@RequestParam("username") String username) {
		String encryptedPassword = us.getMd5Password(newPassword);  
		us.updatePassword(username, encryptedPassword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");  // go to home page
		mav.addObject("success", "Your password is reseted successfully.");
		return mav;
	}
}
