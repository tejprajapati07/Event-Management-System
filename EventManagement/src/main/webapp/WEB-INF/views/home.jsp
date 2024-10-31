<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Event Management System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Full-page styling */
        body, html {
            height: 100%;
            margin: 0;
            background-color: #f1f1f1;
            font-family: Arial, sans-serif;
        }

        .container {
            text-align: center;
            padding-top: 3rem; /* Added padding to move content down */
        }

        /* Styled Heading at the Top */
        .heading {
            font-size: 2.5rem;
            color: #000;
            font-weight: bold;
            text-align: center;
            margin-bottom: 2rem;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);
        }

        .card-container {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-top: 1rem;
            flex-wrap: wrap;
        }

        .card {
            width: 280px;
            padding: 1.5rem;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background-color: #ffffff;
            transition: transform 0.2s ease-in-out;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card i {
            font-size: 3rem;
            color: #007bff;
            margin-bottom: 1rem;
        }

        .card-title {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: #333;
        }

        .btn-custom {
            margin-top: 1rem;
            width: 100%;
            padding: 0.75rem;
            font-size: 1.1rem;
            border-radius: 5px;
            color: #fff;
            font-weight: bold;
        }

        .btn-login {
            background-color: #007bff;
        }

        .btn-register {
            background-color: #28a745;
        }

        .btn-login:hover {
            background-color: #0056b3;
        }

        .btn-register:hover {
            background-color: #218838;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .card-container {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Heading with Padding at the Top -->
        <div class="heading">
            Welcome to the Event Management System
        </div>

        <!-- Card Section -->
        <div class="card-container">
            <!-- Login Card -->
            <div class="card">
                <i class="fas fa-sign-in-alt"></i>
                <div class="card-title">Login</div>
                <p>Access your account and manage your events with ease.</p>
                <a href="${pageContext.request.contextPath}/login" class="btn btn-custom btn-login">Login</a>
            </div>

            <!-- Register Card -->
            <div class="card">
                <i class="fas fa-user-plus"></i>
                <div class="card-title">Register</div>
                <p>Create a new account to start organizing your events today.</p>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-custom btn-register">Register</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
