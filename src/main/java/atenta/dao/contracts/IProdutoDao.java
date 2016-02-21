package atenta.dao.contracts;

import atenta.model.Produto;

import java.util.List;

/**
 * Created by laerteguedes on 20/02/16.
 */
public interface IProdutoDao {

    public List<Produto> findAll();
    public List<Produto> findAllNotConsumed();
    public Produto findById(Integer key);
    public void store(Produto produto);
    public void delete(Integer key);

}
