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

    public List<Produto> findAllConsumidoOrNot(Boolean consumido) {
        EntityManager manager = getEntityManager();
        Query query = manager.createNamedQuery("Produto.findAllConsumedOrNot");
        query.setParameter("consumido", consumido);

        List<Produto> result = query.getResultList();
        manager.close();
        return result;
    }

}
