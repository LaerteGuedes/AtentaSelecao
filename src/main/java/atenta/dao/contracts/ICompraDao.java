package atenta.dao.contracts;

import atenta.model.Compra;
import atenta.model.Usuario;

import java.util.List;

public interface ICompraDao {

    public List<Compra> findAll();
    public Compra findById(Integer key);
    public void store(Compra compra);
    public void delete(Integer key);

}
