<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recharge Successful • MetroPay</title>

<style>
*{
margin:0;
padding:0;
box-sizing:border-box;
}

body{
min-height:100vh;
background:linear-gradient(135deg,#f0f4ff 0%,#e6eeff 100%);
font-family:'Segoe UI',system-ui,-apple-system,sans-serif;
color:#1e293b;
display:flex;
justify-content:center;
align-items:center;
padding:20px;
}

.success-container{
background:white;
width:100%;
max-width:520px;
padding:2.8rem 2.2rem;
border-radius:16px;
box-shadow:0 10px 40px rgba(0,0,0,0.08);
border:1px solid #e0e7ff;
text-align:center;
}

.success-icon{
font-size:4.5rem;
margin-bottom:1.2rem;
color:#059669;
}

h2{
color:#059669;
font-size:2.1rem;
font-weight:700;
margin-bottom:2rem;
}

.success-divider{
height:1px;
background:linear-gradient(to right,transparent,#a7f3d0,transparent);
margin:1.8rem 0;
}

.info-box{
background:#f0fdfa;
border:1px solid #a7f3d0;
border-radius:12px;
padding:1.6rem;
margin-bottom:2rem;
text-align:left;
}

.info-row{
display:flex;
justify-content:space-between;
padding:12px 0;
font-size:1.05rem;
border-bottom:1px solid #d1fae5;
}

.info-row:last-child{
border-bottom:none;
}

.label{
font-weight:600;
color:#065f46;
}

.value{
font-weight:700;
color:#0f766e;
}

/* BUTTON AREA */

.button-group{
display:flex;
gap:12px;
justify-content:center;
flex-wrap:wrap;
margin-top:10px;
}

.action-btn{
padding:13px 28px;
background:linear-gradient(90deg,#1d4ed8,#3b82f6);
color:white;
text-decoration:none;
font-size:1.05rem;
font-weight:600;
border-radius:10px;
transition:all 0.3s;
box-shadow:0 4px 15px rgba(29,78,216,0.25);
}

.action-btn:hover{
transform:translateY(-3px);
box-shadow:0 8px 25px rgba(29,78,216,0.4);
background:linear-gradient(90deg,#1e40af,#2563eb);
}

.note{
margin-top:1.8rem;
font-size:0.95rem;
color:#6b7280;
}

</style>
</head>

<body>

<div class="success-container">

<div class="success-icon">🎉</div>

<h2>Card Created & Recharge Successful!</h2>

<div class="success-divider"></div>

<div class="info-box">

<div class="info-row">
<span class="label">Name:</span>
<span class="value">${name}</span>
</div>

<div class="info-row">
<span class="label">Card Number:</span>
<span class="value">${cardNumber}</span>
</div>

<div class="info-row">
<span class="label">Recharge Amount:</span>
<span class="value">₹${amount}</span>
</div>

<div class="info-row">
<span class="label">Current Balance:</span>
<span class="value">₹${balance}</span>
</div>

</div>

<!-- BUTTONS -->

<div class="button-group">

<a href="travel.jsp?cardNumber=${cardNumber}" class="action-btn">
Start Travel
</a>

<a href="history.jsp?cardNumber=${cardNumber}" class="action-btn">
View History
</a>

<a href="map.jsp" class="action-btn">
Metro Map
</a>

</div>

<div class="note">
Your card is ready! Enjoy fast & safe metro travel with MetroPay.
</div>

</div>

</body>
</html>