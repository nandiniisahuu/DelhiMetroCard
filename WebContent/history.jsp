<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MetroPay • Transaction History</title>

<style>
* {
margin: 0;
padding: 0;
box-sizing: border-box;
}

body {
min-height: 100vh;
background: linear-gradient(135deg, #f0f4ff, #e6f0ff, #f8f9ff);
font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
color: #2c3e50;
display: flex;
justify-content: center;
align-items: center;
padding: 20px;
}

.history-container {
background: white;
border-radius: 16px;
border: 1px solid #e0e7ff;
box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
padding: 2.5rem 2rem;
width: 100%;
max-width: 1000px;
}

h2 {
color: #1e40af;
text-align: center;
font-size: 2.3rem;
font-weight: 700;
margin-bottom: 2rem;
}

.card-prompt {
text-align: center;
margin-bottom: 1.5rem;
color: #4b5563;
font-size: 1.1rem;
font-weight: 500;
}

.input-group {
display: flex;
justify-content: center;
gap: 12px;
flex-wrap: wrap;
margin-bottom: 2.5rem;
}

.input-group input {
padding: 14px 20px;
min-width: 360px;
max-width: 100%;
background: #f8fafc;
border: 2px solid #bfdbfe;
border-radius: 10px;
color: #1e293b;
font-size: 1.1rem;
transition: all 0.3s ease;
}

.input-group input:focus {
outline: none;
border-color: #3b82f6;
box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.15);
background: white;
}

.input-group button {
    padding: 14px 40px;
    background: #2563eb;
    color: white;
    border: none;
    border-radius: 10px;
    font-size: 1.1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3);
}

.input-group button:hover {
    background: #1d4ed8;
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(37, 99, 235, 0.4);
}

table {
width: 100%;
border-collapse: separate;
border-spacing: 0 8px;
margin-top: 1rem;
}

th, td {
padding: 14px 12px;
text-align: center;
}

th {
background: #1e40af;
color: white;
font-weight: 600;
text-transform: uppercase;
font-size: 0.95rem;
letter-spacing: 0.5px;
border-bottom: 3px solid #ef4444;
}

td {
background: #f9fafb;
border-bottom: 1px solid #e5e7eb;
color: #374151;
font-size: 1.02rem;
transition: background 0.2s;
}

tr:hover td {
background: #eff6ff;
}

.amount {
font-weight: 700;
font-size: 1.08rem;
}

.debit {
color: #dc2626;
font-weight: 600;
}

.credit {
color: #059669;
font-weight: 600;
}

.no-data {
margin: 3rem auto 1rem;
max-width: 600px;
padding: 1.8rem;
background: #fef2f2;
border: 2px dashed #fca5a5;
border-radius: 12px;
color: #991b1b;
font-size: 1.3rem;
text-align: center;
}
</style>

</head>
<body>

<div class="history-container">

<h2>MetroPay • Transaction History</h2>

<div class="card-prompt">Enter your card number to view history</div>

<form method="get" class="input-group">

<!-- ✅ AUTO CARD NUMBER INPUT -->
<input
type="text"
name="cardNumber"
placeholder="Enter your card number"
value="<%= request.getParameter("cardNumber") != null ? request.getParameter("cardNumber") : "" %>"
required
autocomplete="off"
>

<button type="submit">VIEW HISTORY</button>

</form>

<%
String cardNumber = request.getParameter("cardNumber");

if (cardNumber != null && !cardNumber.trim().isEmpty()) {

try {

Connection con = com.metro.DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM transactions WHERE card_number = ? ORDER BY date DESC"
);

ps.setString(1, cardNumber);

ResultSet rs = ps.executeQuery();

boolean hasData = false;
%>

<table>

<tr>
<th>ID</th>
<th>Amount</th>
<th>Type</th>
<th>Date & Time</th>
</tr>

<%
while (rs.next()) {

hasData = true;

String type = rs.getString("type");

boolean isDebit = type != null && type.toLowerCase().contains("debit");
%>

<tr>

<td><%= rs.getInt("id") %></td>

<td class="amount <%= isDebit ? "debit" : "credit" %>">
₹ <%= String.format("%,.2f", rs.getDouble("amount")) %>
</td>

<td class="<%= isDebit ? "debit" : "credit" %>">
<%= rs.getString("type") %>
</td>

<td>
<%= rs.getTimestamp("date") != null ? rs.getTimestamp("date") : "—" %>
</td>

</tr>

<%
}
%>

</table>

<%
if (!hasData) {
%>

<div class="no-data">
No transactions found for this card number.
</div>

<%
}

con.close();

} catch (Exception e) {
%>

<div class="no-data">
Error loading transactions. Please try again later.
</div>

<%
}

}
%>

</div>

</body>
</html>