function submitForm() {
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    // Aquí puedes realizar una llamada AJAX para enviar los datos al servidor
    // y manejar la autenticación. Por ahora, simplemente mostraremos un mensaje.
    if (username == 'usuario' && password == 'contrasena') {
        document.getElementById('message').innerText = 'Inicio de sesión exitoso '+username;
    } else {
        document.getElementById('message').innerText = 'Credenciales incorrectas '+username;
    }
}
