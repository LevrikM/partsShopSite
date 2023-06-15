<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3 mt-5">
            <h2 class="text-center mb-4">Авторизація</h2>
            <form method="POST">
                <div class="form-group">
                    <label for="email">
                        Пошта
                        <span class="text-danger">*</span>
                    </label>
                    <input type="email" class="form-control" name="userEmail" id="email" placeholder="Введіть пошту" required>
                </div>
                <div class="form-group">
                    <label for="password">
                        Пароль
                        <span class="text-danger">*</span>
                    </label>
                    <input type="password" class="form-control" name="userPass" id="password" placeholder="Введіть пароль" required>
                </div>
                <button type="submit" class="btn btn-primary">Увійти</button>
                <a href="http://auto/user/registration/" class="btn btn-secondary">Реєстрація</a>
            </form>
        </div>
    </div>
</div>