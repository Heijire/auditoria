package heiji.labBd.Trabalho2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import heiji.labBd.Trabalho2.model.Pagina;
import heiji.labBd.Trabalho2.repository.RepositoryPagina;
@Service
public class ServicePagina {

	
	@Autowired
	private RepositoryPagina repositoryPagina;
	
	public List<Pagina> listar() {
		return repositoryPagina.findAll();
	}
	
	public void salvar(Pagina pagina) {
		repositoryPagina.save(pagina);
	}

	public Pagina getById(int id) {
		return repositoryPagina.findById(id).orElse(null);
	}

	public void deletarPorId(int id) {
		repositoryPagina.deleteById(id);
	}
	public List<Pagina> listarPaginaurlASCurl(String url) {
		return repositoryPagina.findByUrlOrderByUrlAsc(url);
	}
	public List<Pagina> listarPaginaTamanhoASCtamanho(int tamanho) {
		return repositoryPagina.findByTamanhoOrderByTamanhoAsc(tamanho);
	}


}
