package heiji.labBd.Trabalho2.model;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
@Entity
@Table(name = "link")
public class Link {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idLink", nullable = false)
	private int idLink;
	@Column(name = "destino", length = 50, nullable = false)
	private String destino;
	@Column(name = "titulo", length = 50, nullable = false)
	private String titulo;
	@Column(name = "target", length = 50, nullable = false)
	private String target;
    @ManyToMany(mappedBy = "links")
    private Set<Pagina> paginas = new HashSet<>();
    public Set<Pagina> getPaginas() {
        return paginas;
    }

    public void setPaginas(Set<Pagina> paginas) {
        this.paginas = paginas;
    }
}
