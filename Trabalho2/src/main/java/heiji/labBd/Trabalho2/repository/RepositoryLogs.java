package heiji.labBd.Trabalho2.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import heiji.labBd.Trabalho2.model.Logs;

public interface RepositoryLogs extends JpaRepository<Logs, Integer> {
	@Query(value = "Select l from logs where l.sessao.ip like ?1")
	public List<Logs> findLogporIp(String ip);
}
