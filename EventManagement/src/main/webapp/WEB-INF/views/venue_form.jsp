<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.eventmanagement.model.Venue" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Venue Management</title>
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

        <h2 class="text-center mb-4">Manage Venues</h2>

        <!-- Venue Form -->
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                <h5 class="card-title mb-0">Add or Edit Venue</h5>
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/admin/saveVenue" method="post">
                    <input type="hidden" name="id" value="${venue.id}">

                    <div class="form-group">
                        <label for="name">Venue Name:</label>
                        <input type="text" class="form-control" id="name" name="name" value="${venue.name}" required>
                    </div>

                    <div class="form-group">
                        <label for="location">Location:</label>
                        <input type="text" class="form-control" id="location" name="location" value="${venue.location}" required>
                    </div>

                    <div class="form-group">
                        <label for="capacity">Capacity:</label>
                        <input type="number" class="form-control" id="capacity" name="capacity" value="${venue.capacity}" required>
                    </div>

                    <button type="submit" class="btn btn-success">Save Venue</button>
                </form>
            </div>
        </div>

        <!-- Existing Venues Section -->
        <h3 class="mb-3">Existing Venues</h3>
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Name</th>
                        <th>Location</th>
                        <th>Capacity</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Retrieve the list of venues from the request attribute
                        List<Venue> venues = (List<Venue>) request.getAttribute("venues");
                        if (venues != null && !venues.isEmpty()) {
                            for (Venue venue : venues) {
                    %>
                        <tr>
                            <td><%= venue.getName() %></td>
                            <td><%= venue.getLocation() %></td>
                            <td><%= venue.getCapacity() %></td>
                            <td>
                                <a href="<%= request.getContextPath() %>/admin/editVenue?id=<%= venue.getId() %>" class="btn btn-warning btn-sm">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                                <a href="<%= request.getContextPath() %>/admin/deleteVenue?id=<%= venue.getId() %>" class="btn btn-danger btn-sm">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </a>
                            </td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="4" class="text-center">No venues available.</td>
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
