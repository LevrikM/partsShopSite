<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3 mt-5">
            <h2 class="text-center mb-4">Реєстрація</h2>
            <form method="POST">
                <div class="form-group">
                    <label for="userName">
                        Ім'я
                        <span class="text-danger">*</span>
                    </label>
                    <input type="text" class="form-control" name="userName" id="userName" placeholder="Введіть ім'я" required>
                </div>
                <div class="form-group">
                    <label for="userEmail">
                        Пошта
                        <span class="text-danger">*</span>
                    </label>
                    <input type="email" class="form-control" name="userEmail" id="userEmail" placeholder="Введіть пошту" required>
                </div>
                <div class="form-group">
                    <label for="userPhone">
                        Номер телефону
                        <span class="text-danger">*</span>
                    </label>
                    <div class="input-group">
                        <span class="input-group-text">+380</span>
                        <input type="number" class="form-control" name="userPhone" id="userPhone" placeholder="Введіть номер телефону" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="userPass">
                        Пароль
                        <span class="text-danger">*</span>
                    </label>
                    {literal}
                    <input type="password"
                           class="form-control"
                           name="userPass"
                           id="userPass"
                           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                           title="Має містити принаймні одну цифру, одну велику та малу літеру та принаймні 8 або більше символів"
                           required>
                    {/literal}
                </div>
                <button type="submit" class="btn btn-primary">Зареєструватись</button>
                <a href="http://auto/user/auth/" class="btn btn-secondary">Авторизація</a>
            </form>
        </div>
    </div>
</div>