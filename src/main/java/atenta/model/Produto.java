package atenta.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.Date;

/**
 * Created by laerteguedes on 18/02/16.
 */
@Entity
@Table(name="produto")
@XmlRootElement(name="produto")
public class Produto {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @NotNull
    private String nome;
    private String marca;

    @NotNull
    private double valor;

    @NotNull
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date validade;

    @NotNull
    private String tipo;
    private boolean consumido;

    @ManyToOne
    @JoinColumn(name="id_compra")
    private Compra compra;

    public Integer getId() {
        return id;
    }

    @XmlElement
    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    @XmlElement
    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getMarca() {
        return marca;
    }

    @XmlElement
    public void setMarca(String marca) {
        this.marca = marca;
    }

    public double getValor() {
        return valor;
    }

    @XmlElement
    public void setValor(double valor) {
        this.valor = valor;
    }

    public Date getValidade() {
        return validade;
    }

    public String getTipo() {
        return tipo;
    }

    @XmlElement
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    @XmlElement
    public void setValidade(Date validade) {
        this.validade = validade;
    }

    public boolean isConsumido() {
        return consumido;
    }

    @XmlElement
    public void setConsumido(boolean consumido) {
        this.consumido = consumido;
    }

    public Compra getCompra() {
        return compra;
    }

    @XmlElement
    public void setCompra(Compra compra) {
        this.compra = compra;
    }
}
