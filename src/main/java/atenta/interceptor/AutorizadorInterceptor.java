package atenta.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by laerteguedes on 19/02/16.
 */
public class AutorizadorInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object controller) throws Exception {
        String uri = request.getRequestURI();

        if (!uri.contains("login")){
            if (request.getSession().getAttribute("usuario") != null){
                return true;
            }

            response.sendRedirect("/login/form");
            return false;
        }

        return true;
    }
}
