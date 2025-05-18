package heiji.labBd.Trabalho2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import heiji.labBd.Trabalho2.model.Logs;
import heiji.labBd.Trabalho2.repository.RepositoryLogs;
@Service
public class ServiceLogs {

	@Autowired
	private RepositoryLogs repositoryLogs;
	public List<Logs> listar() {
		return repositoryLogs.findAll();
	}

	public List<Logs> buscarPorIp(String ip) {
		return repositoryLogs.findLogporIp(ip);
	}

	public void salvar(Logs logs) {
		repositoryLogs.save(logs);
	}

	public Logs getById(int id) {
		return repositoryLogs.findById(id).orElse(null);
	}

	public void deletarPorId(int id) {
		repositoryLogs.deleteById(id);
	}

}
