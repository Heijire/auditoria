package heiji.labBd.Trabalho2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import heiji.labBd.Trabalho2.model.Sessao;
import heiji.labBd.Trabalho2.service.ServiceSessao;

@Controller
@RequestMapping("/sessao")
public class ControllerSessao {
	@Autowired
	private ServiceSessao serviceSessao;

// Listar todas as sessões
	@GetMapping
	public String listar(ModelMap model) {
		List<Sessao> sessoes = serviceSessao.listar();
		model.addAttribute("sessoes", sessoes);
		model.addAttribute("sessao", new Sessao());
		return "sessao";
	}

// Buscar sessões por IP
	@GetMapping("/buscar")
	public String buscarPorIp(@RequestParam("ip") String ip, ModelMap model) {
		List<Sessao> sessoes = serviceSessao.buscarPorIp(ip);
		model.addAttribute("sessoes", sessoes);
		model.addAttribute("filtroIp", ip);
		model.addAttribute("sessao", new Sessao());
		return "sessao";
	}

// Salvar nova sessão
	@PostMapping("/salvar")
	public String salvar(@ModelAttribute Sessao sessao, ModelMap model) {
		try {
			serviceSessao.salvar(sessao);
			model.addAttribute("saida", "Sessão salva com sucesso!");
		} catch (Exception e) {
			model.addAttribute("erro", "Erro ao salvar: " + e.getMessage());
		}
		model.addAttribute("sessoes", serviceSessao.listar());
		model.addAttribute("sessao", new Sessao());
		return "sessao";
	}

// Editar sessão
	@GetMapping("/editar")
	public String editar(@RequestParam("id") int id, ModelMap model) {
		Sessao sessao = serviceSessao.getById(id);
		model.addAttribute("sessao", sessao);
		model.addAttribute("sessoes", serviceSessao.listar());
		return "sessao";
	}

// Deletar sessão
	@GetMapping("/deletar")
	public String deletar(@RequestParam("id") int id, ModelMap model) {
		try {
			serviceSessao.deletarPorId(id);
			model.addAttribute("saida", "Sessão deletada com sucesso!");
		} catch (Exception e) {
			model.addAttribute("erro", "Erro ao deletar: " + e.getMessage());
		}
		model.addAttribute("sessoes", serviceSessao.listar());
		model.addAttribute("sessao", new Sessao());
		return "sessao";
	}
}