package atenta.dao;

import atenta.dao.contracts.IUsuarioDao;
import atenta.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.*;

@Repository("usuarioDao")
public class UsuarioDao extends AbstractDao<Integer, Usuario> implements IUsuarioDao{

    public void save(Usuario usuario){
        store(usuario);
    }

    public Usuario findByEmailAndSenha(Usuario usuario){
        String email = usuario.getEmail();
        String senha = usuario.getSenha();

        EntityManager manager = getEntityManager();
        Query query = manager.createNamedQuery("Usuario.findByEmailAndSenha");
        query.setParameter("email", email);
        query.setParameter("senha", senha);

        Usuario usuarioLogin = (Usuario) query.getSingleResult();
        return usuarioLogin;
    }
}
