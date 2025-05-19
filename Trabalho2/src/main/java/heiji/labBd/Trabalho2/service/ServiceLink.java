package heiji.labBd.Trabalho2.service;

import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import heiji.labBd.Trabalho2.model.Link;
import heiji.labBd.Trabalho2.model.Pagina;
import heiji.labBd.Trabalho2.repository.RepositoryLink;
import heiji.labBd.Trabalho2.repository.RepositoryPagina;

@Service
public class ServiceLink {
	@Autowired
	private RepositoryLink repositoryLink;
	@Autowired
	private RepositoryPagina repositoryPagina;

	public List<Link> listar() {
		return repositoryLink.findAll();
	}

	public void salvar(Link link) {
		if (link.getPaginas()!= null && !link.getPaginas().isEmpty()) {
			List<Integer> ids = link.getPaginas().stream().map(Pagina::getIdPagina).toList();
			List<Pagina> pagina = repositoryPagina.findAllById(ids);
			link.setPaginas(new HashSet<>(pagina));
		}
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

	public List<Pagina> listarTodasPaginas() {
		return repositoryPagina.findAll();

	}

}
