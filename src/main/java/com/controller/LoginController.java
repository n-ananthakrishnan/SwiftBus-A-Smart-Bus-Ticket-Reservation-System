package com.controller;

import com.model.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private UserService userService;

    @PostMapping("/authenticate")
    public ModelAndView authenticate(@RequestParam("email") String email, @RequestParam("password") String password) {
        User user = userService.login(email, password);
        if (user != null) {
            if (user.getRole() == User.Role.ADMIN) {
                return new ModelAndView("redirect:/admin/home");
            } else {
                return new ModelAndView("redirect:/user/home");
            }
        }
        return new ModelAndView("login-error");
    }
}
