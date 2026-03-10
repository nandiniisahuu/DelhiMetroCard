<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Successful • MetroPay</title>
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

        .success-container {
            background: white;
            width: 100%;
            max-width: 500px;
            padding: 2.8rem 2.2rem;
            border-radius: 16px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
            border: 1px solid #e0e7ff;
            text-align: center;
        }

        .success-icon {
            font-size: 4.2rem;
            margin-bottom: 1.2rem;
            color: #059669;
        }

        h2 {
            color: #059669;
            font-size: 2.1rem;
            font-weight: 700;
            margin-bottom: 2rem;
            letter-spacing: 0.4px;
        }

        .details {
            background: #f0fdfa;
            border: 1px solid #a7f3d0;
            border-radius: 12px;
            padding: 1.6rem;
            margin-bottom: 2.2rem;
            text-align: left;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            font-size: 1.05rem;
            border-bottom: 1px solid #d1fae5;
        }

        .detail-row:last-child {
            border-bottom: none;
        }

        .label {
            font-weight: 600;
            color: #065f46;
        }

        .value {
            font-weight: 700;
            color: #0f766e;
        }

        .balance-row {
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 2px dashed #a7f3d0;
            font-size: 1.2rem;
        }

        .balance-row .label {
            color: #1e293b;
        }

        .balance-row .value {
            color: #1d4ed8;
            font-size: 1.35rem;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 1.2rem;
            flex-wrap: wrap;
            margin-top: 1.8rem;
        }

        .btn {
            display: inline-block;
            padding: 12px 32px;
            background: linear-gradient(90deg, #1d4ed8, #3b82f6);
            color: white;
            text-decoration: none;
            font-size: 1.05rem;
            font-weight: 600;
            border-radius: 12px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(29, 78, 216, 0.2);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(29, 78, 216, 0.35);
            background: linear-gradient(90deg, #1e40af, #2563eb);
        }

        .btn.secondary {
            background: linear-gradient(90deg, #6b7280, #9ca3af);
            box-shadow: 0 4px 12px rgba(107, 114, 128, 0.2);
        }

        .btn.secondary:hover {
            background: linear-gradient(90deg, #4b5563, #6b7280);
            box-shadow: 0 8px 20px rgba(107, 114, 128, 0.35);
        }

        .note {
            margin-top: 2rem;
            font-size: 0.95rem;
            color: #6b7280;
        }

        @media (max-width: 520px) {
            .success-container {
                padding: 2.2rem 1.6rem;
            }
            h2 {
                font-size: 1.9rem;
            }
            .success-icon {
                font-size: 3.5rem;
            }
            .buttons {
                flex-direction: column;
                gap: 1rem;
            }
            .btn {
                width: 100%;
                max-width: 320px;
                margin: 0 auto;
            }
        }
    </style>
</head>
<body>

<div class="success-container">
    <div class="success-icon">🚆</div>
    
    <h2>Travel Successful!</h2>

    <div class="details">
        <div class="detail-row">
            <span class="label">Name:</span>
            <span class="value">${name}</span>
        </div>
        <div class="detail-row">
            <span class="label">Fare Deducted:</span>
            <span class="value">₹${fare}</span>
        </div>
        <div class="detail-row balance-row">
            <span class="label">Remaining Balance:</span>
            <span class="value">₹${balance}</span>
        </div>
    </div>

    <div class="buttons">
        <a href="route.jsp" class="btn">Take Ticket</a>
        <a href="history.jsp" class="btn secondary">View History</a>
    </div>

    <div class="note">
        Thank you for travelling with Delhi Metro!<br>
        Safe journeys ahead 🚇
    </div>
</div>

</body>
</html>