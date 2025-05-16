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
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
@Table(name="pagina")
public class Pagina {
	@Id
	@Column(name = "idPagina", nullable = false)
	private int idPagina;
	@Column(name = "html", length = 50, nullable = false)
	private String html;
	@Column(name = "tipo", length = 50, nullable = false)
	private String tipo;
	@Column(name = "titulo", length = 50, nullable = false)
	private String titulo;
	@Column(name = "url", length = 50, nullable = false)
	private String url;
	@Column(name = "tamanho", nullable = false)
	private int tamanho;
}
