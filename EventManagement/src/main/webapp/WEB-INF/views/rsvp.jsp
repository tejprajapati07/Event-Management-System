<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>RSVP Event</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Custom styling for the RSVP form */
        body {
            background-color: #f7f8fc;
        }
        .container {
            margin-top: 50px;
            max-width: 600px;
        }
        .form-title {
            font-weight: bold;
            color: #007bff;
        }
        .form-label {
            font-weight: 500;
        }
        .form-control {
            box-shadow: none;
        }
        .btn-primary {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Back to Event List Button -->
        <div class="d-flex justify-content-start mb-3">
            <a href="${pageContext.request.contextPath}/user/dashboard" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Back to Event List
            </a>
        </div>

        <h2 class="form-title text-center mb-4">RSVP for <%= request.getAttribute("eventName") %></h2>
        <form action="<%= request.getContextPath() %>/user/rsvp" method="post" class="shadow p-4 bg-white rounded">
            <input type="hidden" name="eventId" value="<%= request.getAttribute("eventId") %>">

            <div class="form-group">
                <label for="numTickets" class="form-label"><i class="fas fa-ticket-alt"></i> Number of Tickets:</label>
                <input type="number" id="numTickets" name="numTickets" class="form-control" required min="1">
            </div>

            <div class="form-group">
                <label for="name" class="form-label"><i class="fas fa-user"></i> Booking Person's Name:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="email" class="form-label"><i class="fas fa-envelope"></i> Booking Person's Email:</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-primary"><i class="fas fa-paper-plane"></i> Submit RSVP</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
