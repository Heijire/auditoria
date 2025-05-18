package heiji.labBd.Trabalho2.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import heiji.labBd.Trabalho2.model.Requisissao;

public interface RepositoryRequisissao extends JpaRepository<Requisissao, Integer> {

	@Query(value = "Select r from Requisissao WHERE r.sessao.usuario Like ?1")
	public List<Requisissao> findRequesisaoUsuario(String usuario);

	public List<Requisissao> findByTempoLessThanOrderByTempoAsc(int tempo);

}
