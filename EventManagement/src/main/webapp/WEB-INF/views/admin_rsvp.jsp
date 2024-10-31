<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.eventmanagement.model.RSVP" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Manage Bookings</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .status-pending {
            background-color: #ffeeba; /* Light yellow background for Pending status */
        }
    </style>
</head>
<body>
    <div class="container my-4">
        <!-- Back to Dashboard Button -->
        <div class="d-flex justify-content-start mb-3">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Back to Admin Dashboard
            </a>
        </div>

        <h2 class="text-center mb-4">Manage Bookings</h2>

        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Event Name</th>
                        <th>Number of Tickets</th>
                        <th>Booking Name</th>
                        <th>Booking Email</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<RSVP> rsvps = (List<RSVP>) request.getAttribute("rsvps");
                        if (rsvps != null && !rsvps.isEmpty()) {
                            for (RSVP rsvp : rsvps) {
                                String statusClass;
                                if ("Confirmed".equalsIgnoreCase(rsvp.getStatus())) {
                                    statusClass = "table-success"; // Green for Confirmed
                                } else if ("Cancelled".equalsIgnoreCase(rsvp.getStatus())) {
                                    statusClass = "table-danger"; // Red for Cancelled
                                } else {
                                    statusClass = "status-pending"; // Light yellow for Pending
                                }
                    %>
                        <tr class="<%= statusClass %>">
                            <td><%= rsvp.getEvent().getName() %></td>
                            <td><%= rsvp.getNumTickets() %></td>
                            <td><%= rsvp.getBookingName() %></td>
                            <td><%= rsvp.getBookingEmail() %></td>
                            <td><span class="badge <%= statusClass.replace("table-", "badge-") %>"><%= rsvp.getStatus() %></span></td>
                            <td>
                                <form action="<%= request.getContextPath() %>/admin/updateStatus" method="post" class="form-inline">
                                    <input type="hidden" name="rsvpId" value="<%= rsvp.getId() %>">
                                    <select name="status" class="custom-select mr-2">
                                        <option value="Pending" <%= "Pending".equalsIgnoreCase(rsvp.getStatus()) ? "selected" : "" %>>Pending</option>
                                        <option value="Confirmed" <%= "Confirmed".equalsIgnoreCase(rsvp.getStatus()) ? "selected" : "" %>>Confirmed</option>
                                        <option value="Cancelled" <%= "Cancelled".equalsIgnoreCase(rsvp.getStatus()) ? "selected" : "" %>>Cancelled</option>
                                    </select>
                                    <button type="submit" class="btn btn-primary btn-sm">
                                        <i class="fas fa-sync-alt"></i> Update
                                    </button>
                                </form>
                            </td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="6" class="text-center">No bookings available.</td>
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
