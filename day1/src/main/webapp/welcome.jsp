<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Welcome !!!</title>
    <link rel="stylesheet" href="./css/style.css">
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
    />
    <style>
        .title{
            background-color: orange;
        }
    </style>
    
  </head>
  <body>
    <div class="root">
      <header>
        <div class="top-menu">
          <i class="fa-brands fa-apple"></i>
          &nbsp;HOME
        </div>
        <div class="title">
          <%! String greeting = "Welcome to Book Shooping Mall"; String tagline
          = "Welcome to Web Market!"; %>
          <h1><%= greeting %></h1>
          <h3><%= tagline %></h3>
        </div>
      </header>
      <section class="container">
        <h3><%= tagline %></h3>
      </section>
      <footer>&copy; BookMarket</footer>
    </div>
  </body>
</html>
