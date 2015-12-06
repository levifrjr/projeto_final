package controle;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.dao.ProfessorDAO;
import modelo.dominio.Professor;

/**
 * Servlet implementation class ServletAlterarProfessor
 */
@WebServlet("/alterarProfessor")
public class ServletAlterarProfessor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAlterarProfessor() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String matricula = request.getParameter("matricula");

		ProfessorDAO dao = new ProfessorDAO();

		Professor professor = dao.obter(matricula);
		
		request.setAttribute("professor", professor);
		

		RequestDispatcher disp = request.getRequestDispatcher("incluirProfessor.jsp");
		disp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
