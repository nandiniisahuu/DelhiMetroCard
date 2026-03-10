<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Delhi Metro Card</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
}

body{
font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;

/* ONLY IMAGE BACKGROUND */
background-image:url("images/metro-bg.png");
background-size:cover;
background-position:center;
background-repeat:no-repeat;

min-height:100vh;
display:flex;
justify-content:center;
align-items:center;
}

.container{
background:white;
width:100%;
max-width:480px;
border-radius:16px;
overflow:hidden;
box-shadow:0 10px 30px rgba(0,0,0,0.2);
}

.header{
background:#C8102E;
color:white;
padding:30px 25px 22px;
position:relative;
text-align:center;
}

.logo-container{
position:absolute;
top:20px;
left:25px;
}

.logo{
width:70px;
height:70px;
object-fit:contain;
border-radius:12px;
background:white;
padding:8px;
box-shadow:0 4px 12px rgba(0,0,0,0.25);
}

h2{
font-size:1.9rem;
margin-bottom:8px;
}

.subtitle{
font-size:1rem;
opacity:0.9;
}

.form-container{
padding:35px 30px;
}

.input-group{
margin-bottom:24px;
}

label{
display:block;
margin-bottom:8px;
color:#333;
font-weight:500;
}

.input-wrapper{
position:relative;
}

input[type="text"]{
width:100%;
padding:14px 18px 14px 50px;
border:2px solid #ddd;
border-radius:10px;
font-size:1rem;
}

input[type="text"]:focus{
outline:none;
border-color:#C8102E;
box-shadow:0 0 0 3px rgba(200,16,46,0.15);
}

.input-icon{
position:absolute;
left:18px;
top:50%;
transform:translateY(-50%);
color:#777;
font-size:1.2rem;
}

.submit-btn{
width:100%;
padding:16px;
background:#C8102E;
color:white;
border:none;
border-radius:10px;
font-size:1.1rem;
font-weight:600;
cursor:pointer;
margin-top:15px;
transition:0.3s;
}

.submit-btn:hover{
background:#a50d26;
}

.footer-note{
text-align:center;
margin-top:20px;
color:#666;
font-size:0.9rem;
}

</style>
</head>

<body>

<div class="container">

<div class="header">

<div class="logo-container">
<img src="images/icon.png" class="logo">
</div>

<h2>Create Metro Card</h2>
<div class="subtitle">Delhi Metro Smart Card</div>

</div>

<div class="form-container">

<form action="CreateCardServlet" method="post">

<div class="input-group">
<label>Full Name</label>
<div class="input-wrapper">
<i class="fas fa-user input-icon"></i>
<input type="text" name="name" placeholder="Enter your full name" required>
</div>
</div>

<div class="input-group">
<label>Mobile Number</label>
<div class="input-wrapper">
<i class="fas fa-phone input-icon"></i>
<input type="text" name="phone" placeholder="10-digit mobile number" required>
</div>
</div>

<button type="submit" class="submit-btn">
Create My Delhi Metro Card
</button>

</form>

<div class="footer-note">
Powered by Delhi Metro Rail Corporation
</div>

</div>

</div>

</body>
</html>