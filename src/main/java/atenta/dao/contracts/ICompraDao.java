package atenta.dao.contracts;

import atenta.model.Compra;
import atenta.model.Usuario;

import java.util.List;

/**
 * Created by laerteguedes on 20/02/16.
 */
public interface ICompraDao {

    public List<Compra> findAll();
    public List<Compra> findAllByUsuarioId(Usuario usuario);
    public Compra findById(Integer key);
    public void store(Compra compra);
    public void delete(Integer key);

}
