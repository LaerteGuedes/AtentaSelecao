package atenta.dao;

import atenta.dao.contracts.IUsuarioDao;
import atenta.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.*;

@Repository("usuarioDao")
public class UsuarioDao extends AbstractDao<Integer, Usuario> implements IUsuarioDao{

    @Autowired
    private EntityManagerFactory entityManagerFactory;

    public void save(Usuario usuario){
        store(usuario);
    }

    public Boolean existeLogin(Usuario usuario){
        String email = usuario.getEmail();
        String senha = usuario.getSenha();

        EntityManager manager = entityManagerFactory.createEntityManager();
        Query query = manager.createQuery("select u from Usuario u WHERE u.email = :email AND u.senha = :senha");
        query.setParameter("email", email);
        query.setParameter("senha", senha);

        try{
            Usuario usuarioLogin = (Usuario) query.getSingleResult();
        }catch (NoResultException e){
            return false;
        }

        return true;
    }
}
