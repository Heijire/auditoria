package heiji.labBd.Trabalho2.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import heiji.labBd.Trabalho2.model.Pagina;

public interface RepositoryPagina extends JpaRepository<Pagina, Integer>{

	String buscarPaginaURL(String url);
	List<Pagina>buscarPaginaTamanho(int tamanho);
	
}
