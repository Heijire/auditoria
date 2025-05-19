package heiji.labBd.Trabalho2.model;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.JoinColumn;
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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
    @ManyToMany
    @JoinTable(
    	    name = "pagina_link",
    	    joinColumns = @JoinColumn(name = "idPagina"),
    	    inverseJoinColumns = @JoinColumn(name = "idLink")
    	)

    private Set<Link> links = new HashSet<>();
    public int getIdPagina() {
        return idPagina;
    }
}
