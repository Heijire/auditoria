package heiji.labBd.Trabalho2.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import heiji.labBd.Trabalho2.model.Sessao;
import heiji.labBd.Trabalho2.service.SessaoService;

@Controller
@RequestMapping("/sessao")
public class ControllerSessao {
	private final SessaoService sessaoService;

	public ControllerSessao(SessaoService sessaoService) {
	    this.sessaoService = sessaoService;
	}

// Listar todas as sessões
	@GetMapping
	public String listar(ModelMap model) {
		List<Sessao> sessoes = sessaoService.listar();
		model.addAttribute("sessoes", sessoes);
		model.addAttribute("sessao", new Sessao());
		return "sessao";
	}

// Buscar sessões por IP
	@GetMapping("/buscar")
	public String buscarPorIp(@RequestParam("ip") String ip, ModelMap model) {
		List<Sessao> sessoes = sessaoService.buscarPorIp(ip);
		model.addAttribute("sessoes", sessoes);
		model.addAttribute("filtroIp", ip);
		model.addAttribute("sessao", new Sessao());
		return "sessao";
	}

// Salvar nova sessão
	@PostMapping("/salvar")
	public String salvar(@ModelAttribute Sessao sessao, ModelMap model) {
		try {
			sessaoService.salvar(sessao);
			model.addAttribute("saida", "Sessão salva com sucesso!");
		} catch (Exception e) {
			model.addAttribute("erro", "Erro ao salvar: " + e.getMessage());
		}
		model.addAttribute("sessoes", sessaoService.listar());
		model.addAttribute("sessao", new Sessao());
		return "sessao";
	}

// Editar sessão
	@GetMapping("/editar")
	public String editar(@RequestParam("id") int id, ModelMap model) {
		Sessao sessao = sessaoService.getById(id);
		model.addAttribute("sessao", sessao);
		model.addAttribute("sessoes", sessaoService.listar());
		return "sessao";
	}

// Deletar sessão
@GetMapping("/deletar")
public String deletar(@RequestParam("id") int id, ModelMap model) {
    try {
        sessaoService.deletarPorId(id);
        model.addAttribute("saida", "Sessão deletada com sucesso!");
    } catch (Exception e) {
        model.addAttribute("erro", "Erro ao deletar: " + e.getMessage());
    }
    model.addAttribute("sessoes", sessaoService.listar());
    model.addAttribute("sessao", new Sessao());
    return "sessao";
}
