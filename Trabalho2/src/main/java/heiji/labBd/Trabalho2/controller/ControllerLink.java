package heiji.labBd.Trabalho2.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import heiji.labBd.Trabalho2.model.Link;
import heiji.labBd.Trabalho2.service.ServiceLink;

@Controller
@RequestMapping("/link")
public class ControllerLink {

    @Autowired
    private ServiceLink serviceLink;


    @GetMapping
    public String listar(ModelMap model) {
        List<Link> links = serviceLink.listar();
        model.addAttribute("links", links);
        model.addAttribute("link", new Link());
        model.addAttribute("todasPaginas", serviceLink.listarTodasPaginas());
        return "link";
    }   
    
    @PostMapping("/salvar")
    public String salvar(@ModelAttribute Link link, ModelMap model) {
        try {
            serviceLink.salvar(link);
            model.addAttribute("saida", "Link salvo com sucesso!");
        } catch (Exception e) {
            model.addAttribute("erro", "Erro ao salvar: " + e.getMessage());
        }
        model.addAttribute("links", serviceLink.listar());
        model.addAttribute("link", new Link());
        model.addAttribute("todasPaginas", serviceLink.listarTodasPaginas());
        return "link";
    }

    @GetMapping("/editar")
    public String editar(@RequestParam("id") int id, ModelMap model) {
        Link link = serviceLink.getById(id);
        if (link == null) {
            model.addAttribute("erro", "Link não encontrado.");
            return listar(model);
        }
        model.addAttribute("link", link);
        model.addAttribute("links", serviceLink.listar());
        model.addAttribute("todasPaginas", serviceLink.listarTodasPaginas());

        String paginasAsString = link.getPaginas().stream()
            .map(p -> String.valueOf(p.getIdPagina()))
            .collect(Collectors.joining(","));
        model.addAttribute("paginasAsString", paginasAsString);

        return "link";
    }
    @GetMapping("/deletar")
    public String deletar(@RequestParam("id") int id, ModelMap model) {
        try {
            serviceLink.deletarPorId(id);
            model.addAttribute("saida", "Link deletado com sucesso!");
        } catch (Exception e) {
            model.addAttribute("erro", "Erro ao deletar: " + e.getMessage());
        }
        model.addAttribute("links", serviceLink.listar());
        model.addAttribute("link", new Link());
        model.addAttribute("todasPaginas", serviceLink.listarTodasPaginas());
        return "link";
    }

    @GetMapping("/quantidade")
    public String quantidade(@RequestParam("id") int id, ModelMap model) {
        int quantidade = serviceLink.quantidadespaginaslink(id);
        model.addAttribute("quantidade", quantidade);
        model.addAttribute("links", serviceLink.listar());
        model.addAttribute("link", new Link());
        model.addAttribute("todasPaginas", serviceLink.listarTodasPaginas());
        return "link";
    }
}

