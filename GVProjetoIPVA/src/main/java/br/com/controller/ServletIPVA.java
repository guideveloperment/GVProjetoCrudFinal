package br.com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import br.com.dao.VeiculoDAO;
import br.com.entidades.Veiculo;


@WebServlet("/ServletIPVA")
public class ServletIPVA extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private VeiculoDAO veiculo;
	
    public ServletIPVA() {
        super();
        this.veiculo = new VeiculoDAO();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String option = request.getParameter("option");
		if (option == null) {
			option = "";
		}

		 
		switch(option) {
			case ("inserirFormulario"):
				mostrarInsercaoCarros(request, response);
				break;
			case ("atualizarFomulario"):
				mostrarAtualizado(request, response);
				break;
			case ("atualizar"):
				 AtualizarCarros(request, response);
				break;
			case ("deletar"):
				deletarCarros(request, response);
				break;
			case ("inserir"):
				inserirCarros(request, response);
				break;
			default:
				 selecionarTodos(request, response);
		}
		
	}
	
	private void mostrarInsercaoCarros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		request.getRequestDispatcher("formularioVeiculo.jsp").forward(request, response);
	}
	
	private void mostrarAtualizado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Integer id_veiculo = Integer.parseInt(request.getParameter("id_veiculo"));
		Veiculo v = veiculo.buscarVeiculo(id_veiculo);

		request.setAttribute("veiculo", v);
		
		request.getRequestDispatcher("formularioVeiculo.jsp").forward(request, response);
	}
	
	private void inserirCarros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		String modeloBack = request.getParameter("modelo");
		Integer ano_veiculoBack = Integer.parseInt(request.getParameter("ano_veiculo"));
		

		
		if ((modeloBack != null) && (ano_veiculoBack != null)) {
			if (!modeloBack.equals("")){
				Veiculo veiculo1 = new Veiculo(modeloBack, ano_veiculoBack);
				veiculo.adicionarCarro(veiculo1);
			}
		}
		response.sendRedirect("ServletIPVA");
	}
	
	private void selecionarTodos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setAttribute("listarCarros", this.veiculo.getListCar());
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	private void deletarCarros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id_veiculoBack = request.getParameter("id_veiculo");
		
		if (id_veiculoBack != null) {
			Integer id_veiculo = Integer.parseInt(id_veiculoBack);
			this.veiculo.removerCarro(id_veiculo);
		}
		response.sendRedirect("ServletIPVA");
	}
	
	private void AtualizarCarros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String modeloBack = request.getParameter("modelo");
		String ano_veiculoBack = request.getParameter("ano_veiculo");
		String id_veiculoBack = request.getParameter("id_veiculo");
		
		if ((modeloBack != null) && (ano_veiculoBack != null) && (id_veiculoBack != null)) {
			if (!modeloBack.equals("")){
				Integer ano_veiculo = Integer.parseInt(ano_veiculoBack);
				Integer id_veiculo = Integer.parseInt(id_veiculoBack);
				Veiculo veiculo1 = new Veiculo(modeloBack, ano_veiculo); 
				veiculo1.setId_veiculo(id_veiculo);
				this.veiculo.atualizarCarro(veiculo1);
			}
		}
		response.sendRedirect("ServletIPVA");
	}
}
