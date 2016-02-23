package atenta.controller;

import atenta.dao.contracts.ICompraDao;
import atenta.dao.contracts.IUsuarioDao;
import atenta.model.Compra;
import atenta.util.Compras;
import atenta.model.Usuario;
import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/compra")
public class CompraController extends AbstractController{

    @Autowired
    private ICompraDao compraDao;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

    @RequestMapping(value="/lista", method = RequestMethod.GET)
    public String lista(ModelMap model){
        List<Compra> compras = compraDao.findAll();
        model.addAttribute("compras", compras);

        return "/compra/lista";
    }

    @RequestMapping(value="/listaxml", method = RequestMethod.GET,produces = "application/xml")
    @ResponseStatus(HttpStatus.OK)
    public @ResponseBody
    Compras listaXml(ModelMap model){
        List<Compra> compras = compraDao.findAll();
        Compras comprasList = new Compras();
        comprasList.setCompraList(compras);

        return comprasList;
    }

    @RequestMapping(value="/cadastro", method = RequestMethod.GET)
    public String cadastro(ModelMap model){
        model.addAttribute("compra", new Compra());

        return "/compra/cadastro";
    }

    @RequestMapping(value = "/editar/{id}")
    public String editar(@PathVariable("id") Integer id, ModelMap model) throws NotFoundException{
        Compra compra = compraDao.findById(id);

        if (compra == null){
            throw new NotFoundException("Página não encontrada!");
        }

        model.addAttribute("compra", compra);
        return "/compra/cadastro";
    }

    @RequestMapping(value = "/salva", method = RequestMethod.POST)
    public String salva(ModelMap model, @Valid @ModelAttribute("compra")Compra compra, BindingResult result, RedirectAttributes redirectAttributes, HttpServletRequest request){
        if (result.hasErrors()) {
            model.addAttribute("error", true);
            return "/compra/cadastro";
        }

        compraDao.store(compra);
        redirectAttributes.addFlashAttribute("message", "Salva com sucesso!");

        return "redirect:/compra/lista";
    }

    @RequestMapping(value = "/excluir/{id}", method = RequestMethod.GET)
    public String excluir(@PathVariable("id") Integer id, ModelMap model,RedirectAttributes redirectAttributes){
        try {
            compraDao.delete(id);
        }catch (IllegalArgumentException ex){
            redirectAttributes.addFlashAttribute("message", "O produto nao existe!");
            return "redirect:/compra/lista";
        }

        redirectAttributes.addFlashAttribute("message", "Excluida com sucesso!");
        return "redirect:/compra/lista";
    }

}
