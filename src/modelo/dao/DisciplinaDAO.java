package modelo.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import modelo.dominio.Disciplina;

public class DisciplinaDAO {
	
	private EntityManager manager = JPAUtil.getFabrica().createEntityManager();

	public void salvar(Disciplina disciplina)
	 {
	 this.manager.getTransaction().begin();
	 this.manager.merge(disciplina);
	 this.manager.flush();
	 this.manager.getTransaction().commit();
	 }

	public void excluir(Disciplina disciplina)
	 {
	 this.manager.getTransaction().begin();
	 this.manager.remove(disciplina);
	 this.manager.flush();
	 this.manager.getTransaction().commit(); 
	 }

	public Disciplina obter(String cod) {
		
		return this.manager.find(Disciplina.class, cod);
	}

	public List<Disciplina> lista() {
		
		String comandoJPQJ = "from Disciplina d  order by d.nome";
		
		List<Disciplina> lista;
		TypedQuery<Disciplina> query = this.manager.createQuery(comandoJPQJ, Disciplina.class);
		
		lista = query.getResultList();
		
		return lista;

	}
		
}