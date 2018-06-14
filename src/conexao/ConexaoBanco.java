package conexao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import com.mysql.jdbc.Statement;

import model.usuario;
import system.funcoes_sistema;
//conexao com o banco de dados
public class ConexaoBanco {

    private static final String USUARIO = "root";
    private static final String SENHA = "willian07";
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/willian_teste";
    private static final String DRIVER = "com.mysql.jdbc.Driver";

    // Conectar ao banco
    public static Connection abrir() throws Exception {
    	Connection conn = null;
        // Registrar o driver
    	try {
    		Class.forName(DRIVER);
            // Capturar a conexão
    		conn = DriverManager.getConnection(URL, USUARIO, SENHA);
            // Retorna a conexao aberta
		} catch (Exception e) {
			// TODO: handle exception
		}
        return conn;
    }
    
    
    //responsavel por salvar o cadastro do novo usuario
    public static boolean  Salvar( String nome,String sobrenome,String cpf,String login,String senha, double peso,double altura,String empresa_filiada,String data_inicial,String email) throws Exception{
    	boolean result = false;
    	Connection conn = ConexaoBanco.abrir();
    	try {
    	PreparedStatement stmt = null;
    	stmt = conn.prepareStatement("insert into usuario(nome,sobrenome,cpf,login,senha,peso,altura,empresa_filiada,data_inicial,email) values(?,?,?,?,?,?,?,?,?,?)");
    	stmt.setString(1,nome);
    	stmt.setString(2,sobrenome);
    	stmt.setString(3,cpf);
    	stmt.setString(4,login);
    	stmt.setString(5,senha);
    	stmt.setDouble(6,peso);
    	stmt.setDouble(7,altura);
    	stmt.setString(8,empresa_filiada);
    	stmt.setString(9,data_inicial);
    	stmt.setString(10,email);
    	stmt.executeUpdate();
    	stmt.close();
    	result = true;
    	} catch (Exception e) {
			// TODO: handle exception
		}finally {
			conn.close();
		}
		return result;
    }
    //responsavel por validader o login
    public static boolean valida(String login,String senha) throws Exception{
    	String nome = "";
    	boolean result = false;
    	String sql = "";
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select nome from usuario where login = "+"'"+login+"'"+" and senha = "+"'"+senha+"';";
    	try {
			Statement st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()) {
				result = true;
				nome = rs.getString("nome");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
    }
    
    //responsavel por validader o login_empresa
    public static boolean valida_empresa(String login,String senha) throws Exception{
    	String nome = "";
    	boolean result = false;
    	String sql = "";
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select nome from empresa where login = "+"'"+login+"'"+" and senha = "+"'"+senha+"';";
    	try {
			Statement st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()) {
				result = true;
				nome = rs.getString("nome");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
    }
    //responsavel por slavar o lembrete no banco de dados
    public static boolean cadastra_agenda(String data, String msg,String login_usuario) throws Exception {
    	boolean result = false;
    	Connection conn = ConexaoBanco.abrir();
    	String data_inicial = system.funcoes_sistema.getDateTime();
    	try {
    	PreparedStatement stmt = null;
    	stmt = conn.prepareStatement("insert into agenda(data_agenda,data_inicio,msg,login_usuario) values(?,?,?,?)");
    	stmt.setString(1,data);
    	stmt.setString(2,data_inicial);
    	stmt.setString(3,msg);
    	stmt.setString(4,login_usuario);
    	stmt.executeUpdate();
    	stmt.close();
    	result = true;
    	} catch (Exception e) {
			result = false;
		}finally {
			conn.close();
		}
		return result;
    }
    //retorna o lembrete de acordo com usuario e data
    public static String retorna_lembrete(String login) throws Exception {
    	String msg= "";
    	String sql = "";
    	String data_inicial = system.funcoes_sistema.getDateTime();
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select msg from agenda where login_usuario = "+"'"+login+"'"+" and data_agenda = "+"date_format('"+data_inicial+"','%Y-%m-%d')";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
					msg = rs.getString("msg");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return msg;
    	
    }
    
    //retorna o lembrete de acordo com usuario e data
    public static String retorna_lembrete_empresa() throws Exception {
    	String msg= "";
    	String sql = "";
    	String data_inicial = system.funcoes_sistema.getDateTime();
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select msg from lembrete_empresa where data_agenda = "+"date_format('"+data_inicial+"','%Y-%m-%d')";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
					msg = rs.getString("msg");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return msg;
    	
    }
    //retorna dados do usuario
    public static String retorna_nome(String login) throws Exception {
    	String nome = "";
    	String sql = "";
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select nome from usuario where login = "+"'"+login+"'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				nome = rs.getString("nome");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return nome;
    	
    }
  //retorna dados do usuario
    public static String retorna_sobrenome(String login) throws Exception {
    	String sobrenome = "";
    	String sql = "";
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select sobrenome from usuario where login = "+"'"+login+"'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				sobrenome = rs.getString("sobrenome");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sobrenome;
    	
    }
  //retorna dados do usuario
    public static String retorna_cpf(String login) throws Exception {
    	String cpf = "";
    	String sql = "";
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select cpf from usuario where login = "+"'"+login+"'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				
				cpf = rs.getString("cpf");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cpf;
    	
    }
  //retorna dados do usuario
    public static String retorna_senha(String login) throws Exception {
    	String senha = "";
    	String sql = "";
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select senha from usuario where login = "+"'"+login+"'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				senha = rs.getString("senha");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return senha;
    	
    }
  //retorna dados do usuario
    public static String retorna_altura(String login) throws Exception {
    	String altura = "";
    	String sql = "";
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select altura from usuario where login = "+"'"+login+"'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				altura = rs.getString("altura");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return altura;
    	
    }
    //retorna a empresa a qual o usuario e filiado
    public static String retorna_empresa_filiada(String login) throws Exception {
    	String empresa_filiada = "";
    	String sql = "";
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select empresa_filiada from usuario where login = "+"'"+login+"'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				empresa_filiada = rs.getString("empresa_filiada");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return empresa_filiada;
    	
    }
    public static String retorna_email(String login) throws Exception {
    	String email = "";
    	String sql = "";
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select email from usuario where login = "+"'"+login+"'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				email = rs.getString("email");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return email;
    	
    }
    //atualiza os dados do cliente
    public static void atualiza_usuario(String nome,String sobrenome,String cpf,String email,String empresa_filiada,String altura) throws Exception {
    	String sql = "";
    	Connection conn = ConexaoBanco.abrir();
    	try {
        	PreparedStatement stmt = null;
        	stmt = conn.prepareStatement("update usuario set nome = "+"'"+nome+"'"+" ,sobrenome = "+"'"+sobrenome+"'"+" ,cpf = "+"'"+cpf+"'"+" ,email = "+"'"+email+"'"+" ,empresa_filiada = "+"'"+empresa_filiada+"'"+", altura = "+"'"+altura+"'"+"where cpf = "+"'"+cpf+"'");
        	stmt.executeUpdate();
        	stmt.close();
        	} catch (Exception e) {
    		}finally {
    			conn.close();
    		}
    }
    // slava o historico de mediçoes do usuario
    public static void salva_historico(String peso,String login_usuario,String data_inicial) throws Exception {
    	String sql = "";
    	Connection conn = ConexaoBanco.abrir();
    	try {
        	PreparedStatement stmt = null;
        	stmt = conn.prepareStatement("insert into historico_usuario(peso,data_inicial,login_usuario) values ("+"'"+peso+"'"+",'"+data_inicial+"'"+",'"+login_usuario+"'"+")");
        	stmt.executeUpdate();
        	stmt.close();
        	} catch (Exception e) {
    		}finally {
    			conn.close();
    		}
    }
    //retorna mes
    public static Double Retorna_janeiro(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/01/31' and data_inicial > '2018/01/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //retorna mes
    public static Double Retorna_fevereiro(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/02/29' and data_inicial > '2018/02/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //retorna mes
    public static Double Retorna_marco(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/03/31' and data_inicial > '2018/03/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //retorna mes
    public static Double Retorna_abril(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/04/30' and data_inicial > '2018/04/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //retorna mes
    public static Double Retorna_maio(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/05/31' and data_inicial > '2018/05/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //retorna mes
    public static Double Retorna_junho(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/06/30' and data_inicial > '2018/06/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //retorna mes
    public static Double Retorna_julho(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/07/31' and data_inicial > '2018/07/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //retorna mes
    public static Double Retorna_agosto(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/08/31' and data_inicial > '2018/08/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //retorna mes
    public static Double Retorna_setembro(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/09/30' and data_inicial > '2018/09/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //retorna mes
    public static Double Retorna_outubro(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/10/31' and data_inicial > '2018/10/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //retorna mes
    public static Double Retorna_novembro(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/11/30' and data_inicial > '2018/11/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //retorna mes
    public static Double Retorna_dezembro(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/12/30' and data_inicial > '2018/12/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //cadastra empresa no sistema
    public static boolean cadastra_agenda_empresa(String data, String msg) throws Exception {
    	boolean result = false;
    	Connection conn = ConexaoBanco.abrir();
    	String data_inicial = system.funcoes_sistema.getDateTime();
    	try {
    	PreparedStatement stmt = null;
    	stmt = conn.prepareStatement("insert into lembrete_empresa(data_agenda,data_inical,msg) values(?,?,?)");
    	stmt.setString(1,data);
    	stmt.setString(2,data_inicial);
    	stmt.setString(3,msg);
    	stmt.executeUpdate();
    	stmt.close();
    	result = true;
    	} catch (Exception e) {
			result = false;
		}finally {
			conn.close();
		}
		return result;
    }
  //retorna mes empresa
    public static Double Retorna_janeiro_usuario(String login) throws Exception {
    	String sql = "";
    	double contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select id from usuario where empresa_filiada = "+"'"+login+"'"+" and data_inicial < '2018/01/31' and data_inicial > '2018/01/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return contagem;
    	
    }
  //retorna mes empresa
    public static Double Retorna_fevereiro_usuario(String login) throws Exception {
    	String sql = "";
    	double contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select id from usuario where empresa_filiada = "+"'"+login+"'"+" and data_inicial < '2018/02/29' and data_inicial > '2018/02/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return contagem;
    	
    }
  //retorna mes empresa
    public static Double Retorna_marco_usuario(String login) throws Exception {
    	String sql = "";
    	double contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select id from usuario where empresa_filiada = "+"'"+login+"'"+" and data_inicial < '2018/03/31' and data_inicial > '2018/03/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return contagem;
    	
    }
  //retorna mes empresa
    public static Double Retorna_abril_usuario(String login) throws Exception {
    	String sql = "";
    	double contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select id from usuario where empresa_filiada = "+"'"+login+"'"+" and data_inicial < '2018/04/30' and data_inicial > '2018/04/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return contagem;
    	
    }
  //retorna mes empresa
    public static Double Retorna_maio_usuario(String login) throws Exception {
    	
    	String sql = "";
    	double contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select id from usuario where empresa_filiada = "+"'"+login+"'"+" and data_inicial < '2018/05/31' and data_inicial > '2018/05/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return contagem;
    	
    }
  //retorna mes empresa
    public static Double Retorna_junho_usuario(String login) throws Exception {
    	String sql = "";
    	double contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select id from usuario where empresa_filiada = "+"'"+login+"'"+" and data_inicial < '2018/06/30' and data_inicial > '2018/06/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return contagem;
    	
    }
  //retorna mes empresa
    public static Double Retorna_julho_usuario(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/07/31' and data_inicial > '2018/07/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //retorna mes empresa
    public static Double Retorna_agosto_usuario(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/08/31' and data_inicial > '2018/08/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //retorna mes empresa
    public static Double Retorna_setembro_usuario(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/09/30' and data_inicial > '2018/09/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //retorna mes empresa
    public static Double Retorna_outubro_usuario(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/10/31' and data_inicial > '2018/10/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //retorna mes empresa
    public static Double Retorna_novembro_usuario(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/11/30' and data_inicial > '2018/11/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
  //retorna mes empresa
    public static Double Retorna_dezembro_usuario(String login) throws Exception {
    	Double peso = 0.0;
    	String sql = "";
    	int contagem = 0;
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select peso from historico_usuario where login_usuario = "+"'"+login+"'"+" and data_inicial < '2018/12/30' and data_inicial > '2018/12/01'";
    	try {
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				contagem += 1;
				peso += Double.parseDouble(rs.getString("peso"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return peso/contagem;
    	
    }
    
    // slava o historico de mediçoes do usuario
    public static void salva_serie(String login,String data,String serie) throws Exception {
    	String sql = "";
    	Connection conn = ConexaoBanco.abrir();
    	try {
        	PreparedStatement stmt = null;
        	stmt = conn.prepareStatement("insert into serie(login,data_agenda,serie) values ("+"'"+login+"'"+",'"+data+"'"+",'"+serie+"'"+")");
        	stmt.executeUpdate();
        	stmt.close();
        	} catch (Exception e) {
    		}finally {
    			conn.close();
    		}
    }
    
    public static String retorna_serie(String login) throws Exception{
    	String data = funcoes_sistema.getDateTime();
    	String sql = "";
    	String serie = "";
    	Connection conn = ConexaoBanco.abrir();
    	sql += "select serie from serie where login = "+"'"+login+"'"+" and data_agenda = date_format("+"'"+data+"','%Y-%m-%d')";
    	Statement st = (Statement) conn.createStatement();
    	ResultSet rs = st.executeQuery(sql);
    	while(rs.next()) {
    	serie = rs.getString("serie");
    	}
    	return serie;
    }
}