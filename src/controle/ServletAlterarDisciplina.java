package controle;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.dao.DisciplinaDAO;
import modelo.dominio.Disciplina;

/**
 * Servlet implementation class ServletAlterarDisciplina
 */
@WebServlet("/alterarDisciplina")
public class ServletAlterarDisciplina extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAlterarDisciplina() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cod = request.getParameter("cod");
		DisciplinaDAO dao = new DisciplinaDAO();
		Disciplina disciplina = dao.obter(cod);
		dao.salvar(disciplina);

		request.setAttribute("disciplina", disciplina);

		RequestDispatcher disp = request.getRequestDispatcher("incluirDisciplina.jsp");
		disp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}