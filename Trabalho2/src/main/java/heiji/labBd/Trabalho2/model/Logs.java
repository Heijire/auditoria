package heiji.labBd.Trabalho2.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Entity
@Table(name = "logs")                 
public class Logs {
	@Id
	@Column(name = "idLogs", nullable = false)
	private int idLogs;
	@Column(name = "mensagens", nullable = false)
	private String mensagens;
	
}
