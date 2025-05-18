package heiji.labBd.Trabalho2.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import heiji.labBd.Trabalho2.model.Pagina;

public interface RepositoryPagina extends JpaRepository<Pagina, Integer>{

	public List<Pagina> findByUrlOrderByUrlAsc(String url);
	
	public List<Pagina> findByTamanhoOrderByTamanhoAsc(int tamanho);
	
}
