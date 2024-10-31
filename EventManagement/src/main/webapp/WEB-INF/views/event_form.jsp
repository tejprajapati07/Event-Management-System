<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.eventmanagement.model.Event" %>
<%@ page import="com.eventmanagement.model.Venue" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Event Management</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="container my-4">
        <!-- Back to Dashboard Button -->
        <div class="d-flex justify-content-start mb-3">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Back to Admin Dashboard
            </a>
        </div>

        <h2 class="text-center mb-4">Manage Events</h2>

        <%
            Event event = (Event) request.getAttribute("event");
            if (event == null) {
                event = new Event();
            }

            List<Venue> venues = (List<Venue>) request.getAttribute("venues");
            List<Event> events = (List<Event>) request.getAttribute("events");
        %>

        <!-- Event Form -->
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                <h5 class="card-title mb-0">Add or Edit Event</h5>
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/admin/saveEvent" method="post">
                    <input type="hidden" name="id" value="<%= event.getId() != null ? event.getId() : "" %>">

                    <div class="form-group">
                        <label for="name">Event Name:</label>
                        <input type="text" class="form-control" id="name" name="name" value="<%= event.getName() != null ? event.getName() : "" %>" required>
                    </div>

                    <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea class="form-control" id="description" name="description"><%= event.getDescription() != null ? event.getDescription() : "" %></textarea>
                    </div>

                    <div class="form-group">
                        <label for="date">Date:</label>
                        <input type="date" class="form-control" id="date" name="date" value="<%= event.getDate() != null ? event.getDate() : "" %>" required>
                    </div>

                    <div class="form-group">
                        <label for="venue">Venue:</label>
                        <select class="form-control" id="venue" name="venue.id" required>
                            <%
                                if (venues != null) {
                                    for (Venue venue : venues) {
                                        String selected = (event.getVenue() != null && venue.getId().equals(event.getVenue().getId())) ? "selected" : "";
                            %>
                                        <option value="<%= venue.getId() %>" <%= selected %>><%= venue.getName() %></option>
                            <%
                                    }
                                } else {
                            %>
                                <option value="">No venues available</option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="imageUrl">Image URL:</label>
                        <input type="text" class="form-control" id="imageUrl" name="imageUrl" value="<%= event.getImageUrl() != null ? event.getImageUrl() : "" %>">
                    </div>

                    <div class="form-group">
                        <label for="status">Status:</label>
                        <select class="form-control" id="status" name="status" required>
                            <option value="Open" <%= "Open".equals(event.getStatus()) ? "selected" : "" %>>Open</option>
                            <option value="Closed" <%= "Closed".equals(event.getStatus()) ? "selected" : "" %>>Closed</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-success">Save Event</button>
                </form>
            </div>
        </div>

        <!-- Existing Events Section -->
        <h3 class="mb-3">Existing Events</h3>
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Date</th>
                        <th>Venue</th>
                        <th>Image URL</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (events != null) {
                            for (Event e : events) {
                    %>
                        <tr>
                            <td><%= e.getName() %></td>
                            <td><%= e.getDescription() %></td>
                            <td><%= e.getDate() %></td>
                            <td><%= e.getVenue() != null ? e.getVenue().getName() : "N/A" %></td>
                            <td><%= e.getImageUrl() != null ? e.getImageUrl() : "N/A" %></td>
                            <td><%= e.getStatus() %></td>
                            <td>
                                <a href="<%= request.getContextPath() %>/admin/editEvent?id=<%= e.getId() %>" class="btn btn-warning btn-sm">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                                <a href="<%= request.getContextPath() %>/admin/deleteEvent?id=<%= e.getId() %>" class="btn btn-danger btn-sm">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </a>
                            </td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="7" class="text-center">No events available.</td>
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
