package atenta.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

/**
 * Created by laerteguedes on 18/02/16.
 */
@Entity
@Table(name="compra")
public class Compra{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Temporal(TemporalType.DATE)
    @NotNull
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date date;

    @NotNull
    private String mercado;

    @OneToMany(mappedBy = "compra", targetEntity = Produto.class, fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Produto> produtos;

    @ManyToOne
    @JoinColumn(name = "id_usuario")
    private Usuario usuario;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getMercado() {
        return mercado;
    }

    public void setMercado(String mercado) {
        this.mercado = mercado;
    }

    public List<Produto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<Produto> produtos) {
        this.produtos = produtos;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
}
