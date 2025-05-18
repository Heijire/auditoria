package heiji.labBd.Trabalho2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import heiji.labBd.Trabalho2.model.Link;
import heiji.labBd.Trabalho2.repository.RepositoryLink;
@Service
public class ServiceLink {
	@Autowired
	private RepositoryLink repositoryLink;
	
	public List<Link> listar() {
		return repositoryLink.findAll();
	}
	
	public void salvar(Link link) {
		repositoryLink.save(link);
	}

	public Link getById(int id) {
		return repositoryLink.findById(id).orElse(null);
	}

	public void deletarPorId(int id) {
		repositoryLink.deleteById(id);
	}
	public int quantidadespaginaslink(int id) {
		return repositoryLink.quantidadespaginaslink(id);
	}	
}
