package heiji.labBd.Trabalho2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import heiji.labBd.Trabalho2.model.Requisissao;
import heiji.labBd.Trabalho2.service.ServiceRequisissao;

@Controller
@RequestMapping("/requisissao")
public class ControllerRequisissao {

    @Autowired
    private ServiceRequisissao serviceRequisissao;

    @GetMapping
    public String listarRequisicoes(Model model) {
        List<Requisissao> lista = serviceRequisissao.listar();
        model.addAttribute("requisissoes", lista);  // plural
        return "requisissao";
    }

    @GetMapping("/buscarTempo")
    public String buscarPorTempo(@RequestParam("tempo") int tempo, Model model) {
        List<Requisissao> requisicoes = serviceRequisissao.procuratempo(tempo);
        model.addAttribute("requisissoes", requisicoes);  // plural
        return "requisissao";
    }

    @GetMapping("/buscarUsuario")
    public String buscarPorUsuario(@RequestParam("usuario") String usuario, Model model) {
        List<Requisissao> requisicoes = serviceRequisissao.RequesisaoUsuario(usuario);
        model.addAttribute("requisissoes", requisicoes);  // plural
        return "requisissao";
    }

    @GetMapping("/editar")
    public String editar(@RequestParam("id") int id, Model model) {
        Requisissao requisicao = serviceRequisissao.getById(id);
        model.addAttribute("requisissao", requisicao);
        model.addAttribute("requisissoes", serviceRequisissao.listar());
        return "requisissao";
    }

    @PostMapping("/salvar")
    public String salvar(@ModelAttribute Requisissao requisissao) {
        serviceRequisissao.salvar(requisissao);
        return "redirect:/requisissao";  // corrigido
    }

    @GetMapping("/deletar")
    public String deletar(@RequestParam("id") int id) {
        serviceRequisissao.deletarPorId(id);
        return "redirect:/requisissao";  // corrigido
    }
}
