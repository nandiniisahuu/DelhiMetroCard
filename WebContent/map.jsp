<!DOCTYPE html>
<html>
<head>
<title>Metro Map</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, Helvetica, sans-serif;
        background: linear-gradient(to right, #1e3c72, #2a5298);
        text-align: center;
    }

    .container {
        background: white;
        width: 80%;
        margin: 40px auto;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 0px 20px rgba(0,0,0,0.3);
    }

    h2 {
        color: #1e3c72;
        margin-bottom: 20px;
    }

    img {
        width: 100%;
        max-width: 700px;
        border-radius: 8px;
        border: 3px solid #1e3c72;
    }

    .buttons {
        margin-top: 25px;
    }

    .buttons a {
        text-decoration: none;
        background: #1e3c72;
        color: white;
        padding: 10px 20px;
        margin: 10px;
        border-radius: 5px;
        font-weight: bold;
        transition: 0.3s;
    }

    .buttons a:hover {
        background: #2a5298;
    }
</style>

</head>
<body>

<div class="container">

<h2>Delhi Metro Map</h2>

<img src="images/metro-map.png" alt="Delhi Metro Map">

<div class="buttons">
    <a href="route.jsp">Take Ticket</a>
    <a href="travel.jsp">Travel</a>
</div>

</div>

</body>
</html>