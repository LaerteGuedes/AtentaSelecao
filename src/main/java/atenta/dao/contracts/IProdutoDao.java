package atenta.dao.contracts;

import atenta.model.Produto;
import atenta.model.Usuario;

import java.util.List;

public interface IProdutoDao {

    public List<Produto> findAll();
    public Produto findById(Integer key);
    public List<Produto> findAllConsumidoOrNot(Boolean consumido);
    public void store(Produto produto);
    public void delete(Integer key);

}
