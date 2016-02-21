package atenta.controller;

import atenta.dao.contracts.IUsuarioDao;
import atenta.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpSession;

/**
 * Created by laerteguedes on 19/02/16.
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private IUsuarioDao usuarioDao;

    @RequestMapping(value = "/form", method = RequestMethod.GET)
    public String loginForm(){
        return "login/form";
    }

    @RequestMapping(value = "/efetua", method = RequestMethod.POST)
    public String efetuaLogin(ModelMap model, Usuario usuario, HttpSession session){
        if (usuarioDao.existeLogin(usuario)){
            session.setAttribute("usuario", usuario);
            return "redirect:/";
        }

        model.addAttribute("error", true);
        return "/login/form";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/login/form";
    }

}
