package model;

public class agenda {
		private String data_inicial;
		private String data_agenda;
		private String msg;
		private String login_usuario;
		
		public agenda(String data_inicial, String data_agenda, String msg, String login_usuario) {
			super();
			this.data_inicial = data_inicial;
			this.data_agenda = data_agenda;
			this.msg = msg;
			this.login_usuario = login_usuario;
		}
		public agenda() {
			super();
			// TODO Auto-generated constructor stub
		}
		public String getData_inicial() {
			return data_inicial;
		}
		public void setData_inicial(String data_inicial) {
			this.data_inicial = data_inicial;
		}
		public String getData_agenda() {
			return data_agenda;
		}
		public void setData_agenda(String data_agenda) {
			this.data_agenda = data_agenda;
		}
		public String getMsg() {
			return msg;
		}
		public void setMsg(String msg) {
			this.msg = msg;
		}
		public String getLogin_usuario() {
			return login_usuario;
		}
		public void setLogin_usuario(String login_usuario) {
			this.login_usuario = login_usuario;
		}
		
		
		
}
