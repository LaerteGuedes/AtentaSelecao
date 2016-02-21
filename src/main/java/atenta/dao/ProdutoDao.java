package atenta.dao;

import atenta.dao.contracts.IProdutoDao;
import atenta.model.Produto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.List;

@Repository("produtoDao")
public class ProdutoDao extends AbstractDao<Integer, Produto> implements IProdutoDao{

    @Autowired
    private EntityManagerFactory entityManagerFactory;

    public List<Produto> findAllNotConsumed() {
        EntityManager manager = entityManagerFactory.createEntityManager();
        Query query = manager.createQuery("Select p from Produto p WHERE p.consumido = :consumido");
        query.setParameter("consumido", false);
        List<Produto> result = query.getResultList();
        manager.close();
        return result;
    }

}
