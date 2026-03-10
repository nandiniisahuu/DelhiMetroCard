<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Receipt • MetroPay</title>
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

        .receipt-container {
            background: white;
            width: 100%;
            max-width: 480px;
            padding: 2.8rem 2.2rem;
            border-radius: 16px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
            border: 1px solid #e0e7ff;
            text-align: center;
        }

        .header {
            margin-bottom: 2rem;
        }

        h2 {
            color: #1d4ed8;
            font-size: 2.1rem;
            font-weight: 700;
            letter-spacing: 0.5px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }

        .emoji {
            font-size: 2.4rem;
        }

        .divider {
            height: 1px;
            background: linear-gradient(to right, transparent, #bfdbfe, transparent);
            margin: 1.8rem 0;
        }

        .details {
            text-align: left;
            font-size: 1.05rem;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px 0;
            border-bottom: 1px solid #e5e7eb;
        }

        .detail-row:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }

        .label {
            font-weight: 600;
            color: #475569;
        }

        .value {
            font-weight: 700;
            color: #1e293b;
        }

        .fare-row {
            margin-top: 1.2rem;
            padding: 16px;
            background: linear-gradient(90deg, #ecfdf5, #f0fdfa);
            border-radius: 10px;
            border: 1px solid #a7f3d0;
        }

        .fare-label {
            font-size: 1.15rem;
            color: #065f46;
            font-weight: 600;
        }

        .fare-value {
            font-size: 1.7rem;
            font-weight: 800;
            color: #059669;
            margin-top: 6px;
        }

        .btn {
            display: inline-block;
            margin-top: 2.2rem;
            padding: 14px 40px;
            background: linear-gradient(90deg, #1d4ed8, #3b82f6);
            color: white;
            text-decoration: none;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 12px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(29, 78, 216, 0.25);
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(29, 78, 216, 0.4);
            background: linear-gradient(90deg, #1e40af, #2563eb);
        }

        .footer-note {
            margin-top: 2rem;
            font-size: 0.95rem;
            color: #6b7280;
        }

        @media (max-width: 520px) {
            .receipt-container {
                padding: 2.2rem 1.6rem;
            }
            h2 {
                font-size: 1.9rem;
            }
            .fare-value {
                font-size: 1.5rem;
            }
        }

        @media print {
            body { background: white; }
            .receipt-container {
                box-shadow: none;
                border: 1px solid #ddd;
            }
            .btn, .footer-note {
                display: none;
            }
        }
    </style>
</head>
<body>

<div class="receipt-container">
    <div class="header">
        <h2>Travel Receipt <span class="emoji">🧾</span></h2>
    </div>

    <div class="divider"></div>

    <div class="details">
        <div class="detail-row">
            <span class="label">From:</span>
            <span class="value">${param.from}</span>
        </div>
        <div class="detail-row">
            <span class="label">To:</span>
            <span class="value">${param.to}</span>
        </div>

        <div class="fare-row">
            <div class="fare-label">Total Fare</div>
            <div class="fare-value">₹${param.fare}</div>
        </div>
    </div>

    <a href="history.jsp" class="btn">Check History</a>

    <div class="footer-note">
        Thank you for choosing MetroPay • Safe & Happy Journey!
    </div>
</div>

</body>
</html>