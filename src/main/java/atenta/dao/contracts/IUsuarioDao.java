package atenta.dao.contracts;

import atenta.model.Usuario;

import java.util.List;

public interface IUsuarioDao {

    public List<Usuario> findAll();
    public Usuario findById(Integer key);
    public void store(Usuario usuario);
    public void delete(Integer key);
    public Usuario findByEmailAndSenha(Usuario usuario);

}
