FROM tomcat:9.0-jdk17-temurin

# 1. Xoa cac app mac dinh cua Tomcat de web chay o thu muc goc (ROOT)
RUN rm -rf /usr/local/tomcat/webapps/*

# 2. Tat cong shutdown 8005 de tranh loi tren Render
RUN sed -i 's/port="8005"/port="-1"/' /usr/local/tomcat/conf/server.xml

# 3. Copy toan bo file giao dien vao ROOT
COPY web /usr/local/tomcat/webapps/ROOT

# 4. Copy ma nguon va bien dich Servlet
COPY src /app/src
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes && \
    javac --release 8 -cp "/usr/local/tomcat/lib/servlet-api.jar" -d "/usr/local/tomcat/webapps/ROOT/WEB-INF/classes" /app/src/murach/SurveyServlet.java

# 5. Gan cong Render (PORT) vao Tomcat khi khoi dong
CMD ["sh", "-c", "sed -i 's/port=\"8080\"/port=\"'\"${PORT:-8080}\"'\"/' /usr/local/tomcat/conf/server.xml && catalina.sh run"]
