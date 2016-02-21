package atenta.dao.contracts;

import atenta.model.Usuario;

import java.util.List;

/**
 * Created by laerteguedes on 20/02/16.
 */
public interface IUsuarioDao {

    public List<Usuario> findAll();
    public Usuario findById(Integer key);
    public void store(Usuario usuario);
    public void delete(Integer key);
    public Boolean existeLogin(Usuario usuario);

}
