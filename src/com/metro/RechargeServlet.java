package com.metro;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RechargeServlet")
public class RechargeServlet extends HttpServlet {

protected void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException{

String cardNumber = request.getParameter("cardNumber");
double amount = Double.parseDouble(request.getParameter("amount"));

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"update metro_card set balance = balance + ? where card_number=?");

ps.setDouble(1,amount);
ps.setString(2,cardNumber);

ps.executeUpdate();


PreparedStatement ps2 = con.prepareStatement(
"insert into transactions(card_number,amount,type) values(?,?,?)");

ps2.setString(1,cardNumber);
ps2.setDouble(2,amount);
ps2.setString(3,"Recharge");

ps2.executeUpdate();


PreparedStatement ps3 = con.prepareStatement(
"select name,balance from metro_card where card_number=?");

ps3.setString(1,cardNumber);

ResultSet rs = ps3.executeQuery();

String name="";
double balance=0;

if(rs.next()){
name = rs.getString("name");
balance = rs.getDouble("balance");
}

request.setAttribute("name",name);
request.setAttribute("cardNumber",cardNumber);
request.setAttribute("amount",amount);
request.setAttribute("balance",balance);

RequestDispatcher rd = request.getRequestDispatcher("rechargeSuccess.jsp");
rd.forward(request,response);

}
catch(Exception e){
e.printStackTrace();
}

}
}