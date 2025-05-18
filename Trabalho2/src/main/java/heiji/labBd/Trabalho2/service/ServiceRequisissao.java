package heiji.labBd.Trabalho2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import heiji.labBd.Trabalho2.model.Requisissao;
import heiji.labBd.Trabalho2.repository.RepositoryRequisissao;
@Service
public class ServiceRequisissao {
	@Autowired
	private RepositoryRequisissao repositoryRequisissao;

	public List<Requisissao> listar() {
		return repositoryRequisissao.findAll();
	}

	public void salvar(Requisissao requisissao) {
		repositoryRequisissao.save(requisissao);
	}

	public Requisissao getById(int id) {
		return repositoryRequisissao.findById(id).orElse(null);
	}

	public void deletarPorId(int id) {
		repositoryRequisissao.deleteById(id);
	}

	public List<Requisissao> RequesisaoUsuario(String usuario) {
		return repositoryRequisissao.findRequesisaoUsuario(usuario);
	}

	public List<Requisissao> procuratempo(int tempo) {
		return repositoryRequisissao.findByTempoLessThanOrderByTempoAsc(tempo);
	}
}