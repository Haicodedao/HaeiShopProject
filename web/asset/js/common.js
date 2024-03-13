function changeIcon(obj) {
            var id = obj.previousSibling.previousSibling.id;

            var inputP = document.getElementById(id);
            if (obj.className == 'fa-solid fa-eye-slash') {
                obj.className = 'fa-solid fa-eye';
                inputP.type = 'text';
            } else {
                obj.className = 'fa-solid fa-eye-slash';
                inputP.type = 'password';
            }
        }

        function checkSame(obj) {
            var text = document.getElementById("text1");
            if (text.style.display == 'none') {
                var a = document.getElementById("pass1");
                if (obj.value !== a.value) {
                    var text = document.getElementById("text");
                    text.style.display = "block";
                    text.textContent = "Mật khẩu mới không khớp. Vui lòng nhập lại mật khẩu mới của bạn tại đây.";
                } else {
                    var text = document.getElementById("text");
                    text.style.display = "none";
                }
            }
        }

        function checkNumberCharacter(obj) {
            var a = document.getElementById("pass1");
            if (obj.value.length <= 5) {
                var text = document.getElementById("text1");
                text.style.display = "block";
                text.textContent = "Mật khẩu này phải có nhiều hơn 6 ký tự và khó để người khác đoán được.";
            } else {
                var text = document.getElementById("text1");
                text.style.display = "none";
            }
        }

        function checkPass() {
            var a = document.getElementById("pass1").value;
            var b = document.getElementById("pass2").value;
            if (a == b && a.length > 5) {
                document.getElementById("f1").submit();
            } else {
                document.getElementById("rule").style.color = "red";
            }
        }