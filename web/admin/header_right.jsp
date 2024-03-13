<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                margin: 0;
                padding: 0;
            }

            .header {
                width: 100%;
                height: 60px; 
                background-color: #3498db;
                color: white;
                display: flex;
                text-align: center;
                justify-content: center;
                align-items: center;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                overflow: hidden; /* Ensure text doesn't overflow horizontally */
            }

            .header h1 {
                margin: 0;
                font-size: 30px;
                overflow: hidden;
                white-space: nowrap; 
                animation: slideRight 5s linear infinite; 
            }

            @keyframes slideRight {
                0% {
                    transform: translateX(-100%);
                    opacity: 0;
                }
                25% {
                    opacity: 1;
                }
                75% {
                    opacity: 1;
                }
                100% {
                    transform: translateX(100%);
                    opacity: 0;
                }
            }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>Chào Mừng Admin Quay Trở Lại</h1>
        </div>
    </body>
</html>
