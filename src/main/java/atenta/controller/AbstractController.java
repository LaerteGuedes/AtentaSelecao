package atenta.controller;

import javassist.NotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by laerteguedes on 21/02/16.
 */
public abstract class AbstractController {

    @ResponseStatus(value = HttpStatus.NOT_FOUND)
    @ExceptionHandler(NotFoundException.class)
    public ModelAndView handleNotFoundError(){
        ModelAndView mav = new ModelAndView("/erro/notfound");
        return mav;
    }
}
