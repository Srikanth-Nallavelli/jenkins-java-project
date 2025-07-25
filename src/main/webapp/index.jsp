<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, java.util.*" %>
<html>
<head>
    <title>Simple JSP Calculator</title>
</head>
<body>
    <h2>Srikanth Calculator</h2>
    <form method="post">
        Number 1: <input type="text" name="num1"><br><br>
        Number 2: <input type="text" name="num2"><br><br>

        Operation:
        <select name="operation">
            <option value="add">Add</option>
            <option value="sub">Subtract</option>
            <option value="mul">Multiply</option>
            <option value="div">Divide</option>
        </select><br><br>

        <input type="submit" value="Calculate">
    </form>

<%
    String n1 = request.getParameter("num1");
    String n2 = request.getParameter("num2");
    String op = request.getParameter("operation");

    if (n1 != null && n2 != null && op != null) {
        try {
            double a = Double.parseDouble(n1);
            double b = Double.parseDouble(n2);
            double result = 0;

            switch (op) {
                case "add":
                    result = a + b;
                    break;
                case "sub":
                    result = a - b;
                    break;
                case "mul":
                    result = a * b;
                    break;
                case "div":
                    if (b != 0) {
                        result = a / b;
                    } else {
                        out.println("<p style='color:red;'>Cannot divide by zero.</p>");
                        return;
                    }
                    break;
                default:
                    out.println("<p style='color:red;'>Invalid operation selected.</p>");
                    return;
            }

            out.println("<h3>Result: " + result + "</h3>");
        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>Please enter valid numbers.</p>");
        }
    }
%>

</body>
</html>
