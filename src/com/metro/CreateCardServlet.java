package com.metro;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CreateCardServlet")
public class CreateCardServlet extends HttpServlet {

protected void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException{

String name = request.getParameter("name");
String phone = request.getParameter("phone");

String cardNumber = "DMRC" + UUID.randomUUID().toString().substring(0,6);

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"insert into metro_card(name,phone,card_number,balance) values(?,?,?,?)");

ps.setString(1,name);
ps.setString(2,phone);
ps.setString(3,cardNumber);
ps.setDouble(4,0);

ps.executeUpdate();

request.setAttribute("name",name);
request.setAttribute("cardNumber",cardNumber);

RequestDispatcher rd = request.getRequestDispatcher("recharge.jsp");
rd.forward(request,response);

}
catch(Exception e){
e.printStackTrace();
}

}
}