package heiji.labBd.Trabalho2.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idLogs", nullable = false)
	private int idLogs;
	@Column(name = "mensagens", length = 100 ,nullable = false)
	private String mensagens;
	@ManyToOne(targetEntity = Sessao.class, fetch = FetchType.LAZY)
	@JoinColumn(name =  "idSessao", nullable = false)
	private Sessao sessao;
}
