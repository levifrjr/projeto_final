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
 * Servlet implementation class ServletSalvarProfessor
 */
@WebServlet("/salvarProfessor")
public class ServletSalvarProfessor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSalvarProfessor() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendError(403, "ACESSO NÃO PERMITIDO POR MÉTODO GET.");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("nome");
		String matricula = request.getParameter("matricula");
		String email = request.getParameter("email");
		String especialidade = request.getParameter("especialidade");
		
		Professor professor = new Professor(nome, matricula, email, especialidade);
		boolean dadosOK = true;
		String pagina = null;
		String mensagem = null;
		
		if ((email == null) || (email.length() < 7))
		{
			dadosOK = false;
			mensagem = "O e-mail é inválido.";
		}
		else if ((especialidade == null) || (especialidade.length() < 5))
		{
			dadosOK = false;
			mensagem = "A especialidade é inválida.";
		}
		
		if (dadosOK)
		{
			pagina = "confirmacaoProfessor.jsp";
			ProfessorDAO dao = new ProfessorDAO();
			
			dao.salvar(professor);
		}
		else
		{
			pagina = "incluirProfessor.jsp";
		}
		

		request.setAttribute("professor", professor);
		request.setAttribute("mensagem", mensagem);

		RequestDispatcher disp = request.getRequestDispatcher(pagina);

		disp.forward(request, response);

	}

}