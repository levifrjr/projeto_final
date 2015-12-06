package modelo.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import modelo.dominio.Professor;

public class ProfessorDAO {

	private EntityManager manager = JPAUtil.getFabrica().createEntityManager();
	
	public void salvar(Professor professor)
	 {
	 this.manager.getTransaction().begin();
	 this.manager.merge(professor);
	 this.manager.flush();
	 this.manager.getTransaction().commit();
	 }

	public void excluir(Professor professor)
	 {
	 this.manager.getTransaction().begin();
	 this.manager.remove(professor);
	 this.manager.flush();
	 this.manager.getTransaction().commit(); 
	 }
	
	public Professor obter(String matricula) {
		
		return this.manager.find(Professor.class, matricula);
	}

	public List<Professor> listaP() {
		
		String comandoJPQJ = "from Professor p  order by p.nome";
		
		List<Professor> listaP;
		TypedQuery<Professor> query = this.manager.createQuery(comandoJPQJ, Professor.class);
		
		listaP = query.getResultList();
		
		return listaP;

	}
	
}