<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survey Result</title>
    <link rel="stylesheet" href="main.css">
</head>
<body>
    <main>
        <!-- Logo -->
        <div class="logo">
            <img src="images.jpg" alt="Murach Logo" class="logo-img">
        </div>

        <h1>Survey Result</h1>
        <p>Here is the information that you entered:</p>

        <h2>Your Information</h2>
        <p><strong>First Name:</strong> ${firstName}</p>
        <p><strong>Last Name:</strong> ${lastName}</p>
        <p><strong>Email:</strong> ${email}</p>
        <p><strong>Date of Birth:</strong> ${dob}</p>

        <h2>How did you hear about us?</h2>
        <p><strong>Heard about us:</strong> ${hearAbout}</p>

        <h2>Announcements</h2>
        <p><strong>Receive announcements:</strong> ${announcements}</p>
        <p><strong>Receive email announcements:</strong> ${emailAnnouncements}</p>

        <h2>Contact Preference</h2>
        <p><strong>Contact by:</strong> ${contactBy}</p>

        <div class="button-row">
            <a href="index.html" class="btn">Return</a>
        </div>
    </main>
</body>
</html>