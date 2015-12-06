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
 * Servlet implementation class ServletSalvarDisciplina
 */
@WebServlet("/salvarDisciplina")
public class ServletSalvarDisciplina extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSalvarDisciplina() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendError(403, "QUER MOLEZA VÁ NO GOOGLE.");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("nome");
		String cod = request.getParameter("cod");
		
		Disciplina disciplina = new Disciplina(nome, cod);
		boolean dadosOK = true;
		String pagina = null;
		String mensagem = null;
		
		if (dadosOK)
		{
			pagina = "confirmacaoInclusao.jsp";
			DisciplinaDAO dao = new DisciplinaDAO();
			dao.salvar(disciplina);
		}
		else
		{
			pagina = "incluirDisciplina.jsp";
		}
		

		request.setAttribute("disciplina", disciplina);
		request.setAttribute("mensagem", mensagem);
		
		RequestDispatcher disp = request.getRequestDispatcher(pagina);
		disp.forward(request, response);

	}

}