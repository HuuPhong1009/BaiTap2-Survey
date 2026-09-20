package murach;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/survey")
public class SurveyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Set character encoding
        request.setCharacterEncoding("UTF-8");

        // 1. Get parameters from the request
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String hearAbout = request.getParameter("hear_about");
        String announcements = request.getParameter("announcements");
        String emailAnnouncements = request.getParameter("email_announcements");
        String contactBy = request.getParameter("contact_by");

        // Checkbox normalization: if unchecked, parameter is null
        announcements = (announcements != null) ? "Yes" : "No";
        emailAnnouncements = (emailAnnouncements != null) ? "Yes" : "No";

        // Normalize hearAbout values
        if ("search".equalsIgnoreCase(hearAbout)) {
            hearAbout = "Search engine";
        } else if ("mouth".equalsIgnoreCase(hearAbout)) {
            hearAbout = "Word of mouth";
        } else if ("social".equalsIgnoreCase(hearAbout)) {
            hearAbout = "Social Media";
        } else if ("other".equalsIgnoreCase(hearAbout)) {
            hearAbout = "Other";
        }

        // Normalize contactBy values
        if ("both".equalsIgnoreCase(contactBy)) {
            contactBy = "Email or postal mail";
        } else if ("email".equalsIgnoreCase(contactBy)) {
            contactBy = "Email";
        } else if ("postal".equalsIgnoreCase(contactBy)) {
            contactBy = "Postal mail";
        }

        // 2. Store data in request attribute
        request.setAttribute("firstName", firstName);
        request.setAttribute("lastName", lastName);
        request.setAttribute("email", email);
        request.setAttribute("dob", dob);
        request.setAttribute("hearAbout", hearAbout);
        request.setAttribute("announcements", announcements);
        request.setAttribute("emailAnnouncements", emailAnnouncements);
        request.setAttribute("contactBy", contactBy);

        // 3. Forward request and response to JSP
        String url = "/survey_result.jsp";
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}