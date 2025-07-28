<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Number Guessing Game</title>
  <style>
    body {
      background-image: url('https://img.freepik.com/free-photo/colourful-math-numbers-letters-frame-with-copy-space-top-view_23-2148416106.jpg?semt=ais_hybrid&w=740');
      background-size: 100% 80%;
      background-repeat: no-repeat;
      font-family: Arial, sans-serif;
      text-align: center;
      padding-top: 50px;
      color: darkblue;
      font-style : bold;
    }

    .container {
      background: transparent;
      margin-bottom: 20px;
      display: inline-block;
      padding: 30px;
      border-radius: 20px;
      justify-content:center;
      align-items:center;
      place-items:center;
      min-height:100vh;
    }

    input[type="number"] {
      padding: 10px;
      font-size: 18px;
      width: 200px;
      margin-bottom: 20px;
    }

    button {
      padding: 10px 20px;
      font-size: 18px;
      background-color: #00b894;
      color: white;
      border: none;
      border-radius: 10px;
      cursor: pointer;
    }

    .restart-btn {
      display: inline-block;
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #6c5ce7;
      color: white;
      text-decoration: none;
      border-radius: 10px;
    }

    .image-box img {
      margin-top: 20px;
      width: 300px;
    }

    .result {
      font-size: 24px;
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Guess the Number (1 to 100)</h1>
    <form action="GuessServlet" method="post">
      <input type="number" name="guess" required min="1" max="100"><br>
      <button type="submit">Guess</button>
    </form>

    <div class="result">
      <c:if test="${not empty message}">
        ${message}
      </c:if>
    </div>

    <div class="image-box">
      <c:if test="${not empty imageUrl}">
        <img src="${imageUrl}" alt="Result Image" />
      </c:if>
    </div>

    <div>
      <a href="index.jsp" class="restart-btn">Try Again</a>
    </div>
  </div>
</body>
</html>
