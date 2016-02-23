package atenta.dao;

import atenta.dao.contracts.ICompraDao;
import atenta.model.Compra;
import atenta.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by laerteguedes on 18/02/16.
 */
@Repository("compraDao")
public class CompraDao extends AbstractDao<Integer, Compra> implements ICompraDao {

}
