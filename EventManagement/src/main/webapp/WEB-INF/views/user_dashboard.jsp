<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.eventmanagement.model.Event"%>
<%@ page import="java.util.List"%>

<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-color: #f7f8fc;
        }
        .container {
            margin-top: 40px;
        }
        .dashboard-header {
            color: #333;
            margin-bottom: 20px;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.02);
        }
        .card-title {
            color: #007bff;
            font-weight: bold;
        }
        .text-danger {
            font-size: 0.9em;
        }
        .btn-success[disabled] {
            cursor: not-allowed;
        }
        .action-buttons {
            display: flex;
            justify-content: flex-end;
        }
        .action-buttons a {
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div class="container my-4">
        <div class="dashboard-header text-center">
            <h2>Welcome to Your Dashboard</h2>
        </div>

        <!-- Action buttons for 'Your Bookings' and 'Logout' -->
        <div class="action-buttons mb-4">
            <a href="${pageContext.request.contextPath}/user/bookings" class="btn btn-primary">
                <i class="fas fa-calendar-check"></i> Your Bookings
            </a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>

        <h3 class="mb-4">Available Events</h3>

        <div class="row">
            <%
            List<Event> events = (List<Event>) request.getAttribute("events");
            if (events != null && !events.isEmpty()) {
                for (Event event : events) {
                    boolean isClosed = "Closed".equalsIgnoreCase(event.getStatus());
            %>
                <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                    <div class="card h-100">
                        <img src="<%= event.getImageUrl() != null ? event.getImageUrl() : "https://via.placeholder.com/300x200" %>" class="card-img-top" alt="Event Image">

                        <div class="card-body">
                            <h5 class="card-title"><%= event.getName() %></h5>
                            <p class="card-text"><%= event.getDescription() %></p>
                            <p><strong><i class="fas fa-calendar-alt"></i> Date:</strong> <%= event.getDate() %></p>
                            <p><strong><i class="fas fa-map-marker-alt"></i> Venue:</strong> <%= event.getVenue() != null ? event.getVenue().getName() : "N/A" %></p>
                            <p><strong><i class="fas fa-info-circle"></i> Status:</strong> <%= event.getStatus() != null ? event.getStatus() : "N/A" %></p>
                            
                            <% if (isClosed) { %>
                                <p class="text-danger"><strong>RSVP is closed for this event.</strong></p>
                            <% } else { %>
                                <p class="text-danger" id="date-warning-<%= event.getId() %>"></p>
                            <% } %>
                        </div>
                        <div class="card-footer text-center">
                            <form action="<%= request.getContextPath() %>/user/rsvp" method="get">
                                <input type="hidden" name="eventId" value="<%= event.getId() %>">
                                <button type="submit" class="btn btn-success" 
                                        id="rsvp-button-<%= event.getId() %>" 
                                        <%= isClosed ? "disabled" : "" %>>
                                    <i class="fas fa-check"></i> RSVP
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                <script>
                    // Disable RSVP button if event date has passed
                    (function() {
                        const eventDate = new Date("<%= event.getDate() %>");
                        const currentDate = new Date();
                        
                        if (eventDate < currentDate) {
                            document.getElementById("rsvp-button-<%= event.getId() %>").disabled = true;
                            document.getElementById("date-warning-<%= event.getId() %>").innerText = "The date for this event has passed.";
                        }
                    })();
                </script>
            <%
                }
            } else {
            %>
                <div class="col-12">
                    <p class="text-center">No events available.</p>
                </div>
            <%
            }
            %>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
