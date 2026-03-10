<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Metro Travel • MetroPay</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #f0f4ff 0%, #e6eeff 100%);
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            color: #1e293b;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .travel-container {
            background: white;
            width: 100%;
            max-width: 480px;
            padding: 2.8rem 2.2rem;
            border-radius: 16px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
            border: 1px solid #e0e7ff;
            text-align: center;
        }

        h2 {
            color: #1d4ed8;
            font-size: 2.1rem;
            font-weight: 700;
            margin-bottom: 2.2rem;
            letter-spacing: 0.4px;
        }

        .card-info {
            background: #f8fafc;
            border-radius: 10px;
            padding: 1.2rem;
            margin-bottom: 2rem;
            border: 1px solid #e2e8f0;
            font-size: 1.05rem;
        }

        .card-info strong {
            color: #334155;
        }

        .form-group {
            margin-bottom: 1.8rem;
            text-align: left;
        }

        label {
            display: block;
            font-weight: 600;
            color: #475569;
            margin-bottom: 8px;
            font-size: 1.05rem;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 14px 16px;
            font-size: 1.1rem;
            border: 2px solid #bfdbfe;
            border-radius: 10px;
            background: #f8fafc;
            transition: all 0.3s ease;
        }

        input[readonly] {
            background: #e2e8f0;
            color: #475569;
            cursor: not-allowed;
        }

        input:focus:not([readonly]) {
            outline: none;
            border-color: #3b82f6;
            box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.15);
            background: white;
        }

        .submit-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(90deg, #1d4ed8, #3b82f6);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 1.15rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(29, 78, 216, 0.25);
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(29, 78, 216, 0.4);
            background: linear-gradient(90deg, #1e40af, #2563eb);
        }

        .map-link {
            display: inline-block;
            margin-top: 1.8rem;
            color: #1d4ed8;
            font-weight: 600;
            text-decoration: none;
            font-size: 1.05rem;
            transition: all 0.3s ease;
        }

        .map-link:hover {
            color: #2563eb;
            text-decoration: underline;
        }

        .note {
            margin-top: 1.6rem;
            font-size: 0.95rem;
            color: #6b7280;
        }

        @media (max-width: 500px) {
            .travel-container {
                padding: 2.2rem 1.6rem;
            }
            h2 {
                font-size: 1.9rem;
            }
        }
    </style>
</head>
<body>

<div class="travel-container">
    <h2>Metro Travel</h2>

    <div class="card-info">
        <strong>Card Number:</strong> ${param.cardNumber}
    </div>

    <form action="TravelServlet" method="post">
        <input type="hidden" name="cardNumber" value="${param.cardNumber}">

        <div class="form-group">
            <label for="fare">Fare Amount (₹)</label>
            <input 
                type="number" 
                id="fare" 
                name="fare" 
                min="10" 
                step="5" 
                placeholder="Enter fare amount" 
                required 
                autofocus
            >
        </div>

        <button type="submit" class="submit-btn">Start Travel</button>
    </form>

    <a href="map.jsp" class="map-link">🗺 View Route Map</a>

    <div class="note">
        Ensure sufficient balance before starting your journey.
    </div>
</div>

</body>
</html>