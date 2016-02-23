package atenta.controller;

import atenta.dao.contracts.ICompraDao;
import atenta.dao.contracts.IProdutoDao;
import atenta.model.Compra;
import atenta.model.Produto;
import atenta.model.Usuario;
import atenta.util.Compras;
import atenta.util.Produtos;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/produto")
public class ProdutoController extends AbstractController{

    @Autowired
    private IProdutoDao produtoDao;

    @Autowired
    private ICompraDao compraDao;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

    @RequestMapping(value = "/lista", method = RequestMethod.GET)
    public String lista(ModelMap model, HttpServletRequest request){
        System.out.println(request.getHeader("Referer"));

        List<Produto> produtos = produtoDao.findAllConsumidoOrNot(false);

        model.addAttribute("produtos", produtos);
        model.addAttribute("listaconsumidos", false);

        return "/produto/lista";
    }

    @RequestMapping(value = "/listaconsumidos", method = RequestMethod.GET)
    public String listaconsumidos(ModelMap model){
        List<Produto> produtos = produtoDao.findAllConsumidoOrNot(true);

        model.addAttribute("produtos", produtos);
        model.addAttribute("listaconsumidos", true);
        return "/produto/lista";
    }

    @RequestMapping(value="/listaxml/{consumido}", method = RequestMethod.GET,produces = "application/xml")
    @ResponseStatus(HttpStatus.OK)
    public @ResponseBody
    Produtos listaXml(ModelMap model, @PathVariable("consumido") Boolean consumido, HttpSession session){
        List<Produto> produtos = produtoDao.findAllConsumidoOrNot(consumido);
        Produtos produtoList = new Produtos();
        produtoList.setProdutoList(produtos);

        return produtoList;
    }

    @RequestMapping(value = "/novo/{id_compra}", method = RequestMethod.GET)
    public String novo(@PathVariable("id_compra") Integer id_compra, ModelMap model, HttpServletRequest request) throws NotFoundException{
        Compra compra = compraDao.findById(id_compra);
        System.out.println(request.getHeader("Referer"));

        if (compra == null){
            throw new NotFoundException("Página não encontrada");
        }

        Produto produto = new Produto();
        model.addAttribute("tipos", getTipos());
        model.addAttribute("produto", produto);
        model.addAttribute("compra", compra);
        model.addAttribute("id_compra", id_compra);

        return "/produto/novo";
    }

    @RequestMapping(value="/novo/{id_compra}/{id}", method = RequestMethod.GET)
    public String novo(@PathVariable("id_compra") Integer id_compra, @PathVariable("id") Integer id, ModelMap model, HttpServletRequest request) throws NotFoundException{
        Compra compra = compraDao.findById(id_compra);
        Produto produto = produtoDao.findById(id);

        if (produto == null){
            throw new NotFoundException("Página não encontrada");
        }

        model.addAttribute("produto", produto);
        model.addAttribute("compra", compra);
        model.addAttribute("id_compra", id_compra);
        model.addAttribute("tipos", getTipos());

        return "/produto/novo";
    }

    @RequestMapping(value="/salva", method = RequestMethod.POST)
    public String salva(ModelMap model, @Valid @ModelAttribute("produto") Produto produto, HttpServletRequest request, BindingResult result, RedirectAttributes redirectAttributes){
        Integer id_compra = Integer.parseInt(request.getParameter("id_compra"));

        produto.setCompra(compraDao.findById(id_compra));

        produtoDao.store(produto);
        redirectAttributes.addFlashAttribute("message", "Produto salvo com sucesso!");


        return "redirect:/compra/lista";
    }

    @RequestMapping(value = "/excluir/{id}", method = RequestMethod.GET)
    public String excluir(@PathVariable("id") Integer id,ModelMap model,HttpServletRequest request, RedirectAttributes redirectAttributes){
        try{
            produtoDao.delete(id);
        }catch (Exception ex){
            redirectAttributes.addFlashAttribute("message", "O produto nao existe!");
            if (request.getHeader("Referer").indexOf("produto/lista") > 0){
                return "redirect:/produto/lista";
            }
            return "redirect:/compra/lista";
        }

        redirectAttributes.addFlashAttribute("message", "Excluida com sucesso!");
        if (request.getHeader("Referer").indexOf("produto/lista") > 0){
            return "redirect:/produto/lista";
        }
        return "redirect:/compra/lista";
    }

    @RequestMapping(value = "/consumir/{id}/{consumido}", method = RequestMethod.GET)
    public String consumir(@PathVariable("id") Integer id, @PathVariable("consumido") Boolean consumido, ModelMap model, HttpServletRequest request, RedirectAttributes redirectAttributes) throws NotFoundException{
        Produto produto = produtoDao.findById(id);

        if (produto == null){
            throw new NotFoundException("Pagina nao encontrada");
        }

        produto.setConsumido(Boolean.valueOf(consumido));
        produtoDao.store(produto);

        redirectAttributes.addFlashAttribute("message", "Alteraçao realizada com sucesso!");

        if (request.getHeader("Referer").indexOf("consumido") > 0){
            return "redirect:/produto/listaconsumidos";
        }

        if (request.getHeader("Referer").indexOf("produto/lista") > 0){
            return "redirect:/produto/lista";
        }

        return "redirect:/compra/lista";
    }


    private List getTipos(){
        List tipos = new ArrayList();
        tipos.add("Vegetais");
        tipos.add("Derivados do leite");
        tipos.add("Enlatados");
        tipos.add("Frios");
        tipos.add("Frutas");

        return tipos;
    }

}
