package heiji.labBd.Trabalho2.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import heiji.labBd.Trabalho2.model.Sessao;

public interface RepositorySessao extends JpaRepository<Sessao, Integer>{
	public List<Sessao> findBybuscaSesaaoASCip(String ip);

}
