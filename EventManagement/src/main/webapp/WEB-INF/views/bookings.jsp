<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.eventmanagement.model.RSVP" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Your Bookings</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Additional custom styling for the Bookings table */
        body {
            background-color: #f7f8fc;
        }
        .container {
            margin-top: 50px;
        }
        .table th {
            background-color: #007bff;
            color: white;
        }
        .no-bookings {
            text-align: center;
            color: #666;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Back to User Dashboard Button -->
        <div class="d-flex justify-content-start mb-3">
            <a href="${pageContext.request.contextPath}/user/dashboard" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Back to User Dashboard
            </a>
        </div>

        <h2 class="text-center my-4">Your Bookings</h2>
        
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="thead-light">
                    <tr>
                        <th>Event Name</th>
                        <th>Number of Tickets</th>
                        <th>Booking Name</th>
                        <th>Booking Email</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<RSVP> bookings = (List<RSVP>) request.getAttribute("bookings");
                        if (bookings != null && !bookings.isEmpty()) {
                            for (RSVP booking : bookings) {
                                // Determine row class based on booking status
                                String rowClass = "";
                                String status = booking.getStatus();
                                if ("Cancelled".equalsIgnoreCase(status)) {
                                    rowClass = "table-danger";
                                } else if ("Confirmed".equalsIgnoreCase(status)) {
                                    rowClass = "table-success";
                                } else if ("Pending".equalsIgnoreCase(status)) {
                                    rowClass = "table-warning";
                                }
                    %>
                        <tr class="<%= rowClass %>">
                            <td><%= booking.getEvent().getName() %></td>
                            <td><%= booking.getNumTickets() %></td>
                            <td><%= booking.getBookingName() %></td>
                            <td><%= booking.getBookingEmail() %></td>
                            <td>
                                <%= booking.getStatus() %>
                                <%-- Optional FontAwesome icon for status --%>
                                <i class="<%= "Confirmed".equalsIgnoreCase(status) ? "fas fa-check-circle text-success" : 
                                            "Cancelled".equalsIgnoreCase(status) ? "fas fa-times-circle text-danger" : 
                                            "Pending".equalsIgnoreCase(status) ? "fas fa-hourglass-half text-warning" : "" %>"></i>
                            </td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="5" class="no-bookings">No bookings available.</td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
