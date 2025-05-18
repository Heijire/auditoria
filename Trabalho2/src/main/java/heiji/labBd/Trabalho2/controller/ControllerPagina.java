package heiji.labBd.Trabalho2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import heiji.labBd.Trabalho2.model.Pagina;
import heiji.labBd.Trabalho2.service.ServicePagina;

@Controller
@RequestMapping("/pagina")
public class ControllerPagina {

    @Autowired
    private ServicePagina servicePagina;

    // Listar  as páginas
    @GetMapping
    public String listar(ModelMap model) {
        List<Pagina> paginas = servicePagina.listar();
        model.addAttribute("paginas", paginas);
        model.addAttribute("pagina", new Pagina());
        return "pagina";  // nome da view (jsp, thymeleaf, etc)
    }

    // Buscar páginas por URL
    @GetMapping("/buscar")
    public String buscarPorUrl(@RequestParam("url") String url, ModelMap model) {
        List<Pagina> paginas = servicePagina.listarPaginaurlASCurl(url);
        model.addAttribute("paginas", paginas);
        model.addAttribute("filtroUrl", url);
        model.addAttribute("pagina", new Pagina());
        return "pagina";
    }

    @PostMapping("/salvar")
    public String salvar(@ModelAttribute Pagina pagina, ModelMap model) {
        try {
            servicePagina.salvar(pagina);
            model.addAttribute("saida", "Página salva com sucesso!");
        } catch (Exception e) {
            model.addAttribute("erro", "Erro ao salvar: " + e.getMessage());
        }
        model.addAttribute("paginas", servicePagina.listar());
        model.addAttribute("pagina", new Pagina());
        return "pagina";
    }

    @GetMapping("/editar")
    public String editar(@RequestParam("id") int id, ModelMap model) {
        Pagina pagina = servicePagina.getById(id);
        model.addAttribute("pagina", pagina);
        model.addAttribute("paginas", servicePagina.listar());
        return "pagina";
    }

    // Deletar página
    @GetMapping("/deletar")
    public String deletar(@RequestParam("id") int id, ModelMap model) {
        try {
            servicePagina.deletarPorId(id);
            model.addAttribute("saida", "Página deletada com sucesso!");
        } catch (Exception e) {
            model.addAttribute("erro", "Erro ao deletar: " + e.getMessage());
        }
        model.addAttribute("paginas", servicePagina.listar());
        model.addAttribute("pagina", new Pagina());
        return "pagina";
    }

  //buscar por tamanho
    @GetMapping("/buscarTamanho")
    public String buscarPorTamanho(@RequestParam("tamanho") int tamanho, ModelMap model) {
        List<Pagina> paginas = servicePagina.listarPaginaTamanhoASCtamanho(tamanho);
        model.addAttribute("paginas", paginas);
        model.addAttribute("filtroTamanho", tamanho);
        model.addAttribute("pagina", new Pagina());
        return "pagina";
    }
}
