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

@WebServlet("/TravelServlet")
public class TravelServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cardNumber = request.getParameter("cardNumber");
        double fare = Double.parseDouble(request.getParameter("fare"));

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE metro_card SET balance = balance - ? WHERE card_number = ? AND balance >= ?"
            );

            ps.setDouble(1, fare);
            ps.setString(2, cardNumber);
            ps.setDouble(3, fare);

            int i = ps.executeUpdate();

            if (i > 0) {

                PreparedStatement ps2 = con.prepareStatement(
                        "SELECT name, balance FROM metro_card WHERE card_number=?");
                ps2.setString(1, cardNumber);
                ResultSet rs = ps2.executeQuery();

                String name = "";
                double balance = 0;

                if (rs.next()) {
                    name = rs.getString("name");
                    balance = rs.getDouble("balance");
                }

                request.setAttribute("name", name);
                request.setAttribute("fare", fare);
                request.setAttribute("balance", balance);

                RequestDispatcher rd = request.getRequestDispatcher("travelSuccess.jsp");
                rd.forward(request, response);

            } else {
                response.getWriter().println("Insufficient Balance");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}