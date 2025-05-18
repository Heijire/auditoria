package heiji.labBd.Trabalho2.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
@Table(name = "sessao")
public class Sessao {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idSessao", nullable = false)
	private int idSessao;
	@Column(name = "usuario", length = 50, nullable = false)
	private String usuario;
	@Column(name = "ip", length = 50, nullable =  false)
	private String ip;
	
}
