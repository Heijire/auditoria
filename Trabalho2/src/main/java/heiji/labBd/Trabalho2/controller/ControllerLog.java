package heiji.labBd.Trabalho2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import heiji.labBd.Trabalho2.model.Logs;
import heiji.labBd.Trabalho2.service.ServiceLogs;

@Controller
@RequestMapping("/logs")
public class ControllerLog {

    @Autowired
    private ServiceLogs serviceLogs;

    @GetMapping
    public String listarLogs(Model model) {
        List<Logs> logs = serviceLogs.listar();
        model.addAttribute("logs", logs);
        return "log"; // nome da sua página JSP
    }

    @GetMapping("/buscar")
    public String buscarPorIp(@RequestParam("ip") String ip, Model model) {
        List<Logs> logs = serviceLogs.buscarPorIp(ip);
        model.addAttribute("logs", logs);
        model.addAttribute("filtroIp", ip);
        return "log";
    }

    @PostMapping("/salvar")
    public String salvarLog(@ModelAttribute Logs log) {
        serviceLogs.salvar(log);
        return "redirect:/logs";
    }

    @GetMapping("/editar")
    public String editarLog(@RequestParam("id") int id, Model model) {
        Logs log = serviceLogs.getById(id);
        model.addAttribute("log", log);
        model.addAttribute("logs", serviceLogs.listar());
        return "log";
    }

    @GetMapping("/deletar")
    public String deletarLog(@RequestParam("id") int id) {
        serviceLogs.deletarPorId(id);
        return "redirect:/logs";
    }
}
