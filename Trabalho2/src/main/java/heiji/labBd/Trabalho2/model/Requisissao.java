package heiji.labBd.Trabalho2.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@Table(name = "requisissao")
@Inheritance(strategy = InheritanceType.JOINED)
public class Requisissao {
	@Id
	@Column(name = "idRequisissao", nullable = false)
	private int idRequisissao;
	@Column(name = "http", nullable = false)
	private int http;
	@Column(name = "tempo", nullable = false)
	private int tempo;
	@ManyToOne(targetEntity = Sessao.class, fetch = FetchType.LAZY )
	@JoinColumn(name = "idSessao", nullable =  false)
	private Sessao sessao;
	@ManyToOne(targetEntity = Pagina.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "idPagina", nullable = false)
	private Pagina pagina;
}
