<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Custom styling for Admin Dashboard */
        body {
            background-color: #f7f8fc;
        }
        .dashboard-container {
            margin-top: 50px;
        }
        .card {
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card i {
            font-size: 2.5rem;
        }
    </style>
</head>
<body>
    <div class="container dashboard-container">
        <h2 class="text-center my-4">Admin Dashboard</h2>

        <div class="row text-center">
            <!-- Manage Events Card -->
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card border-primary h-100">
                    <div class="card-body">
                        <i class="fas fa-calendar-alt text-primary mb-3"></i>
                        <h5 class="card-title">Manage Events</h5>
                        <p class="card-text">Create, update, and manage all events.</p>
                        <a href="${pageContext.request.contextPath}/admin/events" class="btn btn-primary">Go to Events</a>
                    </div>
                </div>
            </div>

            <!-- Manage Venues Card -->
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card border-info h-100">
                    <div class="card-body">
                        <i class="fas fa-map-marker-alt text-info mb-3"></i>
                        <h5 class="card-title">Manage Venues</h5>
                        <p class="card-text">Add and edit venues for upcoming events.</p>
                        <a href="${pageContext.request.contextPath}/admin/venues" class="btn btn-info">Go to Venues</a>
                    </div>
                </div>
            </div>

            <!-- Manage Bookings Card -->
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card border-success h-100">
                    <div class="card-body">
                        <i class="fas fa-users text-success mb-3"></i>
                        <h5 class="card-title">Manage Bookings</h5>
                        <p class="card-text">View and manage event bookings.</p>
                        <a href="${pageContext.request.contextPath}/admin/manage-rsvps" class="btn btn-success">Go to Bookings</a>
                    </div>
                </div>
            </div>

            <!-- Logout Card -->
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card border-danger h-100">
                    <div class="card-body">
                        <i class="fas fa-sign-out-alt text-danger mb-3"></i>
                        <h5 class="card-title">Logout</h5>
                        <p class="card-text">Sign out of your admin account securely.</p>
                        <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
