package heiji.labBd.Trabalho2.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import heiji.labBd.Trabalho2.model.Link;

public interface RepositoryLink extends JpaRepository<Link, Integer> {

	
	@Query(value = "Select udf_contar(:idLink)", nativeQuery = true)
	public int quantidadespaginaslink(int idLink);
	
	
	
}
