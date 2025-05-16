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
@ToString
@NoArgsConstructor
@Entity
@Table(name = "link")
public class Link {
	@Id
	@Column(name = "idLink", nullable = false)
	private int idlink;
	@Column(name = "destino", length = 50, nullable = false)
	private String destino;
	@Column(name = "titulo", length = 50, nullable = false)
	private String titulo;
	@Column(name = "target", length = 50, nullable = false)
	private String target;
}
