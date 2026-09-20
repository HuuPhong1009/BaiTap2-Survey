FROM tomcat:9.0-jdk17-temurin

# Xoa cac app mac dinh cua Tomcat de chay o thu muc goc (ROOT)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy toan bo file giao dien (HTML, JSP, CSS, images, WEB-INF) vao ROOT
COPY web /usr/local/tomcat/webapps/ROOT

# Copy ma nguon va bien dich Servlet bang thu vien co san cua Tomcat
COPY src /app/src
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes && \
    javac --release 8 -cp "/usr/local/tomcat/lib/servlet-api.jar" -d "/usr/local/tomcat/webapps/ROOT/WEB-INF/classes" /app/src/murach/SurveyServlet.java

EXPOSE 8080
CMD ["catalina.sh", "run"]
