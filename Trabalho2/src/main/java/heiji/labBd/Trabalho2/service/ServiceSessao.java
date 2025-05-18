package heiji.labBd.Trabalho2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import heiji.labBd.Trabalho2.model.Sessao;
import heiji.labBd.Trabalho2.repository.RepositorySessao;
@Service
public class ServiceSessao {

	@Autowired
	private RepositorySessao repositorySessao;
	public List<Sessao> listar() {
		return repositorySessao.findAll();
	}

	public List<Sessao> buscarPorIp(String ip) {
		return repositorySessao.findByIp(ip);
	}

	public void salvar(Sessao sessao) {
		repositorySessao.save(sessao);
	}

	public Sessao getById(int id) {
		return repositorySessao.findById(id).orElse(null);
	}

	public void deletarPorId(int id) {
		repositorySessao.deleteById(id);
	}

}
