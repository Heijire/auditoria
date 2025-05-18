package heiji.labBd.Trabalho2.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import heiji.labBd.Trabalho2.model.Logs;

public interface RepositoryLogs extends JpaRepository<Logs, Integer> {
	@Query("SELECT l FROM Logs l WHERE l.sessao.ip LIKE :ip")
	List<Logs> findLogporIp(@Param("ip") String ip);
}
