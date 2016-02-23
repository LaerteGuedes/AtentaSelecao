package atenta.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="compra")
@NamedQueries({
        @NamedQuery(name = "Compra.findAllOrderByDate", query = "select c FROM Compra c ORDER BY c.date"),

})
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Compra{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Temporal(TemporalType.DATE)
    @NotNull
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column
    private Date date;

    @NotNull
    @Column
    private String mercado;

    @OneToMany(mappedBy = "compra",targetEntity = Produto.class, fetch = FetchType.EAGER)
    @OrderBy("nome")
    @XmlElement(name="produto")
    private List<Produto> produtos;

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
}
